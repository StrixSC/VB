#!/bin/bash

FOLDER="./blocklets/$1"
NAME=$2
ICON=$3
COLOR=$4
COMMAND=$5
FILE="$FOLDER/$2"

mkdir -p $FOLDER
echo "Creating blocklet entry for $2 using command $5 ---  with icon $3 and color $4"

touch "$FOLDER/$2"
echo "#!/bin/bash" >> $FILE
echo "" >> $FILE
echo "ICON=\${ICON:-\"$3\"}" >> $FILE
echo "PREFIX=\${PREFIX:-\"v\"}" >> $FILE
echo "SHORT_VERSION=\${SHORT_VERSION:-\"\"}" >> $FILE
echo "COLOR=\${COLOR:-\"$4\"}" >> $FILE
echo "" >> $FILE

echo "# Enter command here" >> $FILE
echo "$5 | awk -v icon=\$ICON -v prefix=\$PREFIX '{print icon \" \" prefix \$1}'" >> $FILE

echo "" >> $FILE
echo "echo \$SHORT_VERSION" >> $FILE
echo "echo \$COLOR" >> $FILE

echo -e "[$1/$2]\n$(cat ./example-blocklet-conf)" > $FOLDER/example-config

echo "Blocklet created" && chmod +x $FILE
