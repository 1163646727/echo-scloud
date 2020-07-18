#!/bin/bash

# 基础目录
export base_dir=deploy/busi
# 应用名称的前缀
export prefix=sshapp-
# 需要部署的模块
export modules="emr nurse manager hisdata ca rule"
export names=""

# 退到父项目目录下打包
cd ..
# 删除原有的基础目录,并重新创建
rm -rf $base_dir
mkdir $base_dir

for m in $modules; do
    export names=$names,$prefix$m
done

mvn clean package -DskipTests -U -pl $names -am

for m in $modules; do
    # 等待 0.5 秒。防止 jenkins 出错时无限重试导致cpu忙。
    sleep 0.5
    echo coping module $m...
    mkdir $base_dir/$m
    cp $prefix$m/target/$prefix$m.jar $base_dir/$m/$prefix$m.jar
    cp $prefix$m/target/ver_* $base_dir/$m/
    echo module $m done
done

cd deploy
