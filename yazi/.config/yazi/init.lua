require("full-border"):setup{
    type = ui.Border.Rounded
}

-- gvfs.yazi — mount/unmount remote & local devices via GVFS
require("gvfs"):setup({
	save_path = os.getenv("HOME") .. "/.config/yazi/gvfs.private",
	save_path_automounts = os.getenv("HOME") .. "/.config/yazi/gvfs_automounts.private",
})


-- Show symlink in status bar
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)
