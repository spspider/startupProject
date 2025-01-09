# ordinary way
wget --no-check-certificate -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

#tfenv way
git clone https://github.com/tfutils/tfenv.git ${HOME}/.tfenv
export PATH="${HOME}/.tfenv/bin:${PATH}"
# install to appropriate shell startup file, e.g. $HOME/.bashrc
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ${HOME}/.profile
source ${HOME}/.profile

echo insecure >> ~/.curlrc
echo 'trust-tfenv: yes' > ~/.tfenv/use-gpgv

tfenv list-remote

# now specify version to install terraform:
tfenv install "1.4.6"
tfenv use "1.4.6"


###### install aws cli

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip -y
unzip awscliv2.zip
sudo ./aws/install
echo 'export PATH="export PATH=$PATH:/usr/local/bin' >> ${HOME}/.bashrc
