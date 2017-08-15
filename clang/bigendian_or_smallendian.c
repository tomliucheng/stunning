/*************************************************************************
	> File Name: bigendian_or_smallendian.c
	> Author: 
	> Mail: 
	> Created Time: Tue 15 Aug 2017 02:21:48 PM CST
 ************************************************************************/

#include<stdio.h>

union endian
{
    char byte[4];//4*8-32 测试32位机器
    int val;
};

union endian test;
test.val = 1;
printf("%x",test.byte[0]);
//x86小端编码，打印 1
//powerpc大端编码，打印 0
//
//方法二

const int endian = 1;
#define is_big_endian()     ( (*(char*)&endian ) == 0  )//将一个变量的地址强转char*后再取其值，即取其第一个字节的数据
#define is_little_endian()  ( (*(char*)&endian ) == 1  )

