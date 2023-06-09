mkdir -p /tmp/yay-build && \
    useradd -m -G wheel builder && passwd -d builder && \
    chown -R builder:builder /tmp/yay-build && \
    echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    su - builder -c "git clone https://aur.archlinux.org/yay.git /tmp/yay-build/yay" && \
    su - builder -c "cd /tmp/yay-build/yay && makepkg -si --noconfirm" && \
    su - builder -c "yay -S zsh --noconfirm" && \
    su - builder -c "yay -S --noconfirm zsh-theme-powerlevel10k-git"  && \
    echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc && \
    curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh && \
    chsh -s /usr/bin/zsh && \
    rm -rf /tmp/yay-build