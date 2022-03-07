################################
#
# 该脚本将会同步指定的目录到一个确定的目录A下，同时将A目录下文件自动上传
#
################################
#!/bin/bash

# 备份路径 当前home+auto-backup+主机名称(省略.后面的内容)
backPath="$HOME/auto-backup"
if [ ! -d $backPath -o ! -d "$backPath/.git" ]; then       #判断木匾文件是否存在，不存在自动创建
    #mkdir -p $dstPath
    rm -rf $backPath #删除该目录

    #git环境检测
    ownerGit='huaiyongtai'
    gitTest=$(ssh -T git@github.com >> null)
    if [ ! `expr index "$dstPath" $ownerGit` ]; then
        echo "Git SSH 环境配置异常... "
        exit
    fi
    eval "git clone git@github.com:huaiyongtai/auto-backup.git $backPath"
fi

# 目标路径
dstPath="$backPath/$HOSTNAME"
index=`expr index "$dstPath" .`  #提取'.'所在位置
dstPath=${dstPath:0:$index-1}    #提取子串
if [ ! -x $dstPath ]; then       #判断目录文件是否存在，不存在自动创建
    echo "Git 备份文件拉取... "
fi

#1.添加待同步的文件
#################################
#
#rsync -avz --delete dirA dirB
#同步dirA目录到dirB，若dirB文件有不同于dirA目录的文件，--delete命令将会删除dirB多余文件。
# 例：--delete 会删除同步完后目标目录UltiSnips多余的文件
#
# rsync -avz --delete --exclude "*.swp*" ~/.vim/UltiSnips $dstPath 
################################
cat ./auto-config | while read line
do
    file=`eval ls -d $line` #此处需要将shell符号(如:~)展开成对应路径 (字符串'~/.vimrc'系统无法识别)
    if [ ! -e $file ]; then #-e 不区分文件还是目录
        echo "无效文件:${line} "
        continue
    fi
    rsync -avz --delete $file "$dstPath/"
done

# 写入定时任务
ctask="/bin/sh $(cd "$(dirname $0)"; pwd)/$(basename $0) >> /dev/null 2>&1";
if [ $(crontab -l | grep -c "$ctask") -eq 0 ]; then
    $((crontab -l && echo "*/2 * * * * ${ctask}") | crontab)
fi

# 目标文件上传
cd $backPath
git rm -r *.swp
git add --all .
git commit -m "auto sync"
git push origin master

