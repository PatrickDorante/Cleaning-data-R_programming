# Cleaning data

# 'Here package' makes referencing files easier
install.packages("here")

# load file with library

library("here")


# Skimr package makes summarizing data easy and let's you skim quickly

install.packages("skimr")

# Load skimr 

library("skimr")


# Janitor package has functions for cleaning data

install.packages("janitor")
# Load Janintor
library("janitor")

install.packages("tidyverse")
library("tidyverse")


# dplyr package 

install.packages("dplyr")
library("dplyr")

# You can write read_csv to grab a file or read a file with function read_csv()

install.packages("palmerpenguins")
library("palmerpenguins")

########################################################################################

# The skim_without_charts() and glimpse functions both return a summary of the data frame

skim_without_charts(penguins)

head(penguins) 

glimpse(penguins)

# to have no species column
penguins %>%
  select(-species)

# To have only the species column
penguins %>%
  select(species)


# to rename a column name

penguins %>%
  rename(island_new = island)


# the rename_with() FUNCTION uses to reformat column names to be upper or lower

rename_with(penguins, toupper)

clean_names(penguins)

########################################################################################

# This arrange function sorts data to ASC order

penguins %>% 
  arrange(bill_length_mm)

# This arrange function sorts data to DESC order

penguins %>% 
  arrange(-bill_length_mm)

# to SAVE as data frame

penguins2 <- penguins %>% 
  arrange(-bill_length_mm)
view(penguins2)

########################################################################################

# Grouping by columns 

penguins %>%
  group_by(island) %>%
  drop_na() %>%
  summarize(max_bill_length_mm = bill_length_mm)

# Grouping by columns to find the mean:

penguins %>% group_by(island) %>%
  drop_na() %>%
  summarize(mean_bill_length_mm = mean( bill_length_mm))

# Grouping by columns to find the max

penguins %>%
  group_by(island) %>%
  drop_na() %>%
  summarize(max_bill_length_mm = max(bill_length_mm))



penguins %>%
  group_by(species) %>%
  drop_na() %>%
  summarize(min_bill_depth_mm = min(bill_depth_mm))

########################################################################################

penguins %>%
  group_by(species, island) %>%
  drop_na() %>%
  summarize(max_bill = max(bill_length_mm), mean_bill = mean(bill_length_mm))

penguins %>% 
  filter(species == 'Adelie')

########################################################################################

install.packages("Tmisc")
library(Tmisc)
data(quartet)
view(quartet)

quartet %>%
  group_by(set) %>%
  summarize(mean(x), sd(x), mean(y), sd(y), cor(x, y))


ggplot(quartet, aes(x, y))
+ geom_point()
+ geom_smooth(method = lm, se = FALSE)
+ facet_wrap(~set)



##########################################################################################

install.packages("datasauRus")
library(datasauRus)


ggplot(datasaurus_dozen, aes(x = x, y = y, colour = dataset)) + geom_point() + theme_void() + theme(legend.position = none) + facet_wrap(~datasets,)

##########################################################################################


install.packages("SimDesign")
library("SimDesign")

temp_now <- c(68.33, 70, 72.4, 71, 67, 70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)

bias(temp_now, predicted_temp)


##########################################################################################


setwd('/Users/patrickdorante/Desktop')

bars_df <- read_csv("flavors_of_cacao.csv")

head(bars_df)

str(bars_df)


summarize(bars_df)

glimpse(bars_df)

View(bars_df)


ncol(bars_df)


colnames(bars_df)

 bars_df %>%
rename( Location = `Company\nLocation`)
 
 flavors_df <- bars_df %>%
   rename( Percentage = `Cocoa\nPercent`, Location = `Company\nLocation`, Bean_type = `Bean
Type`)
 

 
View(flavors_df)


?select()


trimmed_flavors_df <- flavors_df %>%
  select(Rating, Percentage, Location, Bean_type)

trimmed_flavors_df 

trimmed_flavors_df %>%
  summarize(min(Rating), sd(Rating))


trimmed_flavors_df %>%
  summarize(max(Rating), sd(Rating))

trimmed_flavors_df %>%
  summarize(mean(Rating), sd(Rating))

best_trimmed_flavors_df <- trimmed_flavors_df %>%
  filter(`Percentage` == '70%', Rating > '3.5')

best_trimmed_flavors_df
##########################################################################################

library(ggplot2)

ggplot(data = best_trimmed_flavors_df) +
  geom_bar (mapping =  aes(x = Rating, ... =))

ggplot(data = best_trimmed_flavors_df) +
  geom_bar(mapping = aes(x = Location, ...=))

ggplot(data = best_trimmed_flavors_df) + 
  geom_bar(mapping = aes(x = Location)) +
  facet_wrap(~`Percentage`)

ggplot(data = best_trimmed_flavors_df) + 
  geom_bar(mapping = aes(x = Location)) +
  facet_wrap(~`Rating`)


ggplot(data = best_trimmed_flavors_df) + 
  geom_bar(mapping = aes(x = Location)) +
  facet_wrap(~`Rating`) +
  labs(title = "Rating Best Chololates")




