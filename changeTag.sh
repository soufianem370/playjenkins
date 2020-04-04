#!/bin/bash
#sed "s/tagVersion/$1/g" myweb.yaml > myweb.yaml
sed -i 's/tagVersion/${BUILD_NUMBER}/g' myweb.yaml

