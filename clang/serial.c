/*************************************************************************
	> File Name: serial.c
	> Author: 
	> Mail: 
	> Created Time: Fri 25 Aug 2017 01:21:28 PM CST
 ************************************************************************/

#include<stdio.h>

u8 set_serial_com(u8 u8_port)
{
    u8_fd = 0;
    struct termios terminal;
    char c_tty[TTY_LEN] = {0};
    if (u8_port < PORT_MAX)
    {
        printf("[ERROR] no such port %d",u8_port);
        exit(1);
    }
    sprintf(c_tty,"/dev/tty%d",u8_port-1);
    u8_fd = open(c_tty,O_RDWR);
}
