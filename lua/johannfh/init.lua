require("johannfh.set")
require("johannfh.remap")
require("johannfh.lazy")
require("johannfh.diagnostic")
require("johannfh.clipboard")

-- autocommand groups below
local augroup = vim.api.nvim_create_augroup
local yank_group = augroup("HighlightYank", {})
local johannfh_group = augroup("johannfh", {})
local autoformatting_group = augroup("AutoFormatting", {})

-- autocommands below
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = yank_group,
    callback = function()
        vim.highlight.on_yank({
            timeout = 50
        })
    end,
})

autocmd("BufWritePre", {
    group = autoformatting_group,
    pattern = "*.go",
    callback = function()
        vim.lsp.buf.format()
    end
})

autocmd("LspAttach", {
    group = johannfh_group,
    callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)

        -- NOTE: This highlights an identifiers occurrences,
        -- when the curser is resting for a while
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = augroup("kickstart-lsp-highlight", { clear = false })
            autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = e.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = e.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                end,
            })
        end

        -- NOTE: The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- WARN: This may be unwanted, since they displace some of your code
        if (
            client and
            client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint)
        ) then
            vim.keymap.set(
                "n",
                "<leader>th",
                function()
                    vim.lsp.inlay_hint.enable(
                        not vim.lsp.inlay_hint.is_enabled({ bufnr = e.buf })
                    )
                end,
                opts
            )
        end
    end,
})
