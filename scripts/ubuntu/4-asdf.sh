echo '---'
echo 'Installing asdf'
echo '---'
ASDF_RELEASE_URL="https://github.com/asdf-vm/asdf/releases/download/v0.16.2/asdf-v0.16.2-linux-amd64.tar.gz"
wget "$ASDF_RELEASE_URL" -O ~/.local/bin/asdf.tar.gz
tar -xzf ~/.local/bin/asdf.tar.gz -C ~/.local/bin
rm ~/.local/bin/asdf.tar.gz
echo '' >> ~/.zprofile
echo 'export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"' >> ~/.zprofile
echo 'fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)' >> ~/.zprofile
echo 'autoload -Uz compinit && compinit' >> ~/.zprofile
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

echo '---'
echo 'Installing deno'
echo '---'
DENO_VER="2.2.0"
asdf plugin add deno https://github.com/asdf-community/asdf-deno.git
asdf install deno $DENO_VER
asdf set -u deno $DENO_VER

echo '---'
echo 'Installing nodejs'
echo '---'
NODE_VER="20.18.3"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs $NODE_VER
asdf set -u nodejs $NODE_VER

echo '---'
echo 'Installing php'
echo '---'
PHP_VER="8.4.4"
asdf plugin add php https://github.com/asdf-community/asdf-php.git
PHP_CONFIGURE_OPTIONS="--with-openssl --with-curl --with-zlib --with-readline --with-gettext --with-sodium" asdf install php $PHP_VER
asdf set -u php $PHP_VER

echo '---'
echo 'Install lua-language-server'
echo '---'
LUA_LANGUAGE_SERVER_VER="3.13.6"
asdf plugin add lua-language-server
asdf install lua-language-server $LUA_LANGUAGE_SERVER_VER
asdf set -u lua-language-server $LUA_LANGUAGE_SERVER_VER
