Sub Main
    ' *** Send ***
    xsh.Screen.Synchronous = True
    xsh.Screen.Send("echo -e '\n \033[41;37mset device config,waiting   -_- -_-\033[0m \n' ")
    xsh.Screen.Send("echo -e '\033[31m ' && cat /etc/init.d/rcS")
    xsh.Screen.Send(VbCr)
    xsh.Screen.Send("echo -e '\033[32m ' && ls /udisk | echo 'mount -t vfat /dev/sda /udisk' >> /etc/init.d/rcS && ps aux | grep ssh")
    xsh.Screen.Send(VbCr)
    xsh.Screen.Send("echo -e '\033[33m ' && cat /proc/seriesinfo")
    xsh.Screen.Send(VbCr)
    xsh.Screen.Send("echo -e '\033[34m ' && grep 'DHCP=1' /etc/net.conf && sed -i 's/^DHCP=1/DHCP=0/' /etc/net.conf")
    xsh.Screen.Send(VbCr)
    xsh.Screen.Send("echo -e '\033[35m ' && grep '8.8.8.8' /etc/resolv.conf || echo 'nameserver 8.8.8.8'  >> /etc/resolv.conf && echo -e '\033[0m' ")
    xsh.Screen.Send(VbCr)

    xsh.Screen.Send("echo -e '\n \033[41;37mset device rssh,waiting   -_- -_-\033[0m \n' ")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(10)

    xsh.Screen.Send("ssh-keygen -t rsa")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(100)
    xsh.Screen.WaitForString("id_rsa")
	xsh.Screen.Send(VbCr)
   	xsh.Session.Sleep(10)
    xsh.Screen.WaitForString("passphrase")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(10)
    xsh.Screen.WaitForString("again")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(10)

    xsh.Screen.Send("cat .ssh/id_rsa.pub | ssh root@116.62.180.238 'cat >> .ssh/authorized_keys'")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(10)
    xsh.Screen.WaitForString("yes")
    xsh.Screen.Send("yes")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(10)
    xsh.Screen.WaitForString("password")
    xsh.Screen.Send("Yuhan2012!")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(10)

    xsh.Screen.Send("echo -e '\n \033[41;47mrm old d2,waiting   -_- -_-\033[0m \n' ")
    xsh.Screen.Send(VbCr)
    xsh.Screen.Send("rm /root/EnvMonitor/d2 && rm /home/WT2416/EnvMonitor/d2")
    xsh.Screen.Send(VbCr)    
    xsh.Session.Sleep(10)


    xsh.Screen.Send("echo -e '\n \033[46;37m done,xixi \033[0m \n' ")
    xsh.Screen.Send(VbCr)

End Sub