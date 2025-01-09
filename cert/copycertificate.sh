## Create a folder in the certificate authority structure to hold our self-signed certificates:
# site="registry.terraform.io"
# #https://share.merck.com/display/DBPL/How-To%3A+Merck+Proxy+Signing+Certificate
# openssl s_client -connect $site:443 -showcerts > temp.crt



# exit 0
mkdir -p /etc/pki/ca-trust/source/anchors  
## Copy our cleaned-up cert file to the new folder:
cp temp.crt /etc/pki/ca-trust/source/anchors/self_signed_cert.crt  

## Set cert file as executable (TO DO - why? Is this actually required?)
chmod +x /etc/pki/ca-trust/source/anchors/self_signed_cert.crt

## Finally, update the systems internal certificate store:
# update-ca-trust
update-ca-certificates
#sudo apt-get install -y ca-certificates
