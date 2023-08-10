require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
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
    }
}

vim.g.polyglot_disabled = {'ftdetect'}
