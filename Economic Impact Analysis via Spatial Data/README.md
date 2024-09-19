


# Economic and Geospatial Data Analysis

## Overview

This project explores the relationship between economic indicators and geospatial data across multiple countries. The analysis focuses on merging unstructured economic data with geospatial information, creating visualizations, and using machine learning to predict GDP per capita based on key economic factors.

## Objectives

- Analyze world economic and geospatial data.
- Visualize the geospatial distribution of economic indicators such as GDP per capita and unemployment rates.
- Use machine learning models and AI to predict GDP per capita and cluster countries based on their economic profiles.
- Draw insights into the correlation between different economic variables and GDP per capita.

## Tools

- **Google Colab**
- **Python** (Pandas, GeoPandas, Scikit-learn, Matplotlib, Seaborn, Numpy)
- **K-Means Clustering**
- **Random Forest Regressor**

## Data

- **Economic data**: Sourced from Kaggle, containing indicators such as GDP per capita, annual income, unemployment rates, corruption index, tourism data, and more.
- **Geospatial data**: Sourced from Natural Earth, providing country boundaries, population data, and area measurements.

## The Journey

1. **Data Preprocessing**:
   - Merged economic data files and filtered through Natural Earth shapefiles for geospatial data.
   - Cleaned the data by removing rows with missing or NaN values for countries without geospatial information. 
   - Merged the economic and geospatial data to create a comprehensive dataset, with matching records for the US, Mexico, and Canada.

2. **Visualizations**:
   - Created a **world map** visualization displaying GDP per capita for countries using GeoPandas.
   - Visualized the **unemployment rate** across different countries on a world map.
   - Used **K-Means clustering** to group countries based on economic data, highlighting similarities and differences in economic performance.

3. **Machine Learning Models**:
   - **Random Forest Regressor** was used to predict GDP per capita with **annual income**, **unemployment rate**, and **corruption index** as input features.
   - The model achieved a **Mean Squared Error (MSE)** of **1.62**, suggesting a near-perfect fit, but cross-validation revealed a more realistic mean MSE of **42,233,750.20**.
   - The data was scaled to improve model performance, yielding similar MSE scores.

4. **AI and Insights**:
   - The AI model effectively captured key economic trends. For example, the predicted GDP per capita was approximately **$70,000 for the US**, **$55,000 for Mexico**, and **$53,000 for Canada**.
   - **Annual income** and **receipts in billions** were found to have the highest correlation with GDP per capita, while **corruption index** and **unemployment rate** had the lowest.
   - **K-Means clustering** revealed meaningful patterns among countries, grouping them based on their economic data, which helped in better understanding global economic disparities.

## Results

- **Visualizations**:
  - World map of GDP per capita.
  - Unemployment rate map.
  - Clustering map showing groups of countries based on economic similarity.
  
- **Machine Learning**:
  - Random Forest model's MSE on unscaled data: **1.62**.
  - Cross-validation MSE score: **42,233,750.20**.
  - Key economic features with the highest correlation to GDP per capita: **annual income**, **receipts in billions (from tourism)**.

- **Lessons Learned**:
  -  I kept some rows with missing values (as dropping all rows with missing values wound up eliminating every country except for the United States) and continued with the excitement of working through this project and seeing more than one country explored and analyzed.
  - The geo data had 4 unique countries to work with (US, Mexico, Canada, and Belize), while the economic data provided a greater breadth of countries around the world. It would have been much more interesting to see other countries and continents included in the analysis, especially regarding the visualizations! I realize it would have been more fruitful to check for unique countries earlier on, and subsequently choose another dataset for geospatial analysis with a more widespread representation; But we live, and most importantly, learn!
  - Upon re-uploading the 10m_cultural, this time using **fiona** to read the shapefiles, I was able to plot countries such as Liberia, Djibouti, Hong Kong, Singapore, Luxembourg, and Mali. However, they only appeared on simple visualizations and failed to appear as a world map; US, Mexico, Canada, and Belize could not appear, either. 

  
## Instructions

1. Clone the repository.
2. Navigate to the project directory.
3. Ensure you have the necessary libraries installed:
   ```bash
   pip install pandas geopandas scikit-learn matplotlib seaborn


## Visualizations
![Correlation Matrix of Economic Indicators](https://github.com/user-attachments/assets/a28b1aa6-294c-44f3-8b07-56e30b506619)
![World Map with GDP Per Capita](https://github.com/user-attachments/assets/7ad8ac02-c477-43b3-9c93-3acb389287ab)
![World Map with Unemployment Rate](https://github.com/user-attachments/assets/082fb913-12dc-4a63-8155-e3da612148d0)
![World Map with Tourists in Millions](https://github.com/user-attachments/assets/ad7f9377-2679-4302-863e-6b84b07fdbaa)
![World Map with Corruption Index](https://github.com/user-attachments/assets/4e7a6018-ab1c-4778-9237-fd1ae5f4215a)
![Country Clusters Based on Tourism Factors](https://github.com/user-attachments/assets/d87cbdac-a342-43fe-bae0-fdaa6c6b6f1c)
![Country Clusters Based on Economic Indicators](https://github.com/user-attachments/assets/16724ba0-a153-4281-b455-3b921605f977)
![Clustering of Countries Based on Economic Data](https://github.com/user-attachments/assets/e1025607-0638-4e78-99a9-5ded7e98a5c0)
![Unemployment Rate by Country (1)](https://github.com/user-attachments/assets/4d504009-8924-45d5-a930-cb7ebfe7792a)
![GDP Per Capita by Country (1)](https://github.com/user-attachments/assets/cc6b2715-a783-4837-9f40-09e39de46e9a)
![Corruption Index by Country (1)](https://github.com/user-attachments/assets/6578886d-787b-4d0e-9b01-322df07daebe)


