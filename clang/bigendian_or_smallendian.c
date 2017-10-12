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


USHORT le16_to_cpu(USHORT v16) {
        USHORT tmp = v16;
    if (is_bigendian()) {
                unsigned char *s = (unsigned char *)(&v16);
                unsigned char *d = (unsigned char *)(&tmp);
                d[0] = s[1];
                d[1] = s[0];
            
    }
        return tmp;

}

UINT  le32_to_cpu (UINT v32) {
        UINT tmp = v32;
    if (is_bigendian()) {
                unsigned char *s = (unsigned char *)(&v32);
                unsigned char *d = (unsigned char *)(&tmp);
                d[0] = s[3];
                d[1] = s[2];
                d[2] = s[1];
                d[3] = s[0];
            
    }
        return tmp;

}

UINT ql_swap32(UINT v32) {
        UINT tmp = v32;
    {
                unsigned char *s = (unsigned char *)(&v32);
                unsigned char *d = (unsigned char *)(&tmp);
                d[0] = s[3];
                d[1] = s[2];
                d[2] = s[1];
                d[3] = s[0];
            
    }
        return tmp;

}

USHORT cpu_to_le16(USHORT v16) {
        USHORT tmp = v16;
    if (is_bigendian()) {
                unsigned char *s = (unsigned char *)(&v16);
                unsigned char *d = (unsigned char *)(&tmp);
                d[0] = s[1];
                d[1] = s[0];
            
    }
        return tmp;

}

UINT cpu_to_le32 (UINT v32) {
        UINT tmp = v32;
    if (is_bigendian()) {
                unsigned char *s = (unsigned char *)(&v32);
                unsigned char *d = (unsigned char *)(&tmp);
                d[0] = s[3];
                d[1] = s[2];
                d[2] = s[1];
                d[3] = s[0];
            
    }
        return tmp;

}

