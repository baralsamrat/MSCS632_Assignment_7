#include <stdio.h>
#define MAX_SIZE 100  // Maximum number of elements the array can hold

// Calculate the mean (average) of an array of integers.
// Returns 0.0 if the array is empty.
double calculate_mean(int arr[], int n) {
    if (n == 0) {
        return 0.0;
    }
    long sum = 0;
    for (int i = 0; i < n; ++i) {
        sum += arr[i];  // Sum all elements
    }
    // Divide by n (cast to double for floating-point division)
    return (double) sum / n;
}

// Helper function to sort an array of integers in non-decreasing order.
// Uses a simple selection sort for demonstration purposes.
void sort_array(int arr[], int n) {
    for (int i = 0; i < n - 1; ++i) {
        int min_index = i;
        for (int j = i + 1; j < n; ++j) {
            if (arr[j] < arr[min_index]) {
                min_index = j;
            }
        }
        // Swap the current element with the smallest remaining element
        int temp = arr[i];
        arr[i] = arr[min_index];
        arr[min_index] = temp;
    }
}

// Calculate the median of an array of integers.
// If n is odd, returns the middle element of the sorted array.
// If n is even, returns the average of the two middle elements.
// Returns 0.0 if the array is empty.
double calculate_median(int arr[], int n) {
    if (n == 0) {
        return 0.0;
    }
    // Create a copy of the array to sort, so as not to modify the original data
    int temp[MAX_SIZE];
    for (int i = 0; i < n; ++i) {
        temp[i] = arr[i];
    }
    sort_array(temp, n);
    if (n % 2 != 0) {
        // Odd number of elements: return the middle one
        return (double) temp[n / 2];
    } else {
        // Even number of elements: return average of the two middle values
        int mid1 = temp[(n / 2) - 1];
        int mid2 = temp[n / 2];
        return (mid1 + mid2) / 2.0;
    }
}

// Calculate the mode of an array of integers (the most frequently occurring value).
// If there are multiple modes, this returns one of them. Returns 0 if the array is empty.
int calculate_mode(int arr[], int n) {
    if (n == 0) {
        return 0;
    }
    // Sort a copy of the array to group identical values together
    int temp[MAX_SIZE];
    for (int i = 0; i < n; ++i) {
        temp[i] = arr[i];
    }
    sort_array(temp, n);
    int mode_value = temp[0];
    int mode_count = 1;
    int current_count = 1;
    // Traverse the sorted array and count occurrences of each value
    for (int i = 1; i < n; ++i) {
        if (temp[i] == temp[i - 1]) {
            // Same value as previous element, increment current run count
            current_count++;
        } else {
            // Value changed, check if the previous run was the longest (most frequent)
            if (current_count > mode_count) {
                mode_count = current_count;
                mode_value = temp[i - 1];
            }
            current_count = 1;  // reset count for the new value
        }
    }
    // Final check for the last run of numbers
    if (current_count > mode_count) {
        mode_count = current_count;
        mode_value = temp[n - 1];
    }
    return mode_value;
}

// Example usage
int main(void) {
    int data[] = {5, 3, 8, 3, 9, 1};  // Sample data set
    int n = 6;                       // Number of elements in data
    double mean = calculate_mean(data, n);
    double median = calculate_median(data, n);
    int mode = calculate_mode(data, n);
    // Print results
    printf("Data: ");
    for (int i = 0; i < n; ++i) {
        printf("%d ", data[i]);
    }
    printf("\n");
    printf("Mean: %.2f\n", mean);
    printf("Median: %.2f\n", median);
    printf("Mode: %d\n", mode);
    return 0;
}
