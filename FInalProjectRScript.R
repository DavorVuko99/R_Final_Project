---
title: "Final Project Script"
author: "Davor Vukoja and Diwas Dahal"
date: "CS 2870"
output: html_document
---
  
## Set Up Your Project and Load Libraries

```{r setup, message = FALSE}
knitr::opts_chunk$set(echo = F,
                      fig.align = "center") 

## Load the libraries we will be using
pacman::p_load(gapminder, socviz, tidyverse, dplyr)

<<<<<<< HEAD
=======
# Read in the "movies explicit content.csv" file and save it as movies
BurlingtonCrimeData <- read.csv("ArrestsDataScienceFinal.csv")

>>>>>>> 25a7354b3bd08b47ea4a0259fe1296c2464902de
```

## Testing to see if our datat us there

```{r}
<<<<<<< HEAD
BurlingtonCrimeData <- read.csv(ArrestsDataScienceFinal.csv)

```


## Clearing the data

```{r reading the data}
library(lubridate)

ArrestsData <- 
  BurlingthonArrestsData
  colnames(ArrestsData) <- 
    tolower(colnames(ArrestsData))
  
  ArrestsData <- ArrestsData |>
  mutate(  # Convert date to date type
    year = year(arrest_date),
    month = month(arrest_date),
    month_label = month.abb[month(arrest_date)],
    day = yday(arrest_date)
  ) 
  
  #clearing the gender data
  ArrestsData <- ArrestsData |>
    mutate(gender = case_when(
    gender == "Male - M" ~ "M",
    gender == "Female - F" ~ "F",
    TRUE ~ gender  # Keep other values unchanged
  ))
  
  #clearing the race data
  ArrestsData <- ArrestsData |>
    mutate(race = case_when(
    race == "White - W" ~ "White",
    race == "Black or African American - B" ~ "Black",
    race == "Asian - A" ~ "Asian",
    TRUE ~ race  # Keep other values unchanged
  ))
  
  
  #clearing the ethnicity data
  ArrestsData <- ArrestsData |>
    mutate(ethnicity = case_when(
    ethnicity == "Not Hispanic or Latino - N" ~ "N",
    ethnicity == "Hispanic or Latino - H" ~ "Y",
    ethnicity == "Unknown - U" ~ "NA",
    
    TRUE ~ ethnicity  # Keep other values unchanged
  ))
  
  #clearing the charges data so we know what type of charge it was
  #ArrestsData <- ArrestsData |>
    #mutate(spc_charge = str_extract(charge, "[0-9-].*$"))
  
  # Filter data for the year 2018 and later
  ArrestsData <- 
    ArrestsData |>
    filter(year >= 2018)
  
  
tibble(ArrestsData)
=======

# Assuming your dataset is named BurlingtonCrimeData
BurlingtonCrimeData <- BurlingtonCrimeData |>
  filter(!(gender %in% c("Non-Binary/Other - X", "Transgender - T", "Unknown - U")))

# Summarize the counts of violent crimes by gender, excluding specific categories
crime_counts <- BurlingtonCrimeData |>
  group_by(gender) |>
  summarize(Count_Violent_Crimes = sum(violent, na.rm = TRUE))

# Create a histogram using ggplot
gender_vs_violent_crimes <- ggplot(data = crime_counts, 
                                   mapping = aes(x = gender, y = Count_Violent_Crimes, fill = gender)) +
  
  geom_bar(stat = "identity") +
  
  labs(title = "Histogram of Violent Crimes by Gender",
       x = "Gender",
       y = "Number of Violent Crimes") +
  
  coord_cartesian(ylim = c(0, max(crime_counts$Count_Violent_Crimes) + 10)) +  # Set ylim based on your data
  
  theme_bw()

gender_vs_violent_crimes
>>>>>>> 25a7354b3bd08b47ea4a0259fe1296c2464902de

```

```{r}
# Convert arrest_date to a valid date format
BurlingtonCrimeData$arrest_date <- as.Date(BurlingtonCrimeData$arrest_date, format = "%m/%d/%y")

# Extract year and month from arrest_date
BurlingtonCrimeData <- BurlingtonCrimeData |>
  mutate(
    year_month = floor_date(arrest_date, unit = "month"),  # floor to the beginning of the month
    year_month_label = format(year_month, "%b %Y")
  )

# Separate data into four dataframes
violent_crimes_2018_to_2020 <- BurlingtonCrimeData |>
  filter(arrest_date >= as.Date("2018-01-01") & arrest_date < as.Date("2020-03-01") & violent == TRUE)

violent_crimes_2020_to_current <- BurlingtonCrimeData |>
  filter(arrest_date >= as.Date("2020-03-01") & violent == TRUE)

non_violent_crimes_2018_to_2020 <- BurlingtonCrimeData |>
  filter(arrest_date >= as.Date("2018-01-01") & arrest_date < as.Date("2020-03-01") & violent == FALSE)

non_violent_crimes_2020_to_current <- BurlingtonCrimeData |>
  filter(arrest_date >= as.Date("2020-03-01") & violent == FALSE)

# Count the number of rows in each dataframe
non_violent_count_2018_to_2020 <- nrow(non_violent_crimes_2018_to_2020)
non_violent_count_2020_to_current <- nrow(non_violent_crimes_2020_to_current)

# Create a new dataframe named non_violent_bar_data
non_violent_bar_data <- data.frame(
  Period = c("2018 to March 2020", "March 2020 to Current"),
  Count = c(non_violent_count_2018_to_2020, non_violent_count_2020_to_current)
)

# Count the number of rows in each dataframe
violent_count_2018_to_2020 <- nrow(violent_crimes_2018_to_2020)
violent_count_2020_to_current <- nrow(violent_crimes_2020_to_current)

# Create a new dataframe named non_violent_bar_data
violent_bar_data <- data.frame(
  Period = c("2018 to March 2020", "March 2020 to Current"),
  Count = c(violent_count_2018_to_2020, violent_count_2020_to_current)
)


```

Now with all the filtered data that is serperated into individual dataframe, we can plot the number of violent Crimes pre and post COVID

```{r}
# Combine non-violent and violent bar data
combined_bar_data <- rbind(
  mutate(non_violent_bar_data, Crime_Type = "Non-Violent"),
  mutate(violent_bar_data, Crime_Type = "Violent")
)

# Calculate the percentage of total crimes
combined_bar_data <- combined_bar_data |>
  group_by(Period)|>
  mutate(Percentage = Count / sum(Count) * 100)

# Plot the combined bar chart
ggplot(data = combined_bar_data, 
       mapping = aes(x = Period, y = Percentage, fill = Period)) +
  
  geom_bar(stat = "identity") +
  
  facet_wrap(~Crime_Type, scales = "free_y", ncol = 2) +
  
  labs(title = "Crime Comparison",
       x = "Period",
       y = "Percentage of Total Crimes") +
  
  theme_bw() +
  
  scale_y_continuous(
    limits = c(0, 85),
    breaks = seq(0, 85, 10),
    labels = scales::percent_format(scale = 1),
    expand = c(0, 0, 0.05, 0)) +
  
  scale_x_discrete(labels = c("2018 to March 2020" = "Pre-Covid", "March 2020 to Current" = "Post-Covid"))


```











