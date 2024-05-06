library(tidyverse)
library(ggplot2)


data = readRDS("../data/duomenys.rds")
#2.1 užduotis

pirmas = ggplot(data = data, aes(x = vidutinis_atlyginimas)) +
  geom_histogram(bins = 120, fill = "magenta", color = "pink", size = 0.7) +
  labs(title = "Vidutinis atlyginimas")

ggsave("../img/Grafikas_1.png", pirmas, width = 3000,
       height = 1500, units = ("px"))

# 2.2 užduotis (Top 5 imones pagal darbuotojus)

top5 = data %>%
  group_by(name)%>%
  summarise(salary = max(avgWage))%>%
  arrange(desc(salary))%>%
  head(5)

antras = data%>%
  filter(name%in% top5$name) %>%
  mutate(Months=ym(month)) %>%
  ggplot(aes(x = Months, y = avgWage, color = name)) + geom_line()+ theme_classic() +
  labs(title = "Top 5 įmonės pagal darbo užmokestį", x = "Mėnesiai", y  = "Vidutinis atlyginimas", color = "Įmonės pavadinimas")

ggsave("../img/Grafikas_2.png", antras, width = 3000, height = 1500, units = ("px"))

# 2.3 užduotis (Didžiausių įmonių apdraustų darbuotojųe skaičius)

TopInsured = data %>%
  filter(name %in% top5$name) %>%
  group_by(name)%>%
  summarise(Insured=max(numInsured))%>%
  arrange(desc(Insured))


TopInsured$name = factor(TopInsured$name, levels = TopInsured$name[order(TopInsured$Insured, decreasing = T)])


trecias = TopInsured%>%
  ggplot(aes(x = name, y = Insured, fill = name)) + geom_col() + theme_classic() +
  labs(title = "Top 5 įmonės pagal apdraustųjų skaičių", x = "Įmonė", y  = "Apdraustieji", fill = "Įmonės pavadinimas")

ggsave("../img/Grafikas_3.png", trecias, width = 5000, height = 2500, units = ("px"))