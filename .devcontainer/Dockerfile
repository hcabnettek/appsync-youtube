ARG VARIANT="20"
FROM mcr.microsoft.com/devcontainers/typescript-node:0-${VARIANT}

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    curl \
    git-core \
    gnupg \
    locales \
    zsh \
    wget \
    tree \
    jq \
    gnupg \
    software-properties-common \
    fonts-powerline \
    # set up locale
    && locale-gen en_US.UTF-8 && fc-cache -vf

ENV DEBIAN_FRONTEND=dialog
SHELL ["/bin/zsh", "-c"]
ENV SHELL=/bin/zsh

ARG USER="node"
ARG GROUP="node"

USER ${USER}

ENV USER=${USER}
ENV GROUP=${GROUP}

RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

RUN gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

RUN sudo apt-get update

RUN sudo apt-get install terraform


# Install Oh-my-ZSH
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Install powerlevel10k
RUN git clone https://github.com/romkatv/powerlevel10k.git /home/${USER}/.oh-my-zsh/custom/themes/powerlevel10k

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

ADD --chown=${USER}:${GROUP} .zshrc /home/${USER}


RUN touch ~/.zshrc
RUN echo "export PATH=$PATH:/usr/local/share/npm-global/lib/node_modules/pnpm/bin" >> ~/.zshrc

RUN terraform -install-autocomplete

ARG NODE_MODULES="pnpm"
RUN umask 0002 && npm install -g ${NODE_MODULES} \
    && npm cache clean --force > /dev/null 2>&1 \
    && source ~/.zshrc

RUN echo $PATH
RUN pnpm setup
