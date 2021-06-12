#include <stdio.h>
#include <stdint.h>
#include <time.h>

#define BIGNUM 1000000000UL

typedef struct numbers
{
    int64_t start;
    int64_t end;
    int64_t total;
} numbers;


int64_t sum(void);
void sumpoint(int64_t *total);
void sumvoidpoint(void *total);
int64_t sumstruct(void);
void sumstructpoint(numbers *p);
void sumstructvoidpoint(void *p);
int64_t sumregister(void);
int64_t sumregisterV2(void);

int main(void)
{
    int64_t choice = 0;
    const char *funcs[] = {
        "int64_t sum(void)",
        "void sumpoint(int64_t *total)",
        "void sumvoidpoint(void *total)",
        "int64_t sumstruct(void)",
        "sumstructpoint(numbers *p)",
        "sumstructvoidpoint(void *p)",
        "int64_t sumregister(void)",
        "int64_t sumregisterV2(void)"
    };

    printf("Choose a function to execute!\n");
    for (int64_t i = 0; i < (sizeof(funcs)/sizeof(char *)); i++)
        printf("%ld. %s\n", i, funcs[i]);
    printf("Option: ");
    scanf("%ld", &choice);

    clock_t start = clock();
    switch (choice)
    {
        case 0:
        {
            sum();
            break;
        }
        case 1:
        {
            int64_t total;
            sumpoint(&total);
            break;
        }
        case 2:
        {
            int64_t total;
            sumpoint((void *)&total);
            break;
        }
        case 3:
        {
            sumstruct();
            break;
        }
        case 4:
        {
            numbers test;
            sumstructpoint(&test);
            break;
        }
        case 5:
        {
            numbers test;
            sumstructvoidpoint((void *)&test);
            break;
        }
        case 6:
        {
            sumregister();
            break;
        }
        case 7:
        {
            sumregisterV2();
            break;
        }
        default:
            printf("Invalid input!\n");
            return 0; //skip funcs[choice] since inputed number is not valid
    }

    printf("%s took: %lf (s)\n", funcs[choice], ((double)(clock()-start)/CLOCKS_PER_SEC));
    return 0;
}


int64_t sum(void)
{
    int64_t total = 0;
    for (int64_t i = 0; i <= BIGNUM; i++)
        total += i;
    return total;
}

void sumpoint(int64_t *total)
{
    *total = 0;
    for (int64_t i = 0; i <= BIGNUM; i++)
        *total += i;
}

void sumvoidpoint(void *total)
{
    *((int64_t *)total) = 0;
    for (int64_t i = 0; i < BIGNUM; i++)
        *((int64_t *)total) += i;
}

int64_t sumstruct(void)
{
    numbers r = (numbers){.start = 0, .end = BIGNUM, .total = 0};
    for (int64_t i = r.start; i < r.end; i++)
        r.total += i;
    return r.total;
}

void sumstructpoint(numbers *p)
{
    p->start = 0; p->end = BIGNUM; p->total = 0;
    for (int64_t i = p->start; i < p->end; i++)
        p->total += i;
}

void sumstructvoidpoint(void *p)
{
    ((numbers *)p)->start = 0; ((numbers *)p)->end = BIGNUM; ((numbers *)p)->total = 0;
    for (int64_t i = ((numbers *)p)->start; i < ((numbers *)p)->end; i++)
        ((numbers *)p)->total += i;
}

int64_t sumregister(void)
{
    register int64_t total = 0;
    for (int64_t i = 0; i < BIGNUM; i++)
        total += i;
    return total;
}

int64_t sumregisterV2(void)
{   //suggested to compiler to make i a register too
    register int64_t total = 0;
    for (register int64_t i = 0; i < BIGNUM; i++)
        total += i;
    return total;
}