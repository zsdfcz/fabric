#!/bin/bash

FILE_CODE=~/.config/code-server/config.yaml

pkill -9 -ef code-server

if [ ! -f $FILE_CODE ]; then

    stty -echo
    read -p "VSCode Password: " pass
    stty echo
    echo -e '\nWrote password to /root/.config/code-server/config.yaml'
    mkdir -p ~/.config/code-server
    touch ~/.config/code-server/config.yaml

    echo 'bind-addr: 0.0.0.0:8080' > ~/.config/code-server/config.yaml
    echo 'auth: password' >> ~/.config/code-server/config.yaml
    echo 'password: '$pass >> ~/.config/code-server/config.yaml
    echo 'cert: false' >> ~/.config/code-server/config.yaml
    echo 'PASSWORD='$pass >> ~/.bashrc && source ~/.bashrc

    mkdir /log
fi

nohup code-server > /log/vscode.out &
echo "vscode 서버 실행 완료. [ ctrl + pq ] 입력 후 종료"

/bin/bash