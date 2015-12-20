#include <stdio.h>
#include <string.h>
#include <time.h>
#include "md5.cuh"

int main(int argc, char* argv[])
{
	if (argc != 3) return 1;

	char* SALT = argv[1];
	char* PW = argv[2];
	char result[7];

	clock_t start, end;
	start = clock();

	/*-----ï¿óÒâªÇ≥ÇÍÇΩèàóù-----*/
	char *dev_SALT, *dev_PW, *dev_result;

	cudaMalloc((void**)&dev_SALT, strlen(SALT) *sizeof(char));
	cudaMalloc((void**)&dev_PW, strlen(PW) *sizeof(char));
	cudaMalloc((void**)&dev_result, 7 * sizeof(char));

	cudaMemcpy(dev_SALT, SALT, strlen(SALT) * sizeof(char), cudaMemcpyHostToDevice);
	cudaMemcpy(dev_PW, PW, strlen(PW) * sizeof(char), cudaMemcpyHostToDevice);

	md5_brute_force<<<1000, 1000 >>>(dev_SALT, dev_PW, dev_result);
	
	cudaMemcpy(result, dev_result, 7 * sizeof(char), cudaMemcpyDeviceToHost);

	printf("%s\n", result);

	end = clock();
	printf("%.2fïbÇ©Ç©ÇËÇ‹ÇµÇΩ\n", (double)(end - start) / CLOCKS_PER_SEC);

	return 0;
}