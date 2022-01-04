// conditional OPerator
#include <iostream>
using namespace std;

int main ()
{
  int a,b,c;

  a=26;
  b=0x7AB;  // 0x7AB is hexnumber
  c = (a>b) ? a : b;

  cout << c << '\n';
}