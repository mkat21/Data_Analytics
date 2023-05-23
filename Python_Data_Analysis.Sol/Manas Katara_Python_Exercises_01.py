# 1
a = 21
b = 6
c = 3
d = 1
print(a-b/c)
print((a-b)/c)
print(a/b*c+d)
print(a/(b*(c+d)))

# 2
import sys
import math


a = float(sys.argv[1]) if len(sys.argv) > 1 else 0
b = float(sys.argv[2]) if len(sys.argv) > 2 else 0
c = float(sys.argv[3]) if len(sys.argv) > 3 else 0
d = float(sys.argv[4]) if len(sys.argv) > 4 else 0
e = float(sys.argv[5]) if len(sys.argv) > 5 else 0


print("Result of ++a:", a + 1)
a += 1
print("Result of a++:", a)
a -= 1
print("Result of (a++ + b++) / c++:", (a + 1 + b + 1) / (c + 1))
a += 1
b += 1
c += 1
print("Result of a/(b*(c + ++d)):", a / (b * (c + d + 1)))
d += 1
e -= 1
print("Result of a^b++ + b ^ ++c + c ^ --d + d ^ e--:", a**b + b**(c + 1) + c**(d - 1) + d**e)

# 3

a = 3.14159
b = 2.71828
c = 127
d = 32767
e = 9223372036854775807


result = int(e)
result_2 = int(c - e)
result_3 = int(e - a)


print("result:", result)
print("result_2:", result_2)
print("result_3:", result_3)

# Other type casting examples
# reducing: float to byte
f = 3.14159
result_4 = int(f)
result_4 = result_4 if result_4 < 128 else 127  # Clamp result to byte range
print("result_4:", result_4)

# expanding: short to long
g = 32767
result_5 = int(g)
print("result_5:", result_5)

# 4&5
import math

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    return a / b

def power(a, b):
    return a ** b

def exponent(a):
    return math.exp(a)

def modulo(a, b):
    return a % b

def sin(a):
    return math.sin(a)

def cos(a):
    return math.cos(a)

def tan(a):
    return math.tan(a)

# Define dictionary of operations
operations = {
    "a": add,
    "s": subtract,
    "m": multiply,
    "d": divide,
    "p": power,
    "e": exponent,
    "mod": modulo,
    "sin": sin,
    "cos": cos,
    "tan": tan
}

while True:
    try:
        a = float(input("Enter first number: "))
        b = float(input("Enter second number: "))
        op = input("Enter operation (a = addition, s = subtraction, m = multiplication, d = division, p = power, e = exponent, mod = modulo, sin = sin, cos = cos, tan = tan): ")
        
        result = operations[op](a, b)
        print("Result:", result)

        # Ask user if they want to perform another calculation
        another_calculation = input("Perform another calculation? (y/n): ")
        if another_calculation.lower() == "n":
            break

    except ValueError:
        print("Invalid input. Please enter a number.")    


# 6
def factorial(n):
    result = 1
    for i in range(1, n+1):
        result *= i
    return result

print(factorial(5))  

# 7
# a
for i in range(8):
    print("* ", end="")
# b
for i in range(7):
    for j in range(7):
        if i == 0 or i == 6 or j == 0 or j == 6:
            print("* ", end="")
        else:
            print("  ", end="")
    print()

# c
for i in range(7):
    for j in range(i+1):
        if j == i or j == 0 or i == 6:
            print("* ", end="")
        else:
            print("  ", end="")
    print()
# d
for i in range(7):
    for j in range(7):
        if j == 6 or j == 6-i or i == 0:
            print("* ", end="")
        else:
            print("  ", end="")
    print()


# 8

integer_array = []


for i in range(10):
    integer = int(input("Enter an integer: "))
    integer_array.append(integer)

# Calculate the average of the integers in the array
average = sum(integer_array) / len(integer_array)
print("The average of the integers is:", average)

# 9

integer_array = []

for i in range(10):
    integer = int(input("Enter an integer: "))
    integer_array.append(integer)

# Sort the array in ascending order
integer_array.sort()
print("The integers in ascending order are:", integer_array)

# Sort the array in descending order
integer_array.sort(reverse=True)
print("The integers in descending order are:", integer_array)

# 10

integer_array = []

for i in range(10):
    integer = int(input("Enter an integer: "))
    integer_array.append(integer)


search_element = int(input("Enter the element to search for: "))

found = False


for i in range(len(integer_array)):
    if integer_array[i] == search_element:
        found = True
        print("Element found at index", i)
        break


if not found:
    print("Element not found in the array")


# 11

name = input("Enter a name: ")

reversed_name = name[::-1]

if name == reversed_name:
    print("The name is a palindrome")
else:
    print("The name is not a palindrome")

# 12

array1 = [1, 2, 3, 4, 5]
array2 = [1, 2, 3, 4, 5]


if set(array1) == set(array2):
    print("Method 1: The arrays are equal (irrespective of position)")
else:
    print("Method 1: The arrays are not equal (irrespective of position)")

if array1 == array2:
    print("Method 2: The arrays are equal (including positions)")
else:
    print("Method 2: The arrays are not equal (including positions)")

# 13
import random

array = [0] * 100
for i in range(len(array)):
    array[i] = random.randint(1, 100)


print(array)

# 14
import random

array = [0] * 100
for i in range(len(array)):
    array[i] = random.randint(1, 100)

array = list(set(array))
print(array)

# 15
class Stack:
    def __init__(self):
        self.items = []

    def push(self, item):
        self.items.append(item)

    def pop(self):
        return self.items.pop()

    def peek(self):
        return self.items[-1]

    def is_empty(self):
        return len(self.items) == 0

    def size(self):
        return len(self.items)


stack = Stack()
stack.push(1)
stack.push(2)
stack.push(3)
print(stack.peek())
stack.pop()
print(stack.peek())
print(stack.size())

# 16
class Queue:
    def __init__(self):
        self.items = []

    def enqueue(self, item):
        self.items.append(item)

    def dequeue(self):
        return self.items.pop(0)

    def peek(self):
        return self.items[0]

    def is_empty(self):
        return len(self.items) == 0

    def size(self):
        return len(self.items)


queue = Queue()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
print(queue.peek())  # prints 1
queue.dequeue()
print(queue.peek())  # prints 2
print(queue.size())  # prints 2