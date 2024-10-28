-- Exploratory Data Analysis

Select *
From layoffs_staging2
;

Select Max(total_laid_off)
,Max(percentage_laid_off)
From layoffs_staging2
;

Select *
From layoffs_staging2
Where percentage_laid_off = 1
Order By funds_raised_millions Desc
;

Select company, Sum(total_laid_off)
From layoffs_staging2
Group By company
Order By 2 Desc
;

Select Min(`date`)
,Max(`date`)
From layoffs_staging2
;

Select industry
,Sum(total_laid_off)
From layoffs_staging2
Group By industry
Order By 2 Desc
;

Select country
,Sum(total_laid_off)
From layoffs_staging2
Group By country
Order By 2 Desc
;

Select Year(`date`)
,Sum(total_laid_off)
From layoffs_staging2
Group By Year(`date`)
Order By 1 Desc
;

Select Substring(`date`,1,7) As `Month`
,Sum(total_laid_off)
From layoffs_staging2
Where Substring(`date`,1,7) is not NULL
Group by `Month`
Order by 1 Asc
;

With Rolling_Total as
(
Select Substring(`date`,1,7) As `Month`
,Sum(total_laid_off) as total_off
From layoffs_staging2
Where Substring(`date`,1,7) is not NULL
Group by `Month`
Order by 1 Asc
)
Select `Month`
,total_off
,Sum(total_off) Over(Order By `Month`) as rolling_total
From Rolling_Total
;

Select company, Sum(total_laid_off)
From layoffs_staging2
Group By company
Order By 2 Desc
;