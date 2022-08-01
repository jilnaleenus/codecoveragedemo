import pexpect
import os

def run_testcase(operator, arg1, arg2, quit):
    p = pexpect.spawn('./Test')
    p.sendline(operator)
    p.sendline(arg1)
    p.sendline(arg2)
    p.sendline(quit)
    p.expect(pexpect.EOF)
    print(p.before)


run_testcase('+', '100', '20', 'q')
run_testcase('-', '100', '20', 'q')
run_testcase('*', '100', '20', 'q')
#run_testcase('/', '100', '20', 'q')
