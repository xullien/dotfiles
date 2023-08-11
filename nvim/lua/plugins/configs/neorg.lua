require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.ui"] = {},
        ["core.itero"] = {},
        ["core.concealer"] = {
            config = {
                icon_preset = "varied",
                icons = {
                    delimiter = {
                        horizontal_line = {
                            highlight = "@neorg.delimiters.horizontal_line",
                        },
                    },
                    code_block = {
                        -- If true will only dim the content of the code block (without the
                        -- `@code` and `@end` lines), not the entirety of the code block itself.
                        content_only = true,
                        conceal = true,

                        -- The width to use for code block backgrounds.
                        --
                        -- When set to `fullwidth` (the default), will create a background
                        -- that spans the width of the buffer.
                        --
                        -- When set to `content`, will only span as far as the longest line
                        -- within the code block.
                        width = "content",

                        -- Additional padding to apply to either the left or the right. Making
                        -- these values negative is considered undefined behaviour (it is
                        -- likely to work, but it's not officially supported).
                        padding = {
                            left = 1,
                            right = 1,
                        },

                        nodes = { "ranged_verbatim_tag" },
                        highlight = "CursorLine",
                        insert_enabled = true,
                    },
                },
            },
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    ideas = "~/notes/ideas",
                    notes = "~/notes",
                },
                default_workspace = "notes"
            }
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = false,
                hook = function(keybinds)
                    -- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
                    keybinds.map("norg", "n", "gtd", "<cmd>echo 'Hello!'<CR>")

                    -- Create a new note
                    keybinds.map_event("norg", "n", "<leader>nn", "core.dirman.new.note", { desc = "Create new Note" })

                    -- All Todo tasks keybinds

                    local event = keybinds.map_event
                    event("norg", "n", "<leader>ntd", "core.qol.todo_items.todo.task_done", {desc = "Mark task as done"})
                    event("norg", "n", "<leader>ntp", "core.qol.todo_items.todo.task_pending", {desc = "Mark task as pending"})
                    event("norg", "n", "<leader>ntu", "core.qol.todo_items.todo.task_undone", {desc = "Mark task as undone"})
                    event("norg", "n", "<leader>nth", "core.qol.todo_items.todo.task_on_hold", {desc = "Mark task as on hold"})
                    event("norg", "n", "<leader>ntc", "core.qol.todo_items.todo.task_cancelled", {desc = "Mark task as cancelled"})
                    event("norg", "n", "<leader>ntr", "core.qol.todo_items.todo.task_recurring", {desc = "Mark task as recurring"})
                    event("norg", "n", "<leader>nti", "core.qol.todo_items.todo.task_important", {desc = "Mark task as important"})
                    event("norg", "n", "<leader>nta", "core.qol.todo_items.todo.task_ambiguous", {desc = "Mark task as ambiguous"})
                    event("norg", "n", "<leader>nc", "core.qol.todo_items.todo.task_cycle", {desc = "Cycle through tast"})

                    event("norg", "n", "<leader>npn", "core.presenter.next_page", {desc = "Next Page"})
                    event("norg", "n", "<leader>ngd", "core.esupports.hop.hop-link", {desc = "Jump to link"})

                    event("norg", "n", "<leader>n<.", "core.promo.promote", {desc = "Promote Object (Non-Recursively)"})
                    event("norg", "n", "<leader>n>.", "core.promo.promote", {desc = "Demote Object (Non-Recursively)"})
                    event("norg", "n", "<leader>n<<", "core.promo.promote", {desc = "Promote Object (Recursively)"})
                    event("norg", "n", "<leader>n>>", "core.promo.promote", {desc = "Demote Object (Recursively)"})
                    -- 
                    --
                    event("norg", "n", "<leader>nlt", "core.pivot.toggle-list-type", {desc = "Toggle (Un)ordered List"})
                    event("norg", "n", "<leader>nli", "core.pivot.invert-list-type", {desc = "Invert (Un)ordered List"})
                    --
                    --
                    --
                    -- event("norg", "n", "<leader>nid", "core.tempus.insert-date", {desc = "Insert Date"})

                end,
            }
        }
        -- ["core.highlights"] = {
        --    config = {
        --         highlights = {
        --             markup = {
        --                 bold = {
        --                     delimiter = "+NonText",
        --                 },
        --             },
        --         },
        --     }, 
        -- },
    }
}

vim.g.polyglot_disabled = {'ftdetect'}
