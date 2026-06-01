#include<stdio.h>
#include<stdint.h>

// input is a 32 bit integer
// output number of '1's in the integer
//0101
int countnumberof1s (int32_t input){

    int count = 0;
    int check = 0;
    for( int i = 0; i<31; ++i){
        check = (input>>i) & 1U;
        if (check == 1){
            count+=1;
        }

    return count;
    }

}

int main(){


    countnumberof1s(5);


}