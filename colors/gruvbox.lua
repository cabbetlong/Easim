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
    base08 = "#fb4934",
    base09 = "#fe8019",
    base0A = "#fabd2f",
    base0B = "#b8bb26",
    base0C = "#8ec07c",
    base0D = "#83a598",
    base0E = "#d3869b",
    base0F = "#d65d0e",
  }
end

if vim.o.background == "light" then
  palette = {
    base00 = "#f2e5bc",
    base01 = "#ebdbb2",
    base02 = "#d5c4a1",
    base03 = "#bdae93",
    base04 = "#665c54",
    base05 = "#504945",
    base06 = "#3c3836",
    base07 = "#282828",
    base08 = "#9d0006",
    base09 = "#af3a03",
    base0A = "#b57614",
    base0B = "#79740e",
    base0C = "#427b58",
    base0D = "#076678",
    base0E = "#8f3f71",
    base0F = "#d65d0e",
  }
end

if palette then
  require("mini.base16").setup({ palette = palette, use_cterm = true })
  vim.g.colors_name = "gruvbox"
end
