# Install palmerguins, palmerpenguins, and palmerpenguins packages

install.packages("palmerpenguins")
library('palmerpenguins')
library(ggplot2)

# View the files 
View(penguins)
View(penguins_raw)

# Plot with ggplot the penguins data

ggplot(data = penguins , aes(x = flipper_length_mm, y=body_mass_g)) + 
  geom_point(aes(color=species)) 

# Add shape
ggplot(data = penguins , aes(x = flipper_length_mm, y=body_mass_g)) + 
  geom_point(aes(shape=species)) +
  





data('ToothGrowth')
View(ToothGrowth)

install.packages('dplyr')
library(dplyr)

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
