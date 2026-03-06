------------------------------------------------
--Section 1 - Data Cleaning Validation Quieries
------------------------------------------------

    --Check for null values 
        SELECT
            COUNT(*) AS total_rows,
            SUM(CASE WHEN GPA IS NULL THEN 1 ELSE 0 END) AS missing_gpa,
            SUM(CASE WHEN Attendance_Rate IS NULL THEN 1 ELSE 0 END) AS missing_attendance,
            SUM(CASE WHEN Dropout IS NULL THEN 1 ELSE 0 END) AS missing_dropout
        FROM student_dropout_dataset;

    -- Check GPA Range validity 
            SELECT MIN(GPA) AS min_gpa, MAX(GPA) AS max_gpa
            FROM student_dropout_dataset;

    -- Check attendance range 
            SELECT MIN(Attendance_Rate), MAX(Attendance_Rate)
            FROM student_dropout_dataset;

   --  Check duplicate student ID 
            SELECT Student_ID, COUNT(*)
            FROM student_dropout_dataset
            GROUP BY Student_ID
            HAVING COUNT(*) > 1;
--------------------------------------------
-- Section 2 - Exploratory Analysis Queries 
--------------------------------------------

    -- Overall Dropout Rate 
SELECT 
    COUNT(*) AS total_students,
    SUM(Dropout) AS total_dropouts,
    ROUND(100.0 * SUM(Dropout) / COUNT(*), 2) AS dropout_percentage
FROM student_dropout_dataset;

-- Dropout by gender 
SELECT 
    Gender,
    COUNT(*) AS total,
    SUM(Dropout) AS dropouts,
    ROUND(100.0 * SUM(Dropout) / COUNT(*), 2) AS dropout_rate
FROM student_dropout_dataset
GROUP BY Gender;

-- Dropout by department 
SELECT 
    Department,
    COUNT(*) AS total,
    SUM(Dropout) AS dropouts,
    ROUND(100.0 * SUM(Dropout) / COUNT(*), 2) AS dropout_rate
FROM student_dropout_dataset
GROUP BY Department
ORDER BY dropout_rate DESC;

-- Average gpa of dropouts vs nondropout 
SELECT 
    Dropout,
    ROUND(AVG(GPA),2) AS avg_gpa,
    ROUND(AVG(Attendance_Rate),2) AS avg_attendance,
    ROUND(AVG(Stress_Index),2) AS avg_stress
FROM student_dropout_dataset
GROUP BY Dropout;

--------------------------------------------
--Section 3 - Risk Segmentation Queries
--------------------------------------------

-- Low GPA risk group 
SELECT 
    COUNT(*) AS total_low_gpa,
    SUM(Dropout) AS dropouts,
    ROUND(100.0 * SUM(Dropout)/COUNT(*),2) AS dropout_rate
FROM student_dropout_dataset
WHERE GPA < 2.5;

-- Low attendance risk 
SELECT 
    COUNT(*) AS total_low_attendance,
    SUM(Dropout) AS dropouts,
    ROUND(100.0 * SUM(Dropout)/COUNT(*),2) AS dropout_rate
FROM student_dropout_dataset
WHERE Attendance_Rate < 75;

-- Combined risk group 
SELECT 
    COUNT(*) AS high_risk_group,
    SUM(Dropout) AS dropouts,
    ROUND(100.0 * SUM(Dropout)/COUNT(*),2) AS dropout_rate
FROM student_dropout_dataset
WHERE GPA < 2.5
AND Attendance_Rate < 75;

--------------------------------------------
-- Section 4 - Insight Interpretation
--------------------------------------------

-- How strong is performance related to dropout 
SELECT 
    CASE 
        WHEN GPA >= 3.5 THEN 'High (3.5-4.0)'
        WHEN GPA >= 2.5 THEN 'Medium (2.5-3.49)'
        ELSE 'Low (<2.5)'
    END AS gpa_category,
    COUNT(*) AS total_students,
    SUM(Dropout) AS dropouts,
    ROUND(100.0 * SUM(Dropout)/COUNT(*),2) AS dropout_rate
FROM student_dropout_dataset
GROUP BY gpa_category
ORDER BY dropout_rate DESC;

-- Dropout based on parental education
SELECT 
    parental_education,
    COUNT(*) AS total_students,
    ROUND(AVG(Dropout) * 100, 2) AS dropout_percentage
FROM School_Dropout_Risk_Analysis.student_dropout_dataset_v3
GROUP BY parental_education
ORDER BY parental_education;


