


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
![Correlation Matrix of Economic Indicators](./visualizations/(<Correlation Matrix of Economic Indicators.png>)) 
![GDP Per Capita by Country](./visualizations/(<GDP Per Capita by Country (1).png>))
![Unemployment Rate by Country](./visualizations/(<Unemployment Rate by Country (1).png>))
![World Map with Unemployment Rate](./visualizations/(<World Map with Unemployment Rate.png>))
![World Map with GDP Per Capita](./visualizations/(<World Map with GDP Per Capita.png>))
![Clustering of Countries Based on Economic Data](./visualizations/(<Clustering of Countries Based on Economic Data.png>))
![Country Clusters Based on Economic Indicators](./visualizations/(<Country Clusters Based on Economic Indicators.png>))
![Country Clusters Based on Tourism Factors](./visualizations/(<Country Clusters Based on Tourism Factors.png>))
![Random Forest Model_ Actual vs. Predicted GDP](./visualizations/(<Random Forest Model_ Actual vs. Predicted GDP.png>))