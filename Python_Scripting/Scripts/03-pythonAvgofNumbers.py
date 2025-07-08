# Full path: /03-pythonAvgofNumbers.py
# Function to calculate the average of numbers by using the input() function in Python
def calculate_avarage():
    # Get the number of elements
    n = int(input('Enter the number of elements: '))
    # Initialize the sum of numbers
    sum = 0
    # Get the numbers from the user
    for i in range(n):
        num = float(input('Enter number: '))
        sum += num
    # Calculate the average
    avg = sum/n
    # Display the average
    print('The average of', n, 'numbers is:', round(avg, 2))

if __name__ == '__main__':
    calculate_avarage()

# Output:
# Enter the number of elements: 5
# Enter number: 10
# Enter number: 20
# Enter number: 30
# Enter number: 40
# Enter number: 50
# The average of 5 numbers is: 30.0
