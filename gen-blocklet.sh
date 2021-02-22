BLOCKLET_FOLDER="blocklets/$1"
mkdir -p $BLOCKLET_FOLDER
echo -e "[$1/$2]\n$(cat ./example-blocklet-conf)" > $BLOCKLET_FOLDER/example-config
echo "Blocklet folder created at $BLOCKLET_FOLDER" 
echo "Creating blocklet entry"
cp ./default-blocklet $BLOCKLET_FOLDER/$2
chmod +x "$BLOCKLET_FOLDER/$2"

echo "Blocklet creation complete"
cd "$BLOCKLET_FOLDER"