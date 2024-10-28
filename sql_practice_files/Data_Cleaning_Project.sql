-- Data Cleaning Project

Select *
From layoffs
;

-- Steps
-- 1. Remove Duplicates
-- 2. Standardize Data
-- 3. Null values or Blank values
-- 4. Remove any irrelevent columns

-- 1. Removing Duplicates
-- Creating a staging table so we can remove columns without altering the raw dataset
Create Table layoffs_staging
Like layoffs
;

Select *
From layoffs_staging
;

Insert layoffs_staging
Select *
From layoffs
;



With duplicate_cte as
(
Select *
,Row_Number() Over(
Partition By company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
From layoffs_staging
)
Select *
From duplicate_cte
Where row_num > 1
;

Select *
From layoffs_staging
Where company = 'Casper'
;

-- Creating new table so we can permanently have something with a row number
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Select *
From layoffs_staging2
;

Insert Into layoffs_staging2
Select *
,Row_Number() Over(
Partition By company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
From layoffs_staging
;

Select *
From layoffs_staging2
Where row_num > 1
;

Delete
From layoffs_staging2
Where row_num > 1
;

-- 2. Standardizing Data
Select company, Trim(company)
From layoffs_staging2
;

Update layoffs_staging2
Set company = Trim(company)
;

Select Distinct industry
From layoffs_staging2
Order By 1
;

Select *
From layoffs_staging2
Where industry Like 'Crypto%'
;

Update layoffs_staging2
Set industry = 'Crypto'
Where industry Like 'Crypto%'
;

Select Distinct country, Trim(Trailing '.' From country)
From layoffs_staging2
Order By 1
;

Update layoffs_staging2
Set country = Trim(Trailing '.' From country)
Where country Like 'United States%'
;

Select `date`
,STR_TO_DATE(`date`, '%m/%d/%Y')
From layoffs_staging2
;

Update layoffs_staging2
Set `date` = str_to_date(`date`, '%m/%d/%Y')
;

Alter Table layoffs_staging2
Modify Column `date` date
;

-- 3. Dealing with Null Values
Select *
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is Null
;

Update layoffs_staging2
Set industry = Null
Where industry = ''
;

Select * 
From layoffs_staging2
Where industry Is Null
Or industry = ''
;

Select *
From layoffs_staging2
Where company = 'Airbnb'
;

Select * 
From layoffs_staging2 as t1
Join layoffs_staging2 as t2
	On t1.company =t2.company
    And t1.location = t2.location
Where (t1.industry Is Null Or t1.industry = '')
And t2.industry Is Not Null
;

Update layoffs_staging2 as t1
Join layoffs_staging2 as t2
	On t1.company = t2.company
Set t1.industry = t2.industry
Where t1.industry Is Null 
And t2.industry Is Not Null
; 

Select * 
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is Null
;

Delete
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is Null
;

-- 4. Remove irrelevant columns
Select *
From layoffs_staging2
;

Alter Table layoffs_staging2
Drop Column row_num
;