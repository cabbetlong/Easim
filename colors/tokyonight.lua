local palette

if vim.o.background == "dark" then
  palette = {
    base00 = "#1a1b26",
    base01 = "#16161e",
    base02 = "#2f3549",
    base03 = "#444b6a",
    base04 = "#787c99",
    base05 = "#a9b1d6",
    base06 = "#cbccd1",
    base07 = "#d5d6db",
    base08 = "#c0caf5",
    base09 = "#a9b1d6",
    base0A = "#0db9d7",
    base0B = "#9ece6a",
    base0C = "#b4f9f8",
    base0D = "#2ac3de",
    base0E = "#bb9af7",
    base0F = "#f7768e",
  }
end

if vim.o.background == "light" then
  palette = {
    base00 = "#d5d6db",
    base01 = "#cbccd1",
    base02 = "#dfe0e5",
    base03 = "#9699a3",
    base04 = "#4c505e",
    base05 = "#343b59",
    base06 = "#1a1b26",
    base07 = "#1a1b26",
    base08 = "#343b58",
    base09 = "#965027",
    base0A = "#166775",
    base0B = "#485e30",
    base0C = "#3e6968",
    base0D = "#34548a",
    base0E = "#5a4a78",
    base0F = "#8c4351",
  }
end

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = true })
  vim.g.colors_name = "tokyonight"
end
