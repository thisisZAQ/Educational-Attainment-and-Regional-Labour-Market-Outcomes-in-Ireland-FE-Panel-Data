# Education and Employment Dynamics in Irish Regions

## Project Overview

This project examines the relationship between **tertiary educational attainment and regional employment outcomes in Ireland**. Using regional panel data, the analysis investigates whether increases in higher education attainment are associated with improvements in employment performance across Irish regions over time.

The project applies **panel data econometric techniques** to explore the relationship between human capital and labour market outcomes. The analysis is implemented in **R** using fixed-effects regression models.

---

## Research Question

**Does an increase in tertiary education attainment contribute to higher employment levels across Irish regions?**

This question is motivated by **Human Capital Theory**, which suggests that higher levels of education improve worker productivity and labour market outcomes.

---

## Data

The dataset contains **annual observations from 2013–2024** for Irish **NUTS-2 regions**.

### Variables

| Variable | Description |
|--------|-------------|
| employment | Regional employment rate (%) |
| tertiary | Share of population aged 25–64 with tertiary education |
| gdp_pc | Regional GDP per capita |
| region | Irish NUTS-2 region |
| year | Observation year |

### Dataset Structure

- **Regions:** 3  
- **Years:** 12  
- **Observations:** 36  

The dataset is structured as a **panel dataset** and was processed in **R**.

---

## Methodology

The following **fixed-effects panel regression model** is estimated:

\[
Employment_{rt} =
\beta_1 Education_{r,t-1}
+ \beta_2 \log(GDP_{rt})
+ \alpha_r + \gamma_t + \epsilon_{rt}
\]

Where:

- **αᵣ** = region fixed effects  
- **γₜ** = year fixed effects  
- **εᵣₜ** = error term  

Model features:

- Region fixed effects to control for structural regional differences  
- Year fixed effects to capture macroeconomic shocks  
- Clustered standard errors at the regional level  
- Lagged education variable to partially address endogeneity

The regression is estimated using the **fixest** package in R.

---

## Results

The regression results indicate:

- A **positive but statistically insignificant relationship** between lagged tertiary education attainment and employment.
- **GDP per capita** also shows no statistically significant effect within the small sample.

A **partial regression plot** is used to visualise the relationship between education and employment after controlling for other variables.

---

## Limitations

Several limitations should be considered:

1. **Small sample size** (36 observations) limits statistical power.
2. The dataset contains only **three regional units**, reducing cross-sectional variation.
3. **Potential endogeneity** between education and employment may remain.
4. Education effects may operate **over longer time horizons** than captured in the dataset.

Future research could extend the analysis using:

- Larger regional datasets  
- Longer time periods  
- Instrumental variable approaches  

---

## Tools and Software

This project uses the following tools:

- **R** – data processing and econometric analysis  
- **fixest** – fixed-effects regression estimation  
- **ggplot2** – data visualisation  
- **dplyr / tidyverse** – data manipulation  

---

## Repository Structure
