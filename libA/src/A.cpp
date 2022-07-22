#include <iostream>
#include <string>
using namespace std;
#include "A.h"
void TestA(string s)
{
    string myS = s + "  ";
    cout << myS << __func__ << endl;
    TestCommon(myS);
}
void TestA1(void)
{
    cout << __func__ << endl;
}
void Child1::getsum()
{
	setdata();
	sum = a+b;
	cout<<"Sum is: "<<sum<<endl;
}
void Child1::getdiff()
{
	setdata();
	diff = a-b;
	cout<<"Diff is: "<<diff<<endl;
}
