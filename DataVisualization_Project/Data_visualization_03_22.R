# Data Visualization with ggplot2() function 
# ggplot2 is a package that generate plots with function ggplot()
library(tidyverse)
library(palmerpenguins)
data("penguins")
library(here)
library(skimr)
library(janitor)
library(dplyr)
library(visdat)
library(ggplot2)
library(visdat)
vis_dat(penguins)

# Find the relationship between flitter lenght and body mass

ggplot(data = penguins) +
  geom_point(mapping = aes(x=flipper_length_mm, y=body_mass_g))

# + sign operator is used to add layers such as geom_point 
# Geom(R) is a geometric object used to represent your data
# Aesthetic using aes() is a visual property of an object in your plot
# x/y represent positions or characteristics such as size, shape, color...
# There are many different geoms in this ggplot2 
# geom_point() as scatter plots, dot plots...

# geom_line as trend lines, time series...

ggplot(data = penguins, mapping = aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point()

# alpha is adding transparency to the plot to avoid overplotting
# Add color for each species or all the points
ggplot(data = penguins, mapping = aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(alpha = 0.2, color = "green")

# We can even color corresponding to each species or value
ggplot(data = penguins, mapping = aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(alpha = 0.2, aes(color = species))


# geom_boxplot() as boxplots to visualize the distribution of body mass within each species

ggplot(data = penguins, mapping = aes(x=species, y=body_mass_g)) +
  geom_boxplot()

# Use jitter layer to have an idea of the measurements and of their distribution
ggplot(data = penguins, mapping = aes(x=species, y=body_mass_g)) +
  geom_boxplot()+
  geom_jitter(alpha = 0.4, color = 'tomato')


# geom_violin() as violin to observe the scale of the data
ggplot(data = penguins, mapping = aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_violin()

head(penguins)

countYear <- penguins %>%
  count(year, species)

countYear
# Plotting time series data/ Calculate number of counts per year for each species
ggplot(data = countYear, aes(x=year, y=n)) +
  geom_line()

# You can include group of species to draw separate lines
ggplot(data = countYear, aes(x=year, y=n, group = species)) +
  geom_line()

# The plot can have colors for each species to distinguish the data
ggplot(data = countYear, aes(x=year, y=n, color = species)) +
  geom_line()

# Faceting lets you split one plot into multiple plots
ggplot(data = countYear, aes(x=year, y=n))+
  geom_line()+
  facet_wrap(facets = vars(species))

year_sex <- penguins %>%
  count(year, species, sex)


# Faceting lets you split one plot into multiple plots
ggplot(data = year_sex, mapping = aes(x=year, y=n, color = sex)) +
  geom_line()+
  facet_wrap(facets = vars(species))

# Organize the panels only with grid only by rows 
ggplot(data = year_sex, mapping = aes(x=year, y=n, color = sex)) +
  geom_line()+
  facet_grid(rows = vars(sex), cols = vars(species))


# Organize the panels only with grid only by columns
ggplot(data = year_sex, mapping = aes(x=year, y=n, color = sex)) +
  geom_line()+
  facet_grid(cols = vars(species))

# You can generate theme_bw() function to change the overall appearance of the graph with white background
ggplot(data = year_sex, mapping = aes(x=year, y=n, color = sex)) +
  geom_line()+
  facet_grid(vars(species)) +
  theme_bw()


# You can generate theme_bw() function to change the overall appearance of the graph with dark background
ggplot(data = year_sex, mapping = aes(x=year, y=n, color = sex)) +
  geom_point()+
  facet_grid(vars(species)) +
  theme_dark()

# You can generate theme_void() function to change to a completly empty background
ggplot(data = year_sex, mapping = aes(x=year, y=n, color = sex)) +
  geom_point()+
  facet_grid(vars(species)) +
  theme_void()

# For more details about theme function check this link below
# https://ggplot2.tidyverse.org/reference/ggtheme.html

# Customization by changing the axes' names
ggplot(data = year_sex, mapping = aes(x=year, y=n, color = sex)) +
  geom_line()+
  facet_wrap(vars(species)) +
  labs(title = 'Observed The Graph For Each Species',
       x='StartYear - EndYear ', y ='Number of Penguins')+
  theme_bw()

# Sources https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html





