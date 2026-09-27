# 🚀 Kickstarter Success Factors

## 📌 Project Overview

This project analyzes Kickstarter crowdfunding campaigns to understand which factors are associated with campaign success or failure.

The analysis focuses on campaign characteristics such as:

- Funding goal
- Amount pledged
- Number of backers
- Category
- Country
- Campaign outcome
- Goal achievement

The project uses **SQL** to transform raw campaign data into business insights.

---

## 🎯 Business Problem

A Kickstarter campaign can succeed or fail depending on several factors.

For a campaign creator, important questions include:

- Does setting a smaller funding goal improve the chance of success?
- Does having more backers relate to campaign success?
- Which categories have higher success rates?
- How does goal achievement differ between successful campaigns?
- Are some countries associated with higher campaign success?
- Are there patterns in when campaigns are launched?

The goal of this project is to use historical Kickstarter campaign data to identify these patterns.

> **Important:** This analysis identifies relationships and patterns in the data. It does not prove that one factor directly causes campaign success.

---

## 🛠️ Tools Used

- **SQL**
- **SQLite**
- **DB Browser for SQLite**
- **GitHub**

No Power BI dashboard was used for this project. The purpose of this project is to demonstrate **SQL analysis and business reasoning**.

---

## 📊 Dataset

The project uses a Kickstarter campaign dataset containing information such as:

- Campaign name
- Category
- Funding goal
- Pledged amount
- Number of backers
- Country
- Launch date
- Campaign state

The raw CSV dataset and SQLite database are maintained locally because the files are too large for GitHub's standard web upload limit.

The SQL analysis file is included in this repository so the analytical logic and queries can be reviewed directly.

---

## 🔎 Analysis Performed

### 1. Goal Achievement

Calculated the percentage of the funding goal achieved:

```sql
ROUND((pledged / goal) * 100, 2) AS goal_achievement
```

This helps compare campaigns with different funding goals.

---

### 2. Funding Goal Analysis

Campaigns were grouped into funding-goal ranges to investigate the relationship between the amount requested and campaign success.

The analysis showed a clear difference between lower and higher funding goals.

For example:

| Funding Goal | Success Rate |
|---|---:|
| Under $5K | 50.8% |
| $100K+ | 11.61% |

This suggests that campaigns requesting smaller amounts were more frequently successful in this dataset.

---

### 3. Backer Analysis

The number of backers was analyzed against campaign outcomes.

Examples from the analysis:

| Backers | Success Rate |
|---|---:|
| 0–10 | 4.29% |
| 1,000+ | 98.42% |

Campaigns with a large number of backers were much more frequently successful.

This indicates a strong relationship between campaign success and the ability to attract supporters.

---

### 4. Category Analysis

Campaigns were grouped by category and compared using success rates.

One of the strongest-performing categories in the analysis was:

**Dance: 69.52% success rate**

Category-level analysis helps identify areas where campaigns historically had different success rates.

---

### 5. Goal Achievement Analysis

Campaigns were grouped according to how much of their funding goal they achieved.

The analysis created ranges such as:

- 100%–150%
- 150%–200%
- 200%–500%
- 500%+

The purpose was to understand how campaigns performed after reaching their original funding target.

---

### 6. Country Analysis

Campaigns were grouped by country to compare campaign volume and success patterns across locations.

This helps identify geographic differences in Kickstarter activity and campaign outcomes.

---

### 7. Launch Timing Analysis

Campaign launch dates were analyzed to identify patterns across different launch periods.

This can help investigate whether campaign success varies depending on when campaigns are launched.

---

## 📈 Key Findings

The analysis produced several important observations:

### 💰 Smaller funding goals were associated with higher success rates

Campaigns with lower funding goals generally had higher success rates than campaigns with very large goals.

The analysis found:

- Under $5K → **50.8% success**
- $100K+ → **11.61% success**

---

### 👥 Backer count was strongly associated with success

Campaigns with very few backers had low success rates, while campaigns attracting large numbers of backers had much higher success rates.

For example:

- 0–10 backers → **4.29% success**
- 1,000+ backers → **98.42% success**

This makes the number of supporters an important indicator when analyzing campaign performance.

---

### 🎭 Success rates differed by category

Different Kickstarter categories showed different historical success rates.

The Dance category reached a **69.52% success rate** in this analysis.

This suggests that campaign category is another useful variable when evaluating historical campaign outcomes.

---

### 📊 Successful campaigns could greatly exceed their original goals

The dataset contained campaigns that pledged far more than their original funding targets.

The analysis calculated:

- Average funding goal → **$10,162.96**
- Average pledged amount → **$24,099.78**
- Average goal achievement → **855.75%**

The very high average goal-achievement figure is influenced by campaigns that greatly exceeded their original funding goals.

---

## 💡 Business Insights

Based on the analysis, Kickstarter campaign creators can consider the following:

1. **Set realistic funding targets.**  
   Very large funding goals were associated with lower historical success rates.

2. **Focus on attracting backers.**  
   Campaigns with larger numbers of backers were strongly associated with successful outcomes.

3. **Understand category performance.**  
   Historical success rates varied considerably across categories.

4. **Track goal achievement separately from campaign status.**  
   A campaign can technically succeed while also greatly exceeding its original target.

5. **Use historical data when planning campaigns.**  
   Past campaign patterns can provide useful benchmarks for setting goals and evaluating campaign strategy.

These are observations from historical data rather than guarantees of future campaign performance.

---

## 🧠 SQL Skills Demonstrated

This project demonstrates practical SQL skills including:

- `SELECT`
- `WHERE`
- `CASE`
- `COUNT`
- `SUM`
- `AVG`
- `GROUP BY`
- `ORDER BY`
- `HAVING`
- Aggregate functions
- Calculated fields
- Percentage calculations
- Conditional grouping
- Success-rate calculations
- Business-oriented data analysis

---

## 📁 Project Structure

```text
kickstarter-campaign-analysis/
│
├── kickstarter_analysis.sql
├── .gitignore
└── README.md
```

### File descriptions

`kickstarter_analysis.sql`  
SQL queries used throughout the analysis.

`README.md`  
Project documentation, methodology, findings, business insights, and limitations.

`.gitignore`  
Prevents large local dataset and database files from being tracked unnecessarily.

### Local project files

The following files are maintained locally:

- `kickstarter_raw.csv` - Raw Kickstarter dataset
- `kickstarter_analysis.db` - SQLite database used for analysis
- `kickstarter_analysis.sqlb.sqbpro` - DB Browser for SQLite project file

---

## 🎯 Project Outcome

The project transformed raw Kickstarter campaign data into a set of SQL-based business insights.

The main conclusion from the analysis is that **funding goal, number of backers, and campaign category are all associated with differences in Kickstarter campaign success rates**.

The project demonstrates how SQL can be used to move from:

**Raw Data → SQL Analysis → Patterns → Business Insights**

---

## ⚠️ Limitations

This project has several limitations:

- The analysis is based on historical Kickstarter campaigns.
- Association does not mean causation.
- Other factors such as marketing quality, creator reputation, campaign page quality, and social-media reach may also influence success.
- The analysis does not predict whether a future campaign will succeed.
- Extreme campaigns can influence averages, particularly goal-achievement percentages.

---

## 👤 Author

**Afnan M**

Data Analyst Portfolio Project

Skills demonstrated: **SQL • Data Analysis • SQLite • Business Problem Solving**
