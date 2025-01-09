VERSION="v0.17.0" # Example version, replace with the actual version
wget https://github.com/terraform-docs/terraform-docs/releases/download/${VERSION}/terraform-docs-${VERSION}-linux-amd64.tar.gz
tar -xzf terraform-docs-${VERSION}-linux-amd64.tar.gz
sudo mv terraform-docs /usr/local/bin/

cat <<EOF >> ~/.bashrc
export PATH=$PATH:/usr/local/bin
export AWS_PROFILE=dev
export HTTP_PROXY="http://webproxy.merck.com:8080/"
export HTTPS_PROXY="http://webproxy.merck.com:8080/"
alias tfdocs='terraform-docs markdown . --output-file README.md --header-from main.tf --sort-by required'
EOF
