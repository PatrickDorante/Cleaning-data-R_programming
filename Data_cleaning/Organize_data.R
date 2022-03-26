# How to clean data as a data analyst?
# Use the janitor, skim, and Here packages for cleaning data

install.packages("here")
install.packages("skimr")

library("here")
library("skimr")
library("janitor")
library("dplyr")
library("palmerpenguins")
library("tidyverse")


# Cleaning functions: skim_without_charts give us a clean summary of the datasets

skim_without_charts(penguins)
glimpse(penguins)

# check only a specific column or groups of variables

penguins %>% 
  select(-species)

# Rename() function makes thing easy to change column names

penguins %>% 
  rename(islanders = island)


# rename_with() can change column names for more consistent

rename_with(penguins, toupper)

rename_with(penguins, tolower)

# Organizing data and sorting data ASC order

penguins %>% 
  arrange(bill_length_mm)

# Arrange or sorting data DESC order, add a minus sign before the variable

penguins %>%  
  arrange(-bill_length_mm)

# Grouping By data, and remove N/A values with drop() function 

penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(mean_bill_length_mm = mean(bill_length_mm))


# Find the max of the bill length

penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(max_bill_length_mm = max(bill_length_mm))

# Find both max and mean of the data

penguins %>% 
  group_by(species, island) %>% 
  drop_na() %>% 
  summarize(max_bill_length = max(bill_length_mm), mean_bill_length = mean(bill_length_mm))

# Mutate to add variable columns in data frames

penguins %>% 
  mutate(body_mass_kg = body_mass_g/1000)

penguins %>% 
  mutate(body_mass_kg = body_mass_g/1000, flipper_len_m = flipper_length_mm/1000)

#########################################################################################################
#########################################################################################################
#########################################################################################################

# Transforming Data. Create a data frame from scratch

id <- c(1:10)

full_name <- c("Rob Software", "Rachel Davis", "Johnson Smith", "Jack Kitman", "Monica Kat", "Bill Harper", "Catline Jones", "Gaty James", "Robert Boppy", "Matin Carib")

pro_title <- c("Data Science", "Budget Analysis", "Software Developer", "Data Analyst", "Project Management","Senior Java Developer", "HR Clerical", "Executive", "Research Coordinator", "Management")


job <- data.frame(id, full_name, pro_title)

print(job)

# To split columns, we use separate function 

separate(job, full_name, into=c("firstName", "lastName"), sep= " ")

unite(job, 'names ', full_name, sep = ' ')
