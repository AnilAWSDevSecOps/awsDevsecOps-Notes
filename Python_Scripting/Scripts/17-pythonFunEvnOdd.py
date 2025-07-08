# Python Function Even odd

def even_odd(num1, num2):
    for i in range(num1, num2):
        if i % 2 == 0:
            print(f"{i} is even")
        else:
            print(f"{i} is odd")

even_odd(1, 10)
# output:
'''
1 is odd
2 is even
3 is odd
4 is even
5 is odd
6 is even
7 is odd
8 is even
9 is odd
'''