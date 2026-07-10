CREATE DATABASE cybersecurity_analytics;
USE cybersecurity_analytics;
CREATE TABLE cybersecurity_incidents (
    attack_type VARCHAR(50),
    target_system VARCHAR(50),
    outcome VARCHAR(20),
    timestamp TIME,
    attacker_ip VARCHAR(20),
    target_ip VARCHAR(20),
    data_compromised_GB DECIMAL(10,2),
    attack_duration_min INT,
    security_tools_used VARCHAR(50),
    user_role VARCHAR(50),
    location VARCHAR(50),
    attack_severity INT,
    industry VARCHAR(50),
    response_time_min INT,
    mitigation_method VARCHAR(50)
);
DROP TABLE IF EXISTS cybersecurity_incidents;

CREATE TABLE cybersecurity_incidents (
    attack_type VARCHAR(50),
    target_system VARCHAR(50),
    outcome VARCHAR(20),
    timestamp VARCHAR(50),
    attacker_ip VARCHAR(20),
    target_ip VARCHAR(20),
    data_compromised_GB DECIMAL(10,2),
    attack_duration_min INT,
    security_tools_used VARCHAR(50),
    user_role VARCHAR(50),
    location VARCHAR(50),
    attack_severity VARCHAR(20),
    industry VARCHAR(50),
    response_time_min INT,
    mitigation_method VARCHAR(50)
);
LOAD DATA LOCAL INFILE 'C:/Users/Uzma/cybersecurity_incidents_cleaned.csv'
INTO TABLE cybersecurity_incidents
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'   -- Windows files clear 
IGNORE 1 ROWS;

SELECT COUNT(*)
FROM cybersecurity_incidents;
-- ==================================================
-- Business Question 1: Overall Security Health
-- =================================================
#What is the total number of cybersecurity incidents?
SELECT COUNT(*) AS total_incidents
FROM cybersecurity_incidents;
#how much data has been compromised across all incidents?
SELECT ROUND(SUM(data_compromised_GB),2) AS total_data_compromised_gb
FROM cybersecurity_incidents;
#What is the average response time for cybersecurity incidents?
SELECT ROUND(AVG(response_time_min),2) AS avg_response_time_min
FROM cybersecurity_incidents;
#What is the distribution of incident outcomes?
SELECT outcome, COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY outcome
ORDER BY total_incidents DESC;

-- ==================================================
-- Business Question 2: Threat Landscape Analysis
-- ==================================================
#Which attack types occur most frequently?
SELECT attack_type,
       COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY attack_type
ORDER BY total_incidents DESC;

#Which attack types have the highest average severity?
SELECT attack_type,
       ROUND(AVG(attack_severity),2) AS avg_attack_severity
FROM cybersecurity_incidents
GROUP BY attack_type
ORDER BY avg_attack_severity DESC;

#Which attack types result in the highest average data loss?
SELECT attack_type,
       ROUND(AVG(data_compromised_GB),2) AS avg_data_compromised_gb
FROM cybersecurity_incidents
GROUP BY attack_type
ORDER BY avg_data_compromised_gb DESC;

-- ==================================================
-- Business Question 3: Industry Risk Profile
-- ==================================================
#Which industries experience the highest number of cybersecurity incidents?
SELECT industry,
       COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY industry
ORDER BY total_incidents DESC;

#Which industries have the highest average attack severity?
SELECT industry,
       ROUND(AVG(attack_severity),2) AS avg_attack_severity
FROM cybersecurity_incidents
GROUP BY industry
ORDER BY avg_attack_severity DESC;

#Which industries experience the highest average data compromised?
SELECT industry,
       ROUND(AVG(data_compromised_GB),2) AS avg_data_compromised_gb
FROM cybersecurity_incidents
GROUP BY industry
ORDER BY avg_data_compromised_gb DESC;

-- =============================================================
-- Business Question 4: Infrastructure & Target System Analysis
-- ============================================================
#Which target systems are attacked most frequently?
SELECT target_system,
       COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY target_system
ORDER BY total_incidents DESC;

#Which target systems experience the longest average attack duration?
SELECT target_system,
       ROUND(AVG(attack_duration_min),2) AS avg_attack_duration_min
FROM cybersecurity_incidents
GROUP BY target_system
ORDER BY avg_attack_duration_min DESC;

-- ======================================================
-- Business Question 5: Security Operations Effectiveness
-- ======================================================
#What is the average response time for each attack type?
SELECT attack_type,
       ROUND(AVG(response_time_min),2) AS avg_response_time_min
FROM cybersecurity_incidents
GROUP BY attack_type
ORDER BY avg_response_time_min DESC;

#Which security tools are used most frequently?
SELECT security_tools_used,
       COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY security_tools_used
ORDER BY total_incidents DESC;

#Which mitigation methods are used most frequently?
SELECT mitigation_method,
       COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY mitigation_method
ORDER BY total_incidents DESC;

-- =========================================================
-- Business Question 6: User & Geographic Risk
-- =========================================================
#Which user roles are targeted most frequently?
SELECT user_role,
       COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY user_role
ORDER BY total_incidents DESC;


#Which locations experience the highest number of cybersecurity incidents?
SELECT location,
       COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY location
ORDER BY total_incidents DESC;

-- =========================================================
-- Business Question 7: Advanced Risk Intelligence
-- =========================================================

#Classify cybersecurity incidents into Low, Medium, and High severity levels.
SELECT
    CASE
        WHEN attack_severity BETWEEN 1 AND 3 THEN 'Low'
        WHEN attack_severity BETWEEN 4 AND 7 THEN 'Medium'
        ELSE 'High'
    END AS severity_level,
    COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY severity_level
ORDER BY total_incidents DESC;

#Which attack types have an average response time higher than the overall average response time?
SELECT attack_type,
       ROUND(AVG(response_time_min),2) AS avg_response_time
FROM cybersecurity_incidents
GROUP BY attack_type
HAVING AVG(response_time_min) >
(
    SELECT AVG(response_time_min)
    FROM cybersecurity_incidents
)
ORDER BY avg_response_time DESC;

#How many incidents fall into each severity level, along with the average response time?
WITH severity_category AS
(
    SELECT
        CASE
            WHEN attack_severity BETWEEN 1 AND 3 THEN 'Low'
            WHEN attack_severity BETWEEN 4 AND 7 THEN 'Medium'
            ELSE 'High'
        END AS severity_level,
        response_time_min
    FROM cybersecurity_incidents
)

SELECT severity_level,
       COUNT(*) AS total_incidents,
       ROUND(AVG(response_time_min),2) AS avg_response_time
FROM severity_category
GROUP BY severity_level
ORDER BY avg_response_time DESC;

#What are the top 3 attack types within each industry?
WITH attack_counts AS
(
    SELECT industry,
           attack_type,
           COUNT(*) AS total_incidents,
           ROW_NUMBER() OVER (
               PARTITION BY industry
               ORDER BY COUNT(*) DESC
           ) AS attack_rank
    FROM cybersecurity_incidents
    GROUP BY industry, attack_type
)

SELECT attack_rank,
       industry,
       attack_type,
       total_incidents
FROM attack_counts
WHERE attack_rank <= 3;




SELECT attack_type,
       COUNT(*) AS total_incidents
FROM cybersecurity_incidents
GROUP BY attack_type
ORDER BY total_incidents DESC; 