🛡️ Cybersecurity Threat & Incident Analytics Dashboard

📖 Project Overview

This project is an end-to-end Cybersecurity Threat & Incident Analytics solution built using Python, MySQL, and Power BI. The objective is to analyze cybersecurity incidents, identify attack patterns, evaluate industry risk, measure security operations performance, and provide actionable business insights through an interactive dashboard.

The project follows a complete analytics workflow including data cleaning, SQL-based business analysis, DAX calculations, and Power BI dashboard development.


🎯 Objectives


Analyze cybersecurity incidents across multiple industries.
Identify the most frequent cyber attack types.
Measure business impact through compromised data analysis.
Evaluate response time and attack duration.
Assess mitigation strategies and security tool usage.
Provide executive-level and operational security insights.



🛠️ Tools & Technologies


Python (Pandas)
MySQL
Power BI
Power Query
DAX
Microsoft Excel
Git & GitHub



📊 Dataset Information

The dataset contains 100,000 cybersecurity incidents with the following attributes:


Attack Type
Target System
Incident Outcome
Attack Timestamp
Attacker IP
Target IP
Data Compromised (GB)
Attack Duration
Security Tools Used
User Role
Location
Attack Severity
Industry
Response Time
Mitigation Method


Note on dataset: This is a synthetically generated dataset, and incident counts are distributed near-uniformly across attack types, industries, and security tools (e.g., all industries fall within a narrow 0.63M–0.64M GB compromised range). This project is intended to demonstrate the analytics workflow — data cleaning, SQL querying, DAX modeling, and dashboard design — rather than to surface real-world threat patterns, since the underlying data has limited natural variance. In a production setting, the same pipeline applied to real incident data would be expected to surface clearer, actionable patterns.


🧹 Data Cleaning (Python)

The dataset was cleaned and prepared using Python before importing it into MySQL and Power BI.

Cleaning steps included:


Handling missing values
Correcting data types
Removing inconsistencies
Preparing the dataset for SQL analysis
Exporting the cleaned dataset for dashboard development



🗄️ SQL Analysis

The cleaned dataset was imported into MySQL where multiple business questions were answered using SQL.

Business Questions

Overall Security Health


Total cybersecurity incidents
Total data compromised
Average incident response time
Incident outcome distribution


Threat Landscape Analysis


Most frequent attack types
Attack types with highest severity
Attack types causing the highest average data loss


Industry Risk Profile


Industries with the highest incidents
Industries with highest attack severity
Industries with highest average data compromise


Infrastructure & Target System Analysis


Most targeted systems
Systems with longest attack duration


Security Operations Effectiveness


Average response time by attack type
Most commonly used security tools
Most frequently used mitigation methods


User & Geographic Risk Analysis


Most targeted user roles
Countries with the highest number of incidents


Advanced Risk Intelligence


Severity classification using CASE statements
Attack types exceeding average response time
Incident count and response time by severity level
Top 3 attack types within each industry using Window Functions



📈 Power BI Dashboard

The dashboard consists of two interactive pages.

Page 1 – Executive Security Overview

KPIs


Total Incidents
Total Data Compromised (GB)
Average Response Time (Min)
Successful Attacks


Visuals


Total Incidents by Attack Type
Incident Outcome Distribution
Incident Distribution by Location
Total Incidents by Severity



Page 2 – Detailed Threat Analysis

KPIs


Average Attack Duration
Critical Attacks
Failed Attacks
Average Data Compromised


Visuals


Total Data Compromised by Industry
Security Tools Distribution
Severity Distribution Across Industries
Total Incidents by Mitigation Method



📐 DAX Measures

The dashboard uses custom DAX measures including:


Total Incidents
Total Data Compromised
Average Response Time
Successful Attacks
Average Attack Duration
Critical Attacks
Failed Attacks
Average Data Compromised



📷 Dashboard Preview

Executive Security Overview


(Insert Page 1 Screenshot Here)



Detailed Threat Analysis


(Insert Page 2 Screenshot Here)




💡 Key Insights


Across 100,000 incidents, average response time was 90.5 minutes and average attack duration was 151.07 minutes.
Incident outcomes were split almost evenly between successful and failed attacks (~50/50), with no single attack type standing out as more successful than others.
Attack types, industries, and security tools were all represented in near-equal proportions in this dataset — a limitation of the synthetic data rather than a real-world finding (see Dataset note above).
Medium and Low severity incidents accounted for the largest share of attacks, with High and Critical incidents each making up a smaller, roughly equal portion.
SIEM, IDS, and Endpoint Detection were among the most frequently used security tools, each used in a comparable share of incidents.
This project demonstrates the ability to build a full BI pipeline — cleaning, SQL analysis, DAX modeling, and dashboarding — that is ready to surface meaningful patterns once applied to a real-world incident dataset.



📂 Repository Structure

Cybersecurity-Threat-Incident-Analytics
│
├── Dashboard
│   └── Cybersecurity_Threat_Analytics.pbix
│
├── Dataset
│   └── cybersecurity_incidents_cleaned.csv
│
├── SQL
│   └── cybersecurity_analysis.sql
│
├── Images
│   ├── Dashboard_Page1.png
│   └── Dashboard_Page2.png
│
├── Documentation
│   └── DAX_Measures.md
│
└── README.md


🚀 Skills Demonstrated


Data Cleaning with Python
SQL Query Writing
Window Functions
Common Table Expressions (CTEs)
Aggregate Functions
Data Modeling
DAX Calculations
Interactive Dashboard Design
Business Intelligence
Data Visualization



👩‍💻 Author

Uzma Sayyed

SQL | Power BI | Python | Excel
