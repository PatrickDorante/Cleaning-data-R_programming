# Load palmerpenguins packages to work on a new project and import tidyverse
# Load the dataset with the data() function 
# The goal of this project is to practice data visualization.
library(tidyverse)
library(palmerpenguins)
data("penguins")

# Overview of the data using summary() and glimpse() methods
summary(penguins)

glimpse(penguins)

as_tibble(penguins)

# Let's Cleaning up data with these packages
library(here)
library(skimr)
library(janitor)
library(dplyr)
library(visdat)

# Without pipe operator use select() function to work with one group of variable
select(penguins, species) # 1st. method

penguins %>% 
  select(species) # 2nd method


# Work with one or two or more groups of variables
select(penguins, species, island, sex, year)

penguins %>% 
  select(species, island, sex, year) # 2nd method


# Work without a group of variable or column
select(penguins, -species)

penguins %>% 
  select(-species) # 2nd method

# Work without two or more groups of variable or column
select(penguins, -species, -sex)

penguins %>% 
  select(species, island, sex, year) # 2nd method


# Create a variable and assign it to a new select function using %>% pipe operator
land_penguins <- penguins %>% 
                 select(species, island, sex, year)

# Output the new variable land_penguins
land_penguins


# rename() function would change a column's name
penguins %>% 
  rename(BMI = body_mass_g)

# Assign this function to a variable
bmi <- penguins %>% 
  rename(BMI = body_mass_g)

# Output the variable
bmi

# Change column names to upper case and be more consistent
rename_with(penguins, toupper)

# Change column names to lower case
rename_with(penguins, tolower)

# clean_names() 

penguins %>% 
  clean_names() %>% head()

# Filtering data

penguins %>% 
  select(species, island, sex, year) %>%
  filter(species == 'Chinstrap')

# The arrange() function lets you sort a dataframe by a variable of interest
penguins %>% 
  arrange(flipper_length_mm) %>%
  head()

# DESCENDANT ORDER
penguins %>% 
  arrange(desc(flipper_length_mm)) %>%
  rename(flipperLength = flipper_length_mm) %>%
  head()


# drop_na() function drop NA or remove missing values
penguins %>% 
  arrange(desc(flipper_length_mm)) %>%
  drop_na() %>%
  group_by(species) %>%
  head()

# mean() function group of columns
penguins %>% 
  arrange(desc(species)) %>%
  drop_na() %>%
  group_by(species) %>%
  summarise(Average_body_mass = mean(bill_length_mm)) 

# max() function group of columns
penguins %>% 
  arrange(desc(flipper_length_mm)) %>%
  drop_na() %>%
  group_by(species) %>%
  summarise(Max_body_mass = max(body_mass_g))

# min() function group of columns
penguins %>% 
  arrange(desc(flipper_length_mm)) %>%
  drop_na() %>%
  group_by(species) %>%
  head(Min_body_mass = min(body_mass_g))




install.packages("visdat")

library(visdat)
vis_dat(penguins)





















