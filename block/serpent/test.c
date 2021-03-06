

// test unit for serpent-256
// Odzhan

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <ctype.h>

// 256-bit master key
uint8_t key[32]=
{0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 
 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,  
 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,  
 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f };
 
// 128-bit plain text
uint8_t plain[16]=
{0x3d, 0xa4, 0x6f, 0xfa, 0x6f, 0x4d, 0x6f, 0x30,  
 0xcd, 0x25, 0x83, 0x33, 0xe5, 0xa6, 0x13, 0x69 };
  
// 128-bit cipher text
uint8_t cipher[16]=
{0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,  
 0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff };

void serpent(void *mk, void *data);

int main (void) {
    uint8_t data[32];
    int     equ;
    
    memcpy(data, plain, 16);
    serpent(key, data);
    equ = (memcmp(data, cipher, 16)==0);
    printf("Serpent test : %s\n", equ ? "OK" : "FAILED");
    return 0;
}
