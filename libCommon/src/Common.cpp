#include <iostream>
#include <string>
using namespace std;
#include "Common.h"
void TestCommon(string s)
{
    string myS = s + "  ";
    cout << myS << __func__ << endl;
}
void Parent::setdata()
{
	cout<<"Input num1:"<<endl;
	cin>>a;
	cout<<"Input num2:"<<endl;
	cin>>b;
}            
