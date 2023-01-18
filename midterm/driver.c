/*author: David Fazio
  email: davidfazio1102@csu.fullerton.edu
  date: october 13, 2022
  sec: Section 7
*/
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <stdlib.h>


extern long* manager();

int main(int argc, char*argv[]) {
  
  printf("Welcome to the great reverse by Chris Sawyer\n\n"); 
     
  long* arr = manager();
  printf("The driver function recieved an array whose first 3 numbers are:\n");

    for(int i = 0; i < 3; i++)
    {
      printf("%ld\n", arr[i]);
    }
  
  printf("Have a nice weekend. Zero will be returned to the operating system. Bye");
  

}