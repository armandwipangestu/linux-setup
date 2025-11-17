FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

ARG APP_VERSION=1.0.0
ENV APP_VERSION=$APP_VERSION

# 1. Install basic packages
RUN apt update && apt install -y \
    git \
    curl \
    sudo \
    fzf \
    zsh \
    bat \
    eza \
    neofetch \
    tmux \
    xclip \
    nmap \
    ncdu \
    btop \
    && apt clean

# 2. Create non-root user with sudo access
RUN useradd -m -s /usr/bin/zsh dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/dev

USER dev
WORKDIR /home/dev

# 3. Copy dotfiles
COPY . /home/dev/.dotfiles
RUN chmod -R 755 /home/dev/.dotfiles

# 4. Run the installer script
RUN /home/dev/.dotfiles/install.sh --skip-interaction

# 5. Set working shell (zsh)
CMD ["/usr/bin/zsh"]
