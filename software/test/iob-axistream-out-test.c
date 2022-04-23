//#include "stdlib.h"
#include "system.h"
#include "periphs.h"
#include "iob-axistream-out.h"
#include <stdint.h>

int main()
{
  axistream_out_init(AXISTREAMOUT_BASE,FREQ/BAUD);
  /*
  //test hex
  axistream_out_puts("\ntest hex\n");
  printf("%x\n", 0);
  printf("%x\n", 245);
  printf("%x\n", (uint32_t)(~0));

  //test unsigned 
  axistream_out_puts("\ntest unsigned\n");
  printf("%u\n", 0);
  printf("%u\n", 245);
  printf("%u\n", (uint32_t)(~0));


  //test signed
  axistream_out_puts("\ntest signed\n");
  printf("%d\n", 0);
  printf("%d\n", 245);
  printf("%d\n", (int32_t)(~0));
  printf("%d\n", (int32_t)(1<<31));
  printf("%d\n", (int32_t)(~(1<<31)));
 
  
  //test unsigned long long
  axistream_out_puts("\ntest unsigned long long\n");

  printf("%llu\n\n", 0LL);
  printf("%llu\n\n", (uint64_t)1<<29);
  printf("%llu\n\n", (uint64_t)1<<30);
  printf("%llu\n\n", (uint64_t)1<<31);
  printf("%llu\n\n", (uint64_t)1<<32);
  printf("%llu\n\n", (uint64_t)1<<33); 

  //test left shift
  int i;
  uint64_t num = 1LL;

  for (i = 0; i < 64; i++) {
    printf("1 << %d = %llu\n", i, num);
    num <<= 1;
  }

  printf("2**64-1 = %llu\n", ~0LL);

 
  //test signed long long
  axistream_out_puts("test signed long long\n\n");
  printf("%lld\n\n", 0LL);
  printf("%lld\n\n", 1LL<<29);
  printf("%lld\n\n", 1LL<<30);  
  printf("%lld\n\n", 1LL<<31);
  printf("%lld\n\n", 1LL<<32);
  printf("%lld\n\n", 1LL<<33);

  printf("%lld\n\n", ~0LL);
  printf("%lld\n\n", -(1LL<<29));
  printf("%lld\n\n", -(1LL<<30));  
  printf("%lld\n\n", -(1LL<<31));
  printf("%lld\n\n", -(1LL<<32));
  printf("%lld\n\n", -(1LL<<33));
  */
  //test floats
  int x = 0b00000000100000000000000000000000; //smallest normal
  int y = 0b01111111011111111111111111111111; //largest normal

  printf("%f\n", *((float *)&x));
  printf("%f\n", *((float *)&y));
  printf("%f\n", 0);
  printf("%f\n", 1.0);
  printf("%f\n", -1000000.0);
  printf("%f\n", 0.000000000001);
  printf("%f\n", 10000000000.0);

}
