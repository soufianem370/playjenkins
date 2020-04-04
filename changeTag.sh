#!/bin/bash
#sed "s/tagVersion/$1/g" myweb.yaml > myweb.yaml
printf "%s\n" '1,$s/tagVersion/${BUILD_NUMBER}/g' wq | ed -s myweb.yaml

