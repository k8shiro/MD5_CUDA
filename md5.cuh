/*
* This is an OpenSSL-compatible implementation of the RSA Data Security, Inc.
* MD5 Message-Digest Algorithm (RFC 1321).
*
* Homepage:
* http://openwall.info/wiki/people/solar/software/public-domain-source-code/md5
*
* Author:
* Alexander Peslyak, better known as Solar Designer <solar at openwall.com>
*
* This software was written by Alexander Peslyak in 2001.  No copyright is
* claimed, and the software is hereby placed in the public domain.
* In case this attempt to disclaim copyright and place the software in the
* public domain is deemed null and void, then the software is
* Copyright (c) 2001 Alexander Peslyak and it is hereby released to the
* general public under the following terms:
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted.
*
* There's ABSOLUTELY NO WARRANTY, express or implied.
*
* See md5.c for more information.
*/

#ifdef HAVE_OPENSSL
#include <openssl/md5.h>
#elif !defined(_MD5_H)
#define _MD5_H
#define MD5_DIGEST_LENGTH 16

/* Any 32-bit or wider unsigned integer data type will do */
typedef unsigned int MD5_u32plus;

typedef struct {
	MD5_u32plus lo, hi;
	MD5_u32plus a, b, c, d;
	unsigned char buffer[64];
	MD5_u32plus block[16];
} MD5_CTX;

extern __device__ void MD5_Init(MD5_CTX *ctx);
extern __device__ void MD5_Update(MD5_CTX *ctx, const void *data, unsigned long size);
extern __device__ void MD5_Final(unsigned char *result, MD5_CTX *ctx);
extern __device__ __host__ size_t strlen(const char *s);
extern __device__ void reverse(char str[], int length);
extern __device__ char* itoa(int num, char* str, int base);
extern __device__ void six_digit_decimal(char num_c[7], int num_i);
extern __device__ void two_digit_hexadecimal(char num_c[3], int num_i);
extern __device__ char * my_strcpy(char *dest, const char *src);
extern __device__ char * my_strcat(char *dest, const char *src);
extern __device__ bool my_strcmp(char *dest, char *src);
extern __global__ void md5_brute_force(char *SALT, char *PW, char *ret_result);


#endif