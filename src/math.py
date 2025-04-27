from collections import Counter

class StatisticsCalculator:
    """
    An object-oriented statistics calculator for a list of integers.
    Provides methods to compute mean, median, and mode.
    """
    def __init__(self, data: list[int]):
        """
        Initialize the calculator with a list of integers.
        """
        self.data = data

    def mean(self) -> float:
        """
        Calculate the arithmetic mean of the data.
        Returns 0.0 if the data list is empty.
        """
        if len(self.data) == 0:
            return 0.0
        # Use Python's built-in sum and len functions
        return sum(self.data) / len(self.data)

    def median(self) -> float:
        """
        Calculate the median of the data.
        If the number of data points is even, return the average of the two middle values.
        Returns 0.0 if the data list is empty.
        """
        n = len(self.data)
        if n == 0:
            return 0.0
        sorted_data = sorted(self.data)
        if n % 2 == 1:
            # Odd length: middle element
            return float(sorted_data[n // 2])
        else:
            # Even length: average of the two middle elements
            mid1 = sorted_data[n // 2 - 1]
            mid2 = sorted_data[n // 2]
            return (mid1 + mid2) / 2.0

    def mode(self) -> int:
        """
        Calculate the mode of the data (most frequent value).
        If multiple values are equally frequent, returns one of them.
        Returns 0 if the data list is empty.
        """
        if len(self.data) == 0:
            return 0
        # Use Counter to count frequencies and get the most common element
        freq = Counter(self.data)
        mode_val, count = freq.most_common(1)[0]
        return mode_val

# Example usage:
if __name__ == "__main__":
    data = [5, 3, 8, 3, 9, 1]
    calc = StatisticsCalculator(data)
    print("Data:", data)
    print(f"Mean: {calc.mean():.2f}")
    print(f"Median: {calc.median():.2f}")
    print(f"Mode: {calc.mode()}")
