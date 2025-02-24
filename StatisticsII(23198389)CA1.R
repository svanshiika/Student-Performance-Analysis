# Load necessary libraries
library(tidyverse)
library(psych)
library(caret)
install.packages('ggcoo]rrplot')
library(ggcorrplot)

# Load data (replace with your file path)
data <- read.csv("C:\\Users\\HP\\Documents\\BSc in Data Science\\Year 2\\Semester 3\\Statistics II\\CA 1 Datasets\\Sampled Data of Hundred.csv")
head(data)

# Convert Categorical Columns to Boolean (1/0)
binary_columns <- c("Extracurricular_Activities", "Internet_Access", "Learning_Disabilities")
data[binary_columns] <- lapply(data[binary_columns], function(x) ifelse(x == "Yes", 1, 0))

# Encode Additional Columns
data$Gender <- ifelse(data$Gender == "Male", 1, 0)   # Male = 1, Female = 0
data$School_Type <- ifelse(data$School_Type == "Public", 1, 0)  # Public = 1, Private = 0

# Convert Motivation_Level into numeric levels
data$Motivation_Level <- factor(data$Motivation_Level, levels = c("Low", "Medium", "High"), ordered = TRUE)
data$Motivation_Level <- as.numeric(data$Motivation_Level)

# Convert Access_to_Resources into numeric levels
#factor(): Converts the column into a factor, which is used to represent categorical variables in R.
data$Access_to_Resources <- factor(data$Access_to_Resources, levels = c("Low", "Medium", "High"), ordered = TRUE)
data$Access_to_Resources <- as.numeric(data$Access_to_Resources)

# Convert Family_Income into numeric levels
data$Family_Income <- factor(data$Family_Income, levels = c("Low", "Medium", "High"), ordered = TRUE)
data$Family_Income <- as.numeric(data$Family_Income)

# Check the updated structure
str(data)

# Step 5: Preprocess Numerical Variables for PCA
# Select only numerical columns for PCA
numerical_data <- data %>%
  select(Hours_Studied, Attendance, Sleep_Hours, Previous_Scores, 
         Extracurricular_Activities, Internet_Access, Learning_Disabilities, 
         Motivation_Level, Access_to_Resources, Family_Income, Exam_Score)


# Summarize data
summary(data)
describe(data)

# Select numeric variables for correlation
numeric_data <- data %>% select_if(is.numeric)

# Calculate correlation matrix
cor_matrix <- cor(numeric_data, use = "complete.obs")
print(cor_matrix)

# Visualize correlation matrix
ggcorrplot(cor_matrix)


# Select relevant features for PCA
selected_features <- data %>%
  select(Attendance, Hours_Studied, Motivation_Level, Access_to_Resources, Exam_Score)

# Step 1: Standardize the data (excluding Exam_Score)
data_scaled <- scale(selected_features %>% select(-Exam_Score))  # Standardize only the predictors

# Step 2: Perform PCA
pca_result <- prcomp(data_scaled, center = TRUE, scale. = TRUE)

# Step 3: PCA Summary
summary(pca_result)  # Show variance explained by components
# Scree plot to visualize variance explained
screeplot(pca_result, type = "lines", main = "Scree Plot for Selected Features")

biplot(pca_result)
# Step 4: View PCA Loadings
pca_result$rotation  # Loadings of each variable on principal components

# Step 5: Create a new dataset with PCA components and Exam_Score
# Select the first three principal components
selected_pcs <- data.frame(pca_result$x[, 1:3])  # Adjust the number of PCs based on your selection

# Combine PCs with the original target variable (Exam_Score)
regression_data <- cbind(selected_pcs, Exam_Score = selected_features$Exam_Score)

# Rename the principal component columns for clarity (optional)
colnames(regression_data)[1:2] <- c("PC1", "PC2",'PC3')

# View the combined data
head(regression_data)

# Fit a linear regression model using the principal components
model <- lm(Exam_Score ~ ., data = regression_data)

# Display the summary of the regression model
summary(model)

# Step 7: Diagnostic Plots
par(mfrow = c(2, 2))  
plot(model)  

# Identify outliers using standardized residuals
standardized_residuals <- rstandard(model)
outliers <- which(abs(standardized_residuals) > 3)  # Residuals greater than |3|

# Print the indices of the outliers
print(outliers)

# Remove the outliers from the dataset
cleaned_data <- regression_data[-outliers, ]

# Refit the linear regression model
new_model <- lm(Exam_Score ~ ., data = cleaned_data)

# Display the summary of the updated model
summary(new_model)

# Diagnostic plots for the updated model
par(mfrow = c(2, 2))
plot(new_model)






