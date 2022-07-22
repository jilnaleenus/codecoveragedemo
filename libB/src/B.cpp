#include <iostream>
#include <string>
using namespace std;
#include "B.h"
void TestB(string s)
{
    string myS = s + "  ";
    cout << myS << __func__ << endl;
    TestCommon(myS);
}
void Child2::getmul()
{	
	display();
	setdata();
	mul = a*b;
	cout<<"multiplication is: "<<mul<<endl;	
}
void Child2::getdiv(){
	setdata();
	if(b==0)
		throw runtime_error("divide by 0\n");
	else{
	divd = a/b;
	cout<<"division is: "<<divd<<endl;
	}
}
inline void Child2::display()
{
	cout<<"Calling Private inline function from getmul() inside child2"<<endl;
}
