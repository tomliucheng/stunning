Sub Main
    ' *** Send ***
    xsh.Screen.Synchronous = True
    xsh.Screen.Send("echo -e '\n \033[41;37mlook current branch and send good d2 and rssh to device \033[0m \n' ")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(10)

    xsh.Screen.Send("git br | grep detached | awk '{print $4}' | sed 's/.$//' | xargs git show | grep 'tag' -5")
	xsh.Screen.Send(VbCr)
   	xsh.Session.Sleep(10)


    xsh.Screen.Send("scp /root/project/gitlab/d2/HBJ_board/bin/release/d2 192.0.0.130:/home/WT2416/EnvMonitor/ && scp /root/project/gitlab/d2/HBJ_board/bin/release/d2 192.0.0.130:/root/EnvMonitor/ && scp /home/dunk/landfun/project/reverseSSH/bin/release/reversessh 192.0.0.130:/home/WT2416/EnvMonitor/")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(100)
    xsh.Screen.WaitForString("password")
    xsh.Screen.Send("mobilenemo")
	xsh.Screen.Send(VbCr)
   	xsh.Session.Sleep(10)
    xsh.Screen.WaitForString("password:")
    xsh.Screen.Send("mobilenemo")    
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(10)
    xsh.Screen.WaitForString("password:")
    xsh.Screen.Send("mobilenemo")
    xsh.Screen.Send(VbCr)
    xsh.Session.Sleep(10)
End Sub