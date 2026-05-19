# Astro E-Commerce Data Pipeline

## Overview
This project demonstrates an end-to-end data pipeline for extracting, cleaning, and storing product data from an e-commerce platform (Astro). The workflow consists of web scraping, data preprocessing, and relational database modeling using PostgreSQL.

## Tech Stack
- **Python**: Core programming language.
- **Selenium & BeautifulSoup**: Used for automating web browser interaction and parsing HTML to scrape product data.
- **Pandas**: Utilized for data manipulation, cleaning, and formatting.
- **PostgreSQL**: Used as the relational database to store the final normalized data.

## Project Structure
- `coda_P0M1_Arief_Bagus_Nugraha.ipynb`: The main Jupyter Notebook containing the web scraping script. It navigates the target website, extracts details like product names, prices, delivery types, and discounts, performs data cleaning, and exports the results.
- `coda_P0M1_Arief_Bagus_Nugraha_Mentah.csv`: The raw, uncleaned dataset directly obtained from the scraping process.
- `coda_P0M1_Arief_Bagus_Nugraha.csv`: The cleaned and formatted dataset, ready for database ingestion.
- `coda_P0M1_Arief_Bagus_Nugraha.sql`: The SQL script used to create staging tables, normalize the data into dimension and fact tables, and load the cleaned CSV data into the database.

## Database Schema
The project implements a normalized relational database schema:
1. **`master_pengiriman`**: A dimension table storing unique delivery types (e.g., Instant).
2. **`barang_final`**: The main fact table storing product details (name, price, discount) with a foreign key (`id_pengiriman`) referencing the delivery type.

## How to Run
1. **Data Scraping & Cleaning**: Execute the cells in `coda_P0M1_Arief_Bagus_Nugraha.ipynb` to scrape the data and generate the CSV files.
2. **Database Setup**: 
   - Ensure PostgreSQL is installed and running.
   - Update the file path in the `COPY` command within the `coda_P0M1_Arief_Bagus_Nugraha.sql` file to point to the absolute path of your cleaned CSV file.
   - Run the SQL script to create the tables and populate them with the data.

## Author
Arief Bagus Nugraha