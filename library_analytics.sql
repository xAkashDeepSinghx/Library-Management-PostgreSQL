-- ============================================================
-- Library Management System - Additional Analytics
-- PostgreSQL
-- ============================================================


-- ============================================================
-- 1. OVERDUE BOOK REPORT
-- ============================================================

CREATE OR REPLACE VIEW library_overdue_report AS
SELECT
    i.issued_id,
    i.issued_member_id,
    m.member_name,
    i.issued_book_name,
    i.issued_date,
    (i.issued_date + INTERVAL '14 days')::date AS due_date,

    CASE
        WHEN r.return_date IS NULL
             AND CURRENT_DATE > i.issued_date + INTERVAL '14 days'
        THEN CURRENT_DATE - (i.issued_date + INTERVAL '14 days')::date
        ELSE 0
    END AS overdue_days,

    CASE
        WHEN r.return_date IS NULL
             AND CURRENT_DATE > i.issued_date + INTERVAL '14 days'
        THEN 'Overdue'
        WHEN r.return_date IS NULL
        THEN 'Currently Issued'
        ELSE 'Returned'
    END AS book_status

FROM issued_status i
JOIN members m
    ON i.issued_member_id = m.member_id
LEFT JOIN return_status r
    ON i.issued_id = r.issued_id;


-- ============================================================
-- 2. MOST BORROWED BOOKS
-- ============================================================

CREATE OR REPLACE VIEW most_borrowed_books AS
SELECT
    issued_book_name AS book_title,
    COUNT(*) AS times_borrowed
FROM issued_status
GROUP BY issued_book_name
ORDER BY times_borrowed DESC;


-- ============================================================
-- 3. MEMBER BORROWING SUMMARY
-- ============================================================

CREATE OR REPLACE VIEW member_borrowing_summary AS
SELECT
    m.member_id,
    m.member_name,
    COUNT(i.issued_id) AS books_borrowed
FROM members m
JOIN issued_status i
    ON m.member_id = i.issued_member_id
GROUP BY m.member_id, m.member_name
ORDER BY books_borrowed DESC;


-- ============================================================
-- TEST QUERIES
-- ============================================================

SELECT *
FROM library_overdue_report
ORDER BY overdue_days DESC;

SELECT *
FROM most_borrowed_books;

SELECT *
FROM member_borrowing_summary;