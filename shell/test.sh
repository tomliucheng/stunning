#!/bin/bash

devnum=1
devport=2
portline=0

#删除原来的，下载最新的
rm -f ./sshConfig.xml 
lftp -c "open -u username,password addr; lcd /root/landfun/ftp/get; get /global/sshConfig.xml"

#删除window下的CRLF
sed -i 's/^M//g' ./sshConfig.xml

#找到最大已用的端口号
awk '/ReversePort/{printf"%s \n",$1}' sshConfig.xml | grep -oP "\d+" | sort > ./port_used
port_max=`sed -n '$p' ./port_used`

#删除最后一行
sed  -i '$d' ./sshConfig.xml

#传进的为待添加的设备号的文件
for file in $@
do
#    sort -n $file | uniq > $file
    for line in `cat $file`
    do
        #echo "check: $line"
        if grep -Fq "$line" ./sshConfig.xml 
        then
            portline=`grep -Fn "$line" ./sshConfig.xml | cut -f 1 -d ':'`
            portline=$[portline+3]
            portnum=`awk "NR==${portline}{print}" ./sshConfig.xml | grep -oP "\d+"`
            #如果设备号已经绑定到了某个端口，则打印出来看看
            echo "*** $line --> $portnum     at line: $portline"
        else
            line_max=`awk 'END{print NR}' ./sshConfig.xml`
            insert_point=line_max #$[line_max-1] 之前删了最后一行
            port_max=$[port_max+1]
            devport=$port_max
            devnum=$line
            echo "+++ $line --> $devport     at line: $line_max"
            tmp="
            \t<Connection>\n
                \t\t<DeviceCode>$devnum</DeviceCode>\n
                \t\t<RemoteHost>116.62.180.238</RemoteHost>\n
                \t\t<RemotePort>22</RemotePort>\n
                \t\t<ReversePort>$devport</ReversePort>\n
            \t</Connection>
            "
            #echo "prot-max: $port_max  insert_point: $insert_point tmp:$tmp"
            #sed "$insert_point a$tmp" -i ./c
            echo -e $tmp >> ./sshConfig.xml
        fi
    done
done

#add last line
echo "</ReverseSSHConnections>" >> ./sshConfig.xml

#推送到tfp服务器
lftp -c "open -u username,password addr; put -O /global/ ./sshConfig.xml"

echo "done! -_-"


