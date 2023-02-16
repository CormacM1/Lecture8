


install.packages("tidyverse")
install.packages("skimr")
library(tidyverse)
library(skimr)



coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')



select(coronavirus, ends_with("y"))
select(coronavirus, country, everything())


filter(coronavirus, country == "US")

coronavirus %>% head(3)
head(coronavirus, 3)
#These two lines are the same

coronavirus.us <- coronavirus %>% filter(country == "US")
coronavirus.us2 <- coronavirus %>% select(-lat,-long, -province)


coronavirus %>% 
  filter(lat > 60, type == "confirmed") %>% 
  select(country) %>% 
  table()


coronavirus %>% 
  filter(lat > 60, type == "confirmed") %>% 
  ggplot() +
  geom_line(mapping = aes(x = date, y = cases, color = country))

vacc <- read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/main/csv/covid19_vaccine.csv")

skim(vacc)

vacc %>%
  filter(date == "2023-02-14") %>%
  select(country_region, continent_name, people_at_least_one_dose, population) %>%
  mutate(vaxrate = round(people_at_least_one_dose / population,2))

vacc %>% 
  filter(date == max(vacc$date)) %>% 
  select(country_region, continent_name, doses_admin, people_at_least_one_dose, population) %>% 
  mutate(doses_per_vaxxed = doses_admin / people_at_least_one_dose) 