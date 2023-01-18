/*author: David Fazio
  email: davidfazio1102@csu.fullerton.edu
  date: october 13, 2022
  sec: Section 7
*/
#include <iostream>

extern "C" void Display(long arr[], int size);

//Prints the contents of the array, up to arr_size, determined by the fill asm module
void Display(long arr[], int size) {
 
    for (int i = 0; i < size; ++i)
    {
        printf("%ld\n", arr[i]);
    }
 
}