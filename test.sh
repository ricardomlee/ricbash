#!/bin/bash
#输入node id
check_nodeid()
{
    #两边和中间的空格不能少！
    if [[ $1 =~ ^[0-9a-z]{10}$ ]]; then
        echo "yes"
    else
        echo "no"
    fi
}

if [ $# == 1 ]; then
    node=$1
else
    echo "input node"
    read node
fi
#忘记加fi会报错：syntax error: unexpected end of file

check_nodeid $node