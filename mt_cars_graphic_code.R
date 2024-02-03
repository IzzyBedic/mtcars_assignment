# Libraries
library(dplyr)
library(stringr)
library(ggplot2)

# Making sure all data is in a column
mt_cars_all_columns <- mtcars %>% 
  tibble::rownames_to_column("model") %>% 
  tibble()

  
# Creating a variable that contains only the Mercedes cars
mt_car_mercedes <- mt_cars_all_columns %>% 
  mutate(model = str_to_lower(model, locale = "en")) %>% 
  filter(str_detect(model, as.character("merc(.*)")))
                  

# Creating a graphic
mt_car_mercedes %>% 
  mutate(vs = as.factor(vs)) %>%
  ggplot() +
  geom_boxplot(aes(vs, wt)) +
  labs(title = "Differences in Weights Between V-Shaped and Straight Engines of Mercedes",
       x = "Type of Engine",
       y = "Weight (1000 lbs)") +
  scale_x_discrete(labels = c("V-Shaped", "Straight")) +
  theme_grey()