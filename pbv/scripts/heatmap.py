import numpy as np
import matplotlib.pyplot as plt

# Define the range of numbers
start = 0
end = 15  # Adjust the end value as needed

# Generate all possible combinations of numbers in the range
numbers = np.arange(start, end + 1)
pairs = np.array(np.meshgrid(numbers, numbers)).T.reshape(-1, 2)

# Perform bitwise AND operation for each pair
results = [pair[0] & pair[1] for pair in pairs]

# Reshape the results into a square matrix
matrix_size = len(numbers)
results_matrix = np.array(results).reshape(matrix_size, matrix_size)

# Reverse the order of numbers on the y-axis
reversed_numbers = np.flip(numbers)

# Reverse the order of rows in the results matrix
reversed_results_matrix = np.flip(results_matrix, axis=0)

# Create heatmap
plt.figure(figsize=(8, 6))
plt.imshow(reversed_results_matrix, cmap='hot', interpolation='nearest')

# Customize plot
plt.title('Bitwise AND Heatmap')
plt.xlabel('Number 1')
plt.ylabel('Number 2')
plt.colorbar(label='Bitwise AND Result')
plt.xticks(np.arange(matrix_size), numbers)
plt.yticks(np.arange(matrix_size), reversed_numbers)

# Show plot
plt.show()
