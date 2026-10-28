require("config.lazy")

local alacritty_padding_group = vim.api.nvim_create_augroup("AlacrittyPadding", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = alacritty_padding_group,
  callback = function()
    -- Atur padding menjadi 0 saat masuk Neovim
    vim.fn.system("alacritty msg config -w $ALACRITTY_WINDOW_ID 'window.padding={x=0,y=0}'")
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  group = alacritty_padding_group,
  callback = function()
    -- Kembalikan padding ke semula saat keluar (misal: x=10, y=10)
    -- Sesuaikan angka 10 di bawah dengan preferensi default Anda
    vim.fn.system("alacritty msg config -w $ALACRITTY_WINDOW_ID 'window.padding={x=10,y=10}'")
  end,
})
