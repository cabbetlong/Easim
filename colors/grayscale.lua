local palette

if vim.o.background == "dark" then
  palette = {
    base00 = "#101010",
    base01 = "#252525",
    base02 = "#464646",
    base03 = "#525252",
    base04 = "#ababab",
    base05 = "#b9b9b9",
    base06 = "#e3e3e3",
    base07 = "#f7f7f7",
    base08 = "#7c7c7c",
    base09 = "#999999",
    base0A = "#a0a0a0",
    base0B = "#8e8e8e",
    base0C = "#868686",
    base0D = "#686868",
    base0E = "#747474",
    base0F = "#5e5e5e",
  }
end

if vim.o.background == "light" then
  palette = {
    base00 = "#f7f7f7",
    base01 = "#e3e3e3",
    base02 = "#b9b9b9",
    base03 = "#ababab",
    base04 = "#525252",
    base05 = "#464646",
    base06 = "#252525",
    base07 = "#101010",
    base08 = "#7c7c7c",
    base09 = "#999999",
    base0A = "#a0a0a0",
    base0B = "#8e8e8e",
    base0C = "#868686",
    base0D = "#686868",
    base0E = "#747474",
    base0F = "#5e5e5e",
  }
end

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = true })
  vim.g.colors_name = "grayscale"
end
