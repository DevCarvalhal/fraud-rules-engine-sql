# Fraud Detection Rules Engine (SQL)

## Overview
This project simulates a fraud detection system built entirely in SQL, inspired by real-world fintech risk and fraud operations.

The goal is to identify suspicious transactions, assign risk scores, and prioritize cases for investigation.

---

## Business Problem
Financial institutions must detect fraudulent transactions in real time while prioritizing investigation efforts efficiently.

This project demonstrates how to:
- Apply fraud detection rules
- Calculate risk scores
- Prioritize cases for investigation
- Support analysts with actionable queries

---

## Dataset
Simulated transactional data including:
- Customers
- Transactions
- Risk signals (e.g., new device, international activity)

---

## Tech Stack
- SQL (PostgreSQL / SQLite compatible)
- Git & GitHub

---

## Project Structure

---

## Fraud Rules Implemented
- High transaction amount (> 3000)
- International transaction
- New device usage

Each rule contributes to a risk score.

---

## Risk Scoring Model
Transactions receive a score based on triggered rules:

- High amount → +20
- International → +25
- New device → +15

Total score determines investigation priority.

---

## Investigation Prioritization
- High Priority (score ≥ 40)
- Medium Priority (score ≥ 20)
- Low Priority (score < 20)

---

## Key Insights
- Identification of high-risk transactions
- Detection of unusual behavior patterns
- Prioritization of cases for fraud analysts

---

## Analyst Queries
Includes queries for:
- Case volume by priority
- Average risk score
- International suspicious transactions
- New device activity
- High-risk customers

---

## What This Project Demonstrates
- Fraud detection logic using SQL
- Risk scoring models
- Analytical thinking applied to fraud scenarios
- Data-driven prioritization

---

## Next Steps
- Integrate with dashboard tools (Power BI / Tableau)
- Expand rule set
- Add machine learning models

---

## Author
Vitor Carvalhal  
Data Analyst | Fraud & Risk Analytics