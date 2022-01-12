FROM ubuntu:22.04

ENV PYTHONUNBUFFERED=1
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install git neovim nodejs npm golang python3 python3-pip wget curl unzip -y
RUN ln -sf /usr/bin/python3 /usr/bin/python
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
COPY . /root/.config/nvim
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
RUN wget https://github.com/cli/cli/releases/download/v2.4.0/gh_2.4.0_linux_amd64.deb && dpkg -i gh*.deb && rm gh*.deb
RUN nvim --headless -c 'lua require("nvim-lsp-installer").install_sync({ "sumneko_lua", "pyright", "gopls" }); vim.cmd("quitall")'
RUN nvim --headless -c 'lua require("nvim-treesitter.install").update({ with_sync = true }); vim.cmd("quitall")'

