import pandas as pd

# Load the existing CSV file (replace with your file path)
input_file_path = '/Users/krishnasingh/Desktop/Intetrn_Project/NetflixCleaned Data.csv'  # Update this with your file path
df = pd.read_csv(input_file_path)

# Check the first few rows to understand the data
print("Original Data:")
print(df.head())

# Create new columns for Movie Duration and TV Seasons
df['Movie_Duration'] = df['duration'].apply(lambda x: int(x.split()[0]) if "min" in x else None)
df['TV_Seasons'] = df['duration'].apply(lambda x: int(x.split()[0]) if "Season" in x else None)

# Drop the original 'duration' column (optional)
# df = df.drop(columns=['duration'])

# Save the cleaned data to a new CSV file (replace with your desired output path)
output_file_path = '/Users/krishnasingh/Desktop/Intetrn_Project/processed_netflix_data.csv'  # Update this with your desired output path
df.to_csv(output_file_path, index=False)

print("Cleaned Data Saved to:", output_file_path)
