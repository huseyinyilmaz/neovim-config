local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
	return
end



orgmode.setup({})
