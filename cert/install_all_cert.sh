folder="merckcert/"
for file in $folder*; do
    if [ -f "$file" ]; then
        echo "$file"
        filename=$(basename $file)
        echo $filename
        mkdir -p /etc/pki/ca-trust/source/anchors
        ## Copy our cleaned-up cert file to the new folder:
        cp $file /etc/pki/ca-trust/source/anchors/"$filename"
        ## Set cert file as executable (TO DO - why? Is this actually required?)
        chmod +x /etc/pki/ca-trust/source/anchors/"$filename"

        ## Finally, update the systems internal certificate store:
        # update-ca-trust
        update-ca-certificates
    fi
done
