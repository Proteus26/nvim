**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
2) NVChad, as it is built off of it

# Installation

run the following commands to remove your old/prexisting configs (make sure to back them up somewhere if needed):

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

then, run:

git clone https://github.com/Proteus26/nvim.git ~/.config/nvim && nvim

You can install more LSPs and Linters by running :Mason and then configure it if needed.
