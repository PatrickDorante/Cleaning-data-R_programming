# Ans_combe quartet

library("dplyr")
library("tidyverse")
install.packages("Tmisc")
install.packages("tidyverse")
library("Tmisc")

# View data quartet with 

data(quartet)
View(quartet)

# Input summarize function 

quartet

quartet %>% 
  group_by(set) %>% 
  summarize(mean(x), sd(x), mean(y), sd(y), cor(x, y))


# Plot quartet data with a ggplot()

ggplot(quartet, aes(x, y)) + geom_point() + geom_smooth(method=lm, se=FALSE) + facet_wrap(~set)



library("datasauRus")

glimpse(datasaurus_dozen)
# Creating a chart and plot

ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset)) + geom_point() + theme_void() + theme(legend.position = "none") + facet_wrap(~dataset, ncol=3)



##############################################################################################################################################################################################
##############################################################################################################################################################################################

# R Hands-on Activities: Lesson 3: R Sandbox Activity

# Viewing diamonds data
view(diamonds)

# Head function uses to Summarize or preview the data
head(diamonds)

# glimpse() and str() both return summaries of each column in your datasets arranged horizontally
glimpse(diamonds)
str(diamonds)

# Colnames function return a list of column names from your dataset.
colnames(diamonds)

# Most cleaning data have to perform with rename()

rename(diamonds, carat_shiny = carat)


# Summarize() can be generated a wide range of summary statistics of data

summarize(diamonds, mean_4_carat = mean(carat))


# Visualizing data with ggplot2 package

ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point()

# Viz data for color

ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) + 
  geom_point()

# facet_wrap() function create a different plot and display smaller groups, or subsets of your data


?facet_wrap

ggplot(data = diamonds, aes(x = carat, y = price, color = cut)) +
  geom_point() + 
  facet_wrap(~cut)
