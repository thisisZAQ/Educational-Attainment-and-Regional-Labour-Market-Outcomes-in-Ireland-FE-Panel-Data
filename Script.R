install.packages("fixest")    
install.packages("dplyr")
install.packages("readr")

library(fixest)
library(dplyr)
library(readr)
library(readxl)
library(ggplot2)

data <- read_excel("data.xlsx")
View(data)
summary(data)

data <- data %>%
  mutate(year = as.numeric(year))

data <- data %>%
  mutate(region = as.factor(region))

library(fixest)

##baseline model
model1 <- feols(employment ~ tertiary, data = data)
summary(model1)

##adding GDP to model
model2 <- feols(employment ~ tertiary + log(gdp_pc), data = data)
summary(model2)

##full FE model
model3 <- feols(employment ~ tertiary + log(gdp_pc) | region + year,
                data = data,cluster = ~region)

etable(model1, model2, model3)

#facet plot
ggplot(data, aes(x = tertiary, y = employment)) +
  geom_point(color = "steelblue", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "darkred") +
  facet_wrap(~region) +
  labs(
    title = "Education and Employment Across Irish Regions",
    x = "Tertiary Education Attainment (%)",
    y = "Employment Rate (%)"
  ) +
  theme_minimal()

library(ggplot2)

#scatter plot with reg line
ggplot(data, aes(x = tertiary, y = employment, color = region)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Tertiary Education and Employment in Irish Regions (2013–2024)",
    x = "Tertiary Education Attainment (%)",
    y = "Employment Rate (%)",
    color = "Region"
  ) +
  theme_minimal()

#trend line
ggplot(data, aes(x = year, y = employment, color = region)) +
  geom_line(size = 1.2) +
  geom_point() +
  labs(
    title = "Employment Trends Across Irish Regions (2013–2024)",
    x = "Year",
    y = "Employment Rate (%)"
  ) +
  theme_minimal()

#improved regression with lagged variable
data <- data %>%
  arrange(region, year) %>%
  group_by(region) %>%
  mutate(tertiary_lag = lag(tertiary, 1))

model_lag <- feols(
  employment ~ tertiary_lag + log(gdp_pc) | region + year,
  data = data,
  cluster = ~region)

summary(model_lag)