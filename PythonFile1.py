import pandas as pd

# Load the data from your CSV file
file_path = r"C:\Users\HP\Documents\BSc in Data Science\Year 2\Semester 3\Statistics II\CA 1 Datasets\StudentPerformanceFactors.csv"
df = pd.read_csv(file_path)

# Generate a random sample of 100 rows
sample_df = df.sample(n=100, random_state=42)

# Save the sample to a new CSV file with the custom name "Sampled Data of Hundred.csv"
output_path = r"C:\Users\HP\Documents\BSc in Data Science\Year 2\Semester 3\Statistics II\CA 1 Datasets\Sampled Data of Hundred.csv"
sample_df.to_csv(output_path, index=False)

print(f"Sampled data saved to {output_path}")
