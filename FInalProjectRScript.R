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













