# Install palmerguins, palmerpenguins, and palmerpenguins packages

install.packages("palmerpenguins")
install.packages('dplyr')
library('palmerpenguins')
library(ggplot2)
library(Tmisc)
library(dplyr)

# View the files 
View(penguins)
View(penguins_raw)

# Add color
ggplot(data = penguins , aes(x = flipper_length_mm, y=body_mass_g)) + 
  geom_point(aes(color=species))

# Add shape
ggplot(data = penguins , aes(x = flipper_length_mm, y=body_mass_g)) + 
  geom_point(aes(shape=species)) 


# Add mapping + aes function
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y=body_mass_g, shape = species, color = species))

# Use Alpha 

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, alpha = species))

# Change the color outside the eas function

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g), color = "red")

# Add size 
ggplot(data = penguins) +
  geom_point(mapping =  aes(x = flipper_length_mm, y = body_mass_g, shape = species, color = species, size = species))


#######################################################################################################################################
######################################################################################################################################


data('ToothGrowth')
View(ToothGrowth)




# Apply the filter function 

filtered_tooth <- filter(ToothGrowth, dose == 0.5)
arrange(filtered_tooth, len)


# Nested function from the previous code.

arrange(filter(ToothGrowth, dose == 0.5), len)


# To use Mac keyboard shortcuts for inserting pipe operators 
# Pipe operator is %>% use in R programming to call out a pipe to express a sequence of multiple operations
# Mac: command+shift+m to get ( %>% ) 

pipe_tooth <- ToothGrowth %>% 
  filter(dose == 0.5) %>% 
  arrange(len)

# Summarize function 
pipe_tooths <- ToothGrowth %>% 
  filter(dose == 0.5) %>% 
  group_by(supp) %>% 
  summarize(mean_len = mean(len, na.rm = T), .group = "drop")

pipe_tooths

#######################################################################################################################################
######################################################################################################################################

# Load datasauRus package

install.packages("datasauRus")
library("datasauRus")

glimpse(datasauRus)
# Creating a chart and plot

ggplot(datasaurus_dozen, aes(x=x, y=y, colour=dataset)) + geom_point() + theme_void() + theme(legend.position = 'none') + facet_wrap(~dataset, ncol=3)

#######################################################################################################################################
######################################################################################################################################


# The bias function in R

install.packages("SimDesign")
library("SimDesign")

rand_temp <- c(65, 68, 70, 75, 72.5, 66.3)
predict_temp <- c(69, 67.2, 75.1, 77, 73.9, 68.4)

bias(rand_temp, predict_temp)


