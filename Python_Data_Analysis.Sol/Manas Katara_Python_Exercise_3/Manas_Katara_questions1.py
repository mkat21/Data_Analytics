#q1
''''input() function is used to interactively prompt the user for input. When called, 
it displays a prompt message (if provided) and waits for the user to enter input from 
the keyboard and displays output accordingly.'''

 #q2


 #1:Basic input and string concat:
name = input("Enter your name: ")
print("Hello, " + name + "!")

#2: Conversion input:
age = int(input("Enter your age: "))
years_until_hundred = 100 - age
print("You will turn 100 in", years_until_hundred, "years.")

#3:Multiple inputs using split() command:
numbers = input("Enter two numbers to be seperated: ").split()
num1 = int(numbers[0])
num2 = int(numbers[1])
sum = num1 + num2
print("The sum of the two numbers is:", sum)

#4:Using eval() to evaluate the input as a Python expression:
result = eval(input("Enter an arithmetic expression: "))
print("The result is:", result)

#5 Taking multiline input using a loop and a termination condition:
lines = []
print("Enter lines of text (enter 'q' to quit):")
while True:
    line = input()
    if line == 'q':
        break
    lines.append(line)

print("You entered the following lines:")
for line in lines:
    print(line)





