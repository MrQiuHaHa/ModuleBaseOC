#!/bin/bash

echo -e "脚本功能：tag名称包含了debug命名的就删除其远程和本地tag"

echo -e " ---- 切换到主分支 master！----"
git checkout master
echo -e " ---- 本地更新下远程tag ----"
git fetch --tags

count=`git tag -l | wc -l`
echo "当前tag数量：" $count

tagList=$(git ls-remote --tags origin)

for name in ${tagList[*]}
do
    result=$(echo $name | grep "debug")
    if [[ "$result" != "" ]]; then
        result=$(echo $name | grep "^") #过滤掉带^标志的
        if [[ "$result" == "" ]]; then
            echo "删除本地Tag!" ${name##*/}
            git tag -d ${name##*/}
            echo "删除远程Tag!" $name
            git push origin :$name
        fi
    fi
done

count=`git tag -l | wc -l`
echo "剩余tag数：" $count

