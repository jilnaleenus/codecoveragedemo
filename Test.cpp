#include <iostream>
#include <string>
using namespace std;
#include "A.h"
#include "B.h"


int main(void)
{
    string myS = "";
    cout << myS << __func__ << endl;
    TestA(myS);
    TestB(myS);    
    int choice = 1;
	char op;
	Child1 obj1;
	Child2 obj2;
	while(choice)
	{
		cout<<"Enter operation(+,-,*,/,q) you want to perform: ";
		cin>>op;
		switch(op){
			case '+':
				obj1.getsum();
				break;
			case '-':
				obj1.getdiff();
				break;
			case '*':
				obj2.getmul();
				break;
			case '/':
				try
				{
					obj2.getdiv();
				}
				catch(runtime_error& e)
				{
					cout<<"Exception: "<<e.what()<<endl;
				}
				break;

			case 'q':
				choice =0;
				break;
			default:
				cout<<"****enter right option****"<<endl;
				break;
		}
	}    
}
