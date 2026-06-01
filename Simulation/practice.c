#include <stdio.h>
#include <stdint.h>


int main(){

int maxInt(int a, int b);

 //printf("%d",maxInt(5,3));
// printf("%d",maxInt(7,3));
// printf("%d",maxInt(3,4));    


int arr[] = {12,5,99,3,42};
int currentMax = 0;
for(int i = 0; i<sizeof(arr)/sizeof(arr[0]); ++i){
    if(i == 0){
        currentMax = arr[i];
        continue;
    }

    if(currentMax<arr[i]){
        currentMax = arr[i];
    }

}




int actual[]   = {5, 8, 10, 15};
int expected[] = {5, 7, 10, 15};
int pass = 0;
int length = sizeof(actual)/sizeof(actual[0]);

for(int i = 0; i<length;++i){
    
    if(actual[i] == expected[i]){
        pass+=1;
    }


}


//printf("%d/%d tests passed", pass, length);



int is_bit_set(uint32_t value, int bit);

uint32_t reg = 0x00;

reg = reg |(1U<<2); // set bit 2
reg = reg & ~(1U<< 2); // clear bit 2
reg = reg ^ (1U<<2); // toggle bit 2


uint32_t value = 0xABCD1234;

// extract bits 15:8

uint32_t extracted_value = (value>>8) &0x0000FF;

printf("%d\n", extracted_value);

}





int is_bit_set(uint32_t value, int bit){

    return (value >> bit)& 1U;



}




int maxInt(int a, int b){
    int difference = a - b;

    if(difference == 0){
        printf("there is no max number");
        return 0;
    } else if(difference>0){
      return a;
    } else if (difference <0){
        return b;
    }




}