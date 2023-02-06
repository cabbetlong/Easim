local palette

if vim.o.background == "dark" then
  palette = {
    base00 = "#32302f",
    base01 = "#3c3836",
    base02 = "#5a524c",
    base03 = "#7c6f64",
    base04 = "#bdae93",
    base05 = "#ddc7a1",
    base06 = "#ebdbb2",
    base07 = "#fbf1c7",
    base08 = "#ea6962",
    base09 = "#e78a4e",
    base0A = "#d8a657",
    base0B = "#a9b665",
    base0C = "#89b482",
    base0D = "#7daea3",
    base0E = "#d3869b",
    base0F = "#bd6f3e",
  }
end

if vim.o.background == "light" then
  palette = {
    base00 = "#f2e5bc",
    base01 = "#ebdbb2",
    base02 = "#c9b99a",
    base03 = "#a89984",
    base04 = "#665c54",
    base05 = "#654735",
    base06 = "#3c3836",
    base07 = "#282828",
    base08 = "#c14a4a",
    base09 = "#c35e0a",
    base0A = "#b47109",
    base0B = "#6c782e",
    base0C = "#4c7a5d",
    base0D = "#45707a",
    base0E = "#945e80",
    base0F = "#e78a4e",
  }
end

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = true })
  vim.g.colors_name = "gruvbox"
end
