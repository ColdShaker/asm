/*author: David Fazio
  email: davidfazio1102@csu.fullerton.edu
  date: october 13, 2022
  sec: Section 7
*/

#include <iostream>
#include <cstring>
using namespace std;
extern "C" bool isinteger(char w[]);
bool isinteger(char w[])
{bool result = true; //Assume true until proven otherwise.
 int start = 0;
 if (w[0] == '-' || w[0] == '+') start = 1;
 unsigned long int k = start;
 while( !(w[k]=='\0') && result )
     {result = result && isdigit(w[k]);
      k++;
     }
 return result;
}//End of isInteger


