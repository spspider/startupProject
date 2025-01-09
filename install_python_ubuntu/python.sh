# cd /usr/src
# wget --no-check-certificate https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tar.xz
# tar -xf Python-3.7.2.tar.xz
# cd Python-3.7.2
# ./configure --enable-optimizations
# sudo make -j 1
# sudo make altinstall
# python3.7 --version


#-----------------------------
wget --no-check-certificate https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tgz
sudo tar xzf Python-3.9.16.tgz
cd Python-3.9.16  sudo ./configure --enable-optimizations  sudo make altinstall
