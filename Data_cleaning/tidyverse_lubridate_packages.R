# Load and install tidyverse

install.packages("tidyverse")

library(tidyverse)

bars_df <- read_csv("flavors_of_cacao.csv")

# Step 2: Viewing data

# View data is done with the head() function
head(diamonds)

# Useful functions to summarize or preview the data
# str() and glimpse

str(diamonds)
glimpse(diamonds)

# colnames() function returns a list of column names from the datasets

colnames(diamonds)

###############################################################################

## Step3: Cleaning data

# Cleaning and organizing data can be done with rename() function

rename(diamonds, carat_new = carat)

rename(diamonds, carat_new = carat, cut_new = cut)

summarize(diamonds, mean_carat = mean(carat))


###############################################################################

## Step 4: Visualization data

# ggplot2 package can help with visualizations 

ggplot(diamonds, aes(x = carat, y = price)) + geom_point()

ggplot(diamonds, aes(x = carat, y = price, 
color = cut)) + 
  geom_point()

ggplot(diamonds, aes(x = carat, y = price, 
color = cut)) + 
  geom_point() +
  facet_wrap(~cut)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color, fill = cut)) +
  facet_wrap(clarity~cut)


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color, fill = cut)) +
  facet_wrap(~clarity)


###############################################################################

## Step 5: Documentation

# R markdown allows to put code and write in the same place 


###############################################################################

browseVignettes("tidyverse")

# Load and install lubricate
install.packages("lubridate")
library(lubridate)


# How to work with dates and times in R?
# Current date and time can run with the today() and now() functions.

today()

now()

# Matrix 2-dimensional using number-row
matrix(c(3:8), nrow = 2)


# Matrix 2-dimensional using number-col
matrix(c(3:8), ncol = 2)

# Calculations with operators
qrt_sales_1 <- 35658.95
qrt_sales_2 <- 53510.89
mid_yrs_sales <- qrt_sales_1 + qrt_sales_2
mid_yrs_sales

end_yrs_sales <- mid_yrs_sales * 2
end_yrs_sales

###############################################################################

install.packages("Tmisc")
library(Tmisc)
data(quartet)
view(quartet)

quartet %>%
  group_by(set) %>%
  summarize(mean(x), sd(x), mean(y), sd(y), cor(x, y))


ggplot(quartet, aes(x, y)) + geom_point() + geom_smooth(method = lm, se = FALSE) + facet_wrap(~set)

###############################################################################


install.packages("ggplot2")

# Load ggplot2
library(ggplot2)
library(palmerpenguins)

###############################################################################


data(penguins)
View(penguins)

ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  
  geom_point()
