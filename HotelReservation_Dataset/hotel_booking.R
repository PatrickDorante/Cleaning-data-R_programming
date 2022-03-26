# Changing, manipulating and using statistical summaries with real data in R

library("tidyverse")
library("skimr")
library("janitor")


# import data with read_csv() function and it as a data frame

setwd('/Users/patrickdorante/Desktop/R folder')

# Read data in current working directory
hotel_reservations <- read_csv("hotel_bookings.csv")

# get to know your data with summary functions 

head(hotel_reservations)

str(hotel_reservations)

glimpse(hotel_reservations)

# List the names of the columns
colnames(hotel_reservations)

# Arrange the data 
arrange(hotel_reservations, desc(lead_time))
head(hotel_reservations)

# Create a new data frame
bookings_v2 <-
  arrange(hotel_reservations, desc(lead_time))

# Sorting the most MAX() and the least MIN() lead times 
head(bookings_v2)
max(hotel_reservations$lead_time)
min(hotel_reservations$lead_time)

# Dollar sign ($ Symbol) to specify the data set and column needs to use like a connection
min(lead_time) # Will display a common error without a $ symbol

mean(hotel_reservations$lead_time)

mean(bookings_v2$lead_time)

# Filter() function helps with 
bookings_city <-
filter(hotel_reservations, hotel_reservations$hotel =="City Hotel")

head(bookings_city)

# Look for the average lead time city hotels

mean(bookings_city$lead_time)

# Now use the pipe operator to make the code easier to read. Group and summarize functions
bookings_summary <-
  hotel_reservations %>% 
  group_by(hotel) %>% 
  summarise(avg_lead_time = mean(lead_time), # Average, min and max of the lead time
            min_lead_time = min(lead_time),
            max_lead_time = max(lead_time))

head(bookings_summary)

####################################################################################################################################################################################################################################
#**********************************************************************************************************************************************************************************************************************************
####################################################################################################################################################################################################################################

# Cleaning real data; Lesson #3
df_bookings <- read_csv("hotel_bookings.csv")
head(df_bookings) # Summary of data
str(df_bookings)
glimpse(df_bookings)
colnames(df_bookings)

# skim_without_chart() function provides a detailed summary of the data
skim_without_charts(df_bookings)

# Cleaning data by creating a new data frame with select()
trimmed_df <-
  df_bookings %>% 
  select(hotel, is_canceled, lead_time)

# CLeaning data with either split or combine data in different columns
trimmed_df %>% 
  select(hotel, is_canceled, lead_time) %>% 
  rename(hotel_type = hotel)

# Unite() function
df_example <- df_bookings %>% 
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")

# Mutate() make changes to your columns
df_example <- df_bookings %>% 
  mutate(guests = adults + children + babies)
head(df_example)

# Calculate the sum up cancel bookings and the average of lead time for bookings 
df_example <-
  df_bookings %>% 
  summarise(number_canceled = sum(is_canceled),
            avga_lead_time = mean(lead_time))

head(df_example)
