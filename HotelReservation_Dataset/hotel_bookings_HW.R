# Changing, manipulating and using statistical summaries with real data in R

library("tidyverse")
library("skimr")
library("janitor")
library("ggplot2")

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


####################################################################################################################################################################################################################################
#**********************************************************************************************************************************************************************************************************************************
####################################################################################################################################################################################################################################

# Create data visualizations with ggplot2 use point with scatterplots
hotel_reservations <- read_csv("hotel_bookings.csv")
ggplot(data = hotel_reservations) +
  geom_point(mapping = aes(x = lead_time, y = children))

# Geom_point x, y plots
ggplot(data = hotel_reservations) +
  geom_point(mapping = aes(x = 'stay_in_weekend_nights', y = 'children' ))

# Plot a chart with geom_bar
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = distribution_channel))

# modifying the code by exploring the bar chart 
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = distribution_channel))

# deposit_type includes colored_coded sections of each bar
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = distribution_channel, fill=deposit_type))

# market_segment data is being recorded in the color_coded sections of each bar
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = distribution_channel, fill = market_segment))

# Facet_wrap(~) cut or create bar separate bar charts

ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)

# create a plot with rotated labels
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))


# create a plot with rotated labels with different chart for market segment
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

# split the charts

ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

####################################################################################################################################################################################################################################
#**********************************************************************************************************************************************************************************************************************************
####################################################################################################################################################################################################################################

# Filtering and plot: scatterplot
ggplot(data = hotel_reservations) +
  geom_point(mapping = aes(x = lead_time, y = children))

# bar chart 
ggplot(data = hotel_reservations) + 
  geom_bar(mapping = aes(x = hotel, fill = market_segment))

# facet_wrap() function to create a separate plot for each section
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~market_segment)

# Filtering data that are online TA only and create plots
online_hotels <- filter(hotel_reservations,
                        (hotel =="City Hotel" &
                           hotel_reservations$market_segment == "Online TA"))
view(online_hotels)

online_hotels_v2 <- hotel_reservations %>% 
  filter(hotel == "City Hotel") %>% 
  filter(market_segment =="Online TA")

view(online_hotels_v2)

# Create a two part plot
ggplot(data = online_hotels_v2) +
  geom_point(mapping = aes(x = lead_time, y = children))
  
####################################################################################################################################################################################################################################
#**********************************************************************************************************************************************************************************************************************************
####################################################################################################################################################################################################################################

# Facet_wrap() a plot with a title()
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  labs(title = "Hotels Review")

# min() function: earliest year
min(hotel_reversations$arrival_date_year)

# min() function: latest year
max(hotel_reservations$arrival_date_year)


# Create two variables with the min() and max()
mindate <- min(hotel_reservations$arrival_date_year)
maxdate <- max(hotel_reservations$arrival_date_year)

# Creating a plot with city bar chart with time-frame: Labs, title, Subtitle
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angel = 45)) +
  labs(title = "Market Segments comparison for hotel bookings")
       subtitle=paste0("Data from:", mindate, "to", maxdate)
      
       
       
# Creating a plot with city bar chart with time-frame: Labs, title, Subtitle
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angel = 45)) +
  labs(title = "Market Segments comparison for hotel bookings")
       caption=paste0("Data from:", mindate, "to", maxdate)
       
# Create bar chart with x-axis and y-axis
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angel = 45)) +
  labs(title = "Market Segments comparison for hotel bookings",
        caption=paste0("Data from:", mindate, "to", maxdate),
       x = "Market Segment",
       y = "Number of Bookings")
       
ggplot(data = hotel_reservations) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Market Segments comparison for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate),
       x="Market Segment",
       y="Number of Bookings")     


# Step to save your data and charts
ggsave("hotel_reservations_chart.png", width = 7,
         height = 7)
