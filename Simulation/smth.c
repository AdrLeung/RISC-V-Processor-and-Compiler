#include <stdio.h>
#include <stdint.h>


#define OutputFile "OutputFiles/AdderOutput.txt"
#define TestVector "TestVectors/Adder00.tvs"

int main(){



// printf("Hello world\n");
// int a = 5;
// int b = 10;
// a = a ^ b;
// b = a ^ b;
// a = a ^ b;
// printf("a: %d, b: %d", a, b);

FILE *OutputFilePtr= NULL;
FILE *TestVectorFilePtr = NULL;

uint64_t A, B, S;
int Cin, Cout;


uint64_t resultSum;
int resultCout;
int ignored;

OutputFilePtr = fopen(OutputFile, "r");
TestVectorFilePtr = fopen(TestVector, "r");
if ( OutputFilePtr== NULL){
    printf("Error opening the Output file.");
} else if (TestVectorFilePtr == NULL){
    printf("Error opening the Test vector file.");

}



while(fscanf(TestVectorFilePtr,"%llx %llx %d %llx %d %d", &A, &B, &Cin, &S, &Cout, &ignored) == 6){

    fscanf(OutputFilePtr,"%llx %d", &resultSum, &resultCout);

    if((resultSum == S) && resultCout == Cout){
        printf("Success!\n");
    }

}


fclose(OutputFilePtr);
fclose(TestVectorFilePtr);



}