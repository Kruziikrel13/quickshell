vim.lsp.config("qmlls", {
	cmd = { "qmlls", "-E" },
	filetypes = { "qml", "qmljs" },
})
vim.lsp.enable("qmlls")

return {}
