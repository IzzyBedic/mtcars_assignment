# Libraries
library(dplyr)
library(stringr)

# Making sure all data is in a column
mt_cars_all_columns <- mtcars %>% 
  tibble::rownames_to_column("model") %>% 
  tibble()

  
# Creating a variable that contains only the Mercedes cars
mt_car_mercedes <- mt_cars_all_columns %>% 
  mutate(model = str_to_lower(model, locale = "en")) %>% 
  filter(str_detect(model, as.character("merc(.*)")))
                  