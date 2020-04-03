for server in $(cat hosts);
do
ssh -i 'private key' user@$server 'bash -s' <./{script to be executed)
if [$? -eq 0]
then echo $server "Connection Success"
else echo $server "Connecton Failed"
fi;
done
