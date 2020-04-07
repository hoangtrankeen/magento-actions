#!/bin/bash

set -e

PROJECT_PATH="$(pwd)"


echo "project path is $PROJECT_PATH";

which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )
eval $(ssh-agent -s)
mkdir ~/.ssh/ && echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
echo "$SSH_CONFIG" > /etc/ssh/ssh_config && chmod 600 /etc/ssh/ssh_config


echo "Move sites updated code to staging site"
rsync -e "ssh -o StrictHostKeyChecking=no -p 22" -avz ./ glassesgallery-test-ssh@34.197.214.188:/home/cloudpanel/htdocs/test.glassesgallery.com/
ssh -o StrictHostKeyChecking=no -p 22 glassesgallery-test-ssh@34.197.214.188 'bash /home/cloudpanel/htdocs/test.glassesgallery.com/staging.sh'
