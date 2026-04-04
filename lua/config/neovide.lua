if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 1
	vim.g.neovide_cursor_vfx_mode = { "pixiedust" } --  es poden posar m'es d'un efecte posant {"efecte1", "efecte2", etc}
	vim.g.neovide_cursor_vfx_particle_lifetime = 3
	vim.g.neovide_cursor_vfx_particle_density = 3
	vim.g.neovide_fullscreen = true
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_theme = "dark" -- auto, light, dark, bg_color
end
