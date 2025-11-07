## How to install (Linux/MacOS/WSL)

### Remove previous config
```sh
rm -rf ~/.config/nvim && rm -rf ~/.local/share/nvim && rm -rf ~/.local/state/nvim 
```

### Installer
```sh
wget -q https://raw.githubusercontent.com/Proteus26/nvim/main/install.sh && chmod +x install.sh && ./install.sh
```

### Clone manually
```sh
git clone https://github.com/Proteus26/nvim.git ~/.config/nvim
```

### Dependencies (if manual install)
* yazi
* yarn
* rust
* fd
* delta
* grcov
* jest
* pytest
* cargo-nextest
* dotnet-runtime
