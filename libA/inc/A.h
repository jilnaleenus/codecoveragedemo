#include "Common.h"
#include <iostream>

using namespace std;

void TestA(string s);
void TestA1(void);
class Child1: public Parent{
	private:
		int sum;
		int diff;
	public:
	void getsum();
	void getdiff();
	};
