local palette

if vim.o.background == "dark" then
  palette = {
    base00 = "#212121",
    base01 = "#303030",
    base02 = "#353535",
    base03 = "#4a4a4a",
    base04 = "#b2ccd6",
    base05 = "#eeffff",
    base06 = "#eeffff",
    base07 = "#ffffff",
    base08 = "#f07178",
    base09 = "#f78c6c",
    base0A = "#ffcb6b",
    base0B = "#c3e88d",
    base0C = "#89ddff",
    base0D = "#82aaff",
    base0E = "#c792ea",
    base0F = "#ff5370",
  }
end

if vim.o.background == "light" then
  palette = {
    base00 = "#fafafa",
    base01 = "#e7eaec",
    base02 = "#cceae7",
    base03 = "#ccd7da",
    base04 = "#8796b0",
    base05 = "#80cbc4",
    base06 = "#80cbc4",
    base07 = "#ffffff",
    base08 = "#ff5370",
    base09 = "#f76d47",
    base0A = "#ffb62c",
    base0B = "#91b859",
    base0C = "#39adb5",
    base0D = "#6182b8",
    base0E = "#7c4dff",
    base0F = "#e53935",
  }
end

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = true })
  vim.g.colors_name = "material"
end
