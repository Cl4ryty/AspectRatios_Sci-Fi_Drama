# genre: 0 = Sci-Fi, 1 = Comedy
# aspect_one: width
# aspect_two: height


library(tidyverse)
library(dplyr)

IMDb_data <- as_tibble(read.csv("raw/IMDbData.csv"))
print(IMDb_data)

IMDb_data <- IMDb_data %>% mutate(aspect_one = aspect_one/aspect_two, aspect_two = 1) %>% print

mean_comedy <- IMDb_data %>% filter(genre == 1) %>% pull(aspect_one) %>% mean() %>% print
median_comedy <- IMDb_data %>% filter(genre == 1) %>% pull(aspect_one) %>% median() %>% print

mean_scifi <- IMDb_data %>% filter(genre == 0) %>% pull(aspect_one) %>% mean() %>% print
median_scifi <- IMDb_data %>% filter(genre == 0) %>% pull(aspect_one) %>% median() %>% print

means <- tibble(mean = c(mean_scifi, mean_comedy), genre = c(0, 1))
medians <- tibble(median = c(median_scifi, median_comedy), genre = c(0, 1))


ggplot(data = IMDb_data)+
  geom_point(aes(x=genre, y = aspect_one), alpha = 0.1)+
  geom_point(data = means, aes(x=genre, y=mean), color = "blue")+
  geom_point(data = medians, aes(x=genre, y=median, color= genre), color = "red")


