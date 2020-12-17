
Color_Off='\033[0m'       # Text Reset
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green

#push to self path
script_file=${0}
script_path=${script_file%/*}
target_name=`basename ${script_path}`
#current_dir=${PWD##*/} 
pushd ${script_path}
#echo ${script_path}
echo `pwd`

if [[ -e "dark.jpg" ]]
then
    darkfile="dark.jpg"
elif [[ -e "dark.png" ]]
then
    darkfile="dark.png"
else
    darkfile=""
fi

if [[ -e "light.jpg" ]] 
then
    lightfile="light.jpg"
elif [[ -e "light.png" ]]
then
    lightfile="light.png"
else
    lightfile=""
fi

if [[ -z ${lightfile} ]] 
then
    echo ${Red}No light image.${Color_Off}
    exit 0
fi

if [[ -z ${darkfile} ]] 
then
    echo ${Red}No dark image.${Color_Off}
    exit 0
fi
#echo ${lightfile}
#echo ${darkfile}
cat > settings.json << EOF
[
    {
        "fileName": "${lightfile}",
        "isPrimary": true,
        "isForLight": true
    },
    {
        "fileName": "${darkfile}",
        "isForDark": true
    }
]
EOF
wallpapper -i settings.json -o ${target_name}.heic
echo ${Green}${target_name}.heic${Color_Off}
#return
popd
