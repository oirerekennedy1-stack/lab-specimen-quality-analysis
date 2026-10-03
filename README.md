# lab-specimen-quality-analysis
Cleaning and analysis of a lab specimen dataset — Python, MySQL, Tableau

Cleaned and analyzed a 5,000-row medical lab specimen dataset to investigate
rejection rates and turnaround times across departments.

**Key finding:** Emergency has a significantly higher rejection rate (10.6%
vs ~9% overall) with no single dominant cause — rejection reasons are evenly
spread across leaking containers, wrong containers, clotted specimens, and
others. Turnaround time is essentially the same across all departments,
suggesting the issue relates to the Emergency environment itself rather
than one fixable process step.

**Tools:** Python (pandas), MySQL, Tableau

**Live dashboard:** [View on Tableau Public](https://public.tableau.com/views/LabSpecimenQualityAnalysis/LabSpecimenQualityRejectionTurnaroundAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Files
- `Pathon_practice.ipynb` — data cleaning and SQL/analysis walkthrough, with cleaning log in markdown cells
- `querries.sql` — SQL queries used for department-level analysis
- `specimens_clean.csv` — cleaned dataset
