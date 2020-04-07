#!/bin/bash

set -e

echo "Move sites updated code to staging site"
rsync -e "ssh -o StrictHostKeyChecking=no -p 22" -avz ./ glassesgallery-test-ssh@34.197.214.188:/home/cloudpanel/htdocs/test.glassesgallery.com/
ssh -o StrictHostKeyChecking=no -p 22 glassesgallery-test-ssh@34.197.214.188 'bash /home/cloudpanel/htdocs/test.glassesgallery.com/staging.sh'
