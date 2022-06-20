#include <stdio.h>
#include <stdint.h>
#include <math.h>
#include <time.h>
#include <stdlib.h>
void to_bits(int16_t n)
{
    printf("\"");

    for(int i = 0; i < 16; i++)
    {

        int b = n & (1 << (15 - i));
        if(b) printf("1");
        else printf("0");
    }
    printf("\",\n");
}

void gen_samples(int n)
{

    float dt = 0;
    for(int i = 0; i < n; i++)
    {
        int16_t s;
        int16_t sample = 32767 * sin(2 * M_PI * dt);
        s = sample;
        int16_t noise = rand() % 9000;
        int sign = rand() % 2 == 0 ? -1 : 1;

        if(fabs(sin(2 * M_PI * dt)) != 1.0f) sample += noise;
        dt += 1.0f/64;
    }
}


int main()
{
    srand(time(NULL));
    gen_samples(256);

    return 0;
}
