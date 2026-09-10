# Library Management System – PostgreSQL

A PostgreSQL-based Library Management System designed to manage books, members, employees, library branches, book issues, returns, and library activity analytics.

## 📌 Project Overview

This project demonstrates how PostgreSQL and SQL can be used to build and analyze a relational database for a library.

The system manages important library operations such as:

- Managing books and their availability
- Managing library members
- Managing employees and branches
- Recording book issue transactions
- Recording returned books
- Identifying overdue books
- Analyzing borrowing patterns
- Generating useful library reports

## 🛠️ Technologies Used

- **PostgreSQL**
- **SQL**
- **pgAdmin 4**
- **Git & GitHub**

## 🗄️ Database Structure

The database contains the following major entities:

- **Books** – Stores book details such as title, author, category, publisher, rental price, and availability.
- **Members** – Stores registered library member information.
- **Employees** – Stores library employee information.
- **Branches** – Stores library branch details.
- **Issued Status** – Records books issued to members.
- **Return Status** – Records returned books and their condition.

## ⚙️ Core Features

### 1. Book Management

The system stores information about library books, including:

- ISBN
- Book title
- Category
- Author
- Publisher
- Rental price
- Availability status

### 2. Member Management

Member records include:

- Member ID
- Member name
- Address
- Registration date

### 3. Employee & Branch Management

The database maintains information about library employees and the branches they are associated with.

### 4. Book Issue Tracking

The system records:

- Issued book
- Member who borrowed the book
- Issue date
- Employee responsible for the transaction
- Book ISBN

### 5. Book Return Tracking

Returned books are recorded with:

- Return ID
- Issue ID
- Book name
- Return date
- Book ISBN
- Book quality/condition

# 📊 Analytics & Additional Work

Additional PostgreSQL analytics were implemented to provide more useful insights from the library data.

## 1. Overdue Book Report

### `library_overdue_report`

This view identifies books that have exceeded the defined 14-day borrowing period.

It provides:

- Issue ID
- Member ID
- Member name
- Book name
- Issue date
- Due date
- Number of overdue days
- Current book status

Possible statuses include:

- `Overdue`
- `Currently Issued`
- `Returned`

Example:

```sql
SELECT *
FROM library_overdue_report
ORDER BY overdue_days DESC;
