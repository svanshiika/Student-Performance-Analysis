# 📊 Student Performance Prediction

A statistical analysis exploring how socioeconomic, behavioural, and resource-related factors impact students' exam scores. Using **Regression Analysis** and **Principal Component Analysis (PCA)**, this project predicts academic performance based on study hours, attendance, motivation, and access to resources. The analysis was conducted using **R** for data cleaning, modelling, and visualisation.

---

## 📁 Dataset
- **Source:** [Kaggle](https://www.kaggle.com/datasets)  
- **Entries:** 100 sampled from 6,607 original records  
- **Features:** 20 variables, including hours studied, attendance, motivation level, and access to resources.

---

## 📊 Techniques Used
- **Regression Analysis** – to predict exam scores based on selected features.
- **Principal Component Analysis (PCA)** – to reduce dimensionality and highlight key variables.
- **Correlation Analysis** – to identify relationships between variables and exam performance.

---

## 🛠 Tools & Libraries
- **R Programming Language**  
- **Packages Used:**
  - `dplyr` – Data manipulation  
  - `psych` – Descriptive statistics  
  - `ggplot2` – Data visualisation  
  - `caret` – Data preprocessing and scaling  
  - `stats` – Correlation and PCA

---

## 📈 Key Findings
- **Attendance** had the highest positive correlation with exam scores (0.558).
- **Hours Studied** also showed a strong positive impact (0.478).
- **Motivation Level** and **Access to Resources** contributed positively but to a lesser extent.
- The final regression model had an **Adjusted R² of 0.7945**, indicating strong predictive accuracy.

---

## 📊 Visualisations
- Correlation heatmaps  
- Scree plots from PCA  
- Residual plots for regression analysis  
- Actual vs Predicted exam scores graph  

---


## 💡 Future Work

- Implement Machine Learning models like Random Forest or SVM for improved predictions.
- Apply deep learning techniques for better feature extraction.
- Explore the use of time-series data to track student performance trends over time.


