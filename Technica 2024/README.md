# MyCare: Self-Care and Sustainability Tracking Application

## Overview

MyCare is an application for self-care, personal growth, and eco-conscious living. Designed to encourage mindfulness in physical and mental health and environmental impact, MyCare empowers users to reflect on their wellness while tracking their contribution to climate action and community wellness. The app was inspired by our combined skills and interests in personal growth, data science, sustainability, web development, and UX/UI design. Through MyCare, users can track hydration, nourishment, emotional well-being, and CO₂ reduction, fostering a sense of connection to a community of eco-conscious individuals.

## What It Does

MyCare provides a dynamic journal and activity log where users can:
- Track well-being activities like exercise and gratitude.
- Log sustainable actions, such as biking and public transport usage.
- Keep a daily reflection log with prompts and sentiment analysis to monitor emotional health.
- Track personal statistics (e.g., hydration, exercise) alongside eco-impact summaries.
- View "mindful reminders" based on recent activity to reinforce self-care and eco-friendly habits.
- Check their progress on the “social good meter,” which displays individual contributions toward community goals in wellness and carbon reduction.

## How We Built It

- **Data Processing and Analysis**: Using Python libraries (NumPy, Pandas, TextBlob) in Google Colab and Jupyter Notebooks.
- **UX/UI Design**: Figma for creating design prototypes and visualizing the user interface.
- **Front-End Development**: HTML, CSS, and JavaScript for structuring and styling the application.
- **Open Data Integration**: Using open-source CO₂ data from Our World in Data to calculate individual and community-level impacts.

## Key Features and Data Analysis

- **Sentiment Analysis**: Using TextBlob to analyze journal entries, classifying them as positive, neutral, or negative.
- **Eco-Impact Tracking**: CO₂ reduction calculations derived from sustainable choices, comparing individual contributions to national data.
- **Community Goals**: Aggregated user data tracks collective progress on mental wellness and carbon reduction.
- **Weekly Summaries**: Visual metrics on hydration, exercise, and mood; Matplotlib visualizations for weekly CO₂ saved, exercise, journal sentiment, and more.
- **Mindful Reminders**: Motivational prompts generated based on recent activities, reinforcing positive self-care and sustainable habits.

## Data Workflow

1. **Simulated Data**: Created random activity data for initial testing; real user data is now incorporated.
2. **Sentiment Analysis**: Sentiments from journal entries are categorized as positive, neutral, or negative.
3. **CO₂ Impact Calculation**: Real-time tracking of daily, weekly, and monthly reductions in CO₂ emissions based on user actions.
4. **Community Goals**: Cumulative user data on CO₂ reduction and mental wellness is visualized in progress bars.
5. **User Summaries**: Daily and weekly summaries of wellness stats are stored in Google Sheets, with averages updated for front-end integration.

## Visualizations and Front-End Design

- **Figma**: Designed the landing page, journal, and thoughts pages for a smooth user experience.
- **Landing Page**: Allows users to track daily mood, hydration, and body needs.
- **Journal Page**: Features gratitude prompts and private journaling for personal reflection.
- **Thoughts Page**: Confidential space for users to process thoughts.
- **Matplotlib Visualizations**: Graphs for weekly metrics, such as exercise, mood trends, and CO₂ savings.
![Unknown-1](https://github.com/user-attachments/assets/1dc4ecdf-c5d6-44a5-886f-14492cc24ed6)
![moodrating](https://github.com/user-attachments/assets/bc0c1702-f496-460a-889b-ed010b06a6e4)
![CO2savings](https://github.com/user-attachments/assets/0e994806-0f61-4632-86f5-aa10630bc232)
![h20intake](https://github.com/user-attachments/assets/f79ec5c9-fd26-4026-b932-21b42e811217)


## Challenges

- Integrating self-care and sustainability concepts with our tech stack.
- Collaborative front-end development and connecting data-driven insights to the user interface.
- Incorporating real-time user data and open-source CO₂ data into meaningful, interactive visualizations.

## Accomplishments

- Successfully developed both front and back ends.
- Real-time data storage and processing with Google Sheets API.
- Generated insightful weekly metrics and visualizations for user summaries.

## Lessons Learned

- **Trinity**: Learned TextBlob for sentiment analysis, lambda functions in Pandas, and the DateTime library for data handling.
- **Navya**: Improved understanding of the data process and connection between front and back ends.
- **Amy**: Enhanced CSS skills for UI design, particularly in complementary color schemes and accessible layout design.

## What's Next

- Refine UI color schemes to better represent biodiversity.
- Implement a mascot/logo to promote eco-conscious lifestyles.
- Incorporate machine learning for predicting user wellness and sustainability scores.
- Add a profile page and extend MyCare to mobile development.
- Expand community data to fully achieve wellness goals and enhance the social good meter.
- Integrate JavaScript with processed data for a seamless user experience.
