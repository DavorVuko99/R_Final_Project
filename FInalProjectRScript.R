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

# Read in the "movies explicit content.csv" file and save it as movies
BurlingtonCrimeData <- read.csv("ArrestsDataScienceFinal.csv")

```

## Testing to see if our datat us there

```{r}

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

```













