#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>

#define NUM_CORES 4
#define MULTI_THREADED 1 //1 for true, 0 for false
#define BIGVALUE 1000000000UL

/*Compared to the original version, I reduce the number of
heap allocations in SumBetween completly, and modify
the struct sum_args to include the return value of the 
thread. I think it will allow for more easily managable code!*/


typedef struct sum_args
{
    int64_t start;
    int64_t end;
    int64_t return_total;
} sum_args;


void* SumBetween(void *arg)
{
    #ifdef SLOWER
    ((sum_args *)arg)->return_total = 0;
    for (int64_t i = ((sum_args *)arg)->start; i < ((sum_args *)arg)->end; i++)
        ((sum_args *)arg)->return_total += i;
    #endif

    #ifdef FASTER
    uint64_t total = 0;
    for (int64_t i = ((sum_args *)arg)->start; i < ((sum_args *)arg)->end; i++)
        total += i;
    ((sum_args *)arg)->return_total = total;
    #endif
    
    return NULL;
}

int64_t SumUpTo_WithThreads(int64_t limit)
{   //start counting from zero
    const int numthreads = NUM_CORES + (int)(NUM_CORES*MULTI_THREADED*0.25);
    pthread_t threads[numthreads];
    sum_args listofargs[numthreads];
    int64_t offset = limit/numthreads;
    int64_t total = 0;

    for (int i = 0; i < numthreads-1; i++)
    {
        listofargs[i] = (sum_args){.start = offset*i, offset*(i+1)};
        pthread_create(&threads[i], NULL, SumBetween, (void *)(&listofargs[i]));
    }
    //edge case catch
    //limit + 1, since SumBetween() is not inclusive of .end aka stops at .end -1 for each loop
    listofargs[numthreads-1] = (sum_args){.start = offset*(numthreads-1), .end = limit+1};
    pthread_create(&threads[numthreads-1], NULL, SumBetween, (void *)(&listofargs[numthreads-1]));

    //finishing
    for (int i = 0; i < numthreads; i++)
    {
        pthread_join(threads[i], NULL); //used to ensure thread is done before adding .return_total
        total += listofargs[i].return_total;
    }

    return total;
}

int64_t SumUpTo(int64_t limit)
{
    uint64_t total = 0;
    for (uint64_t i = 0; i <= limit; i++)
        total += i;
    return total;
}

int main(void)
{
    #ifdef THREADS
    printf("%ld\n", SumUpTo_WithThreads(BIGVALUE));
    #endif

    #ifdef NORMAL
    printf("%ld\n", SumUpTo(BIGVALUE));
    #endif 
    return 0;
}