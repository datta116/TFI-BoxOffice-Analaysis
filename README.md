# 🎬 TFI Box Office Analysis Dashboard (Tollywood)

A complete end-to-end data analytics pipeline that scrapes, cleans, validates, and visualizes the box office performance of the Telugu Film Industry (TFI).

---

## 📊 Dashboard Preview
*The dashboard features deep dives into Hero-wise performance, Year-over-Year trends, and Opening Day records.*

[![TFI Analysis Dashboard](https://github.com/datta116/TFI-BoxOffice-Analaysis/blob/f910c17895d4f98c15919583c0706fa1c5501745/Dashboard.png)](https://app.powerbi.com/view?r=eyJrIjoiMmJlYjRkOTUtM2UwMi00MDk3LWIzOTgtYzlhOWM0MmJhMGVkIiwidCI6IjEwZDg5ZTg1LWM2MTEtNDk5MS04YmNiLTJiYzM0MjFlMDYwZCJ9)
> **[🚀 View Live Interactive Dashboard](https://app.powerbi.com/view?r=eyJrIjoiMmJlYjRkOTUtM2UwMi00MDk3LWIzOTgtYzlhOWM0MmJhMGVkIiwidCI6IjEwZDg5ZTg1LWM2MTEtNDk5MS04YmNiLTJiYzM0MjFlMDYwZCJ9)**

---

## 🏗️ Project Architecture
This project demonstrates a full-stack data professional's workflow:

1.  **Data Acquisition (`Web_scraping.ipynb`)**: 
    * Automated scraping of movie data (Collections, Verdicts, Hero names) using **BeautifulSoup** and **Requests**.
2.  **Data Processing (`main.ipynb` & `Raw_data_loading.ipynb`)**:
    * Cleaned "Master" datasets.
    * Handled multi-star movies (e.g., splitting "Jr NTR/Ram Charan" into separate entries for individual analysis).
    * Imputed missing collection data using hero-specific fallback logic.
3.  **Data Validation (`Data Validation.sql`)**:
    * Performed integrity checks in **SQL Server** to ensure Day 1 collections do not exceed Total Worldwide Gross.
    * Validated movie counts and verdict distributions (Blockbuster, Hit, Flop).
4.  **Business Intelligence (`Boxoffice Analysis(TFI).pbix`)**:
    * Created complex DAX measures for success rates and annual trends.

## 🛠️ Tech Stack
* **Python:** BeautifulSoup, Pandas, NumPy (Data Scraping & Wrangling)
* **SQL:** MS SQL Server (Data Validation & Integrity)
* **BI Tool:** Power BI (Data Visualization)
* **Data Source:** Web-scraped e-commerce and box office portals.

## 📈 Key Analysis Points
* **Top Openers:** Analysis of Day 1 Worldwide Gross (featuring records from *Pushpa 2*, *RRR*, *Kalki 2898 AD*, etc.).
* **Hero-Wise Success Rate:** A breakdown of verdicts (ATB, Blockbuster, Hit, Average, Flop) for top stars.
* **Annual Trends:** Tracking the growth of TFI worldwide collections from 1990 to 2025.
* **Prabhas Special Analysis:** A specific module focusing on the "Baahubali" star's career trajectory and massive opening day contributions.

## 📂 File Description
* `data.csv` / `main.csv`: The primary datasets containing movie names, heroes, and collections.
* `Data Validation.sql`: SQL scripts used to verify dashboard numbers against the raw database.
* `Dashboard.html`: Redirection link to the published Power BI report.

---

## ⚙️ How to Setup
1.  **Scrape Data:** Run `Web_scraping.ipynb` to get the latest movie stats.
2.  **Clean Data:** Run `main.ipynb` to generate the `final.csv`.
3.  **Database:** Import `final.csv` into SQL Server and run the validation scripts.
4.  **Visualize:** Open the `.pbix` file in Power BI Desktop to explore the visuals.

**Author:** [Your Name]
