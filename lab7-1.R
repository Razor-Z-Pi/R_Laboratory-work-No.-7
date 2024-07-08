library(dplyr)
library(babynames)
library(stringr)
library(rebus)

print(babynames)

datas_for_lab <- select(babynames, year:n)

#1
Zad1 <- datas_for_lab %>% 
  filter(year >= 1920 & year <= 1950, sex == "F")

task1 <- Zad1 %>% 
  group_by(name) %>% 
  summarise(count = sum(n)) %>% 
  filter(count == max(count))

cat("Самое частое женское имя в период с 1920 по 1950 год =>", task1$name)

#2
Zad2 <- (datas_for_lab %>%
             filter(sex == "F"))$name
pattern <- "(\\w){1}"
task2 <- sort(unique(str_count(Zad2, pattern)))[1]

cat("Самое короткое в буквах женское имя => ", task2)


#3

male <- datas_for_lab %>%
  filter(sex == "M") %>%
  group_by(name) %>% 
  summarize(n = sum(n))

number <- sort(unique(str_count(male$name, pattern)), decreasing = T)[1]
names <- male$name[str_count(male$name, pattern) == number]

numbers <- NULL
for(i in 1:length(names)){
  numbers <- c(numbers, male$n[male$name == names[i]])
}

num_max <- max(numbers)
names <- male$name[male$n == num_max]
task3 <- names[str_count(names, pattern) == number]

cat("Самое длинное мужское имя => ", task3)


#4

all_names <- babynames$name

pattern <- "^[aeiouyAEIOUY][^aeiouyAEIOUY][aeiouyAEIOUY][^aeiouyAEIOUY][aeiouyAEIOUY]$"

matching_names <- all_names[str_detect(all_names, pattern)]

num_matching_names <- length(matching_names)
cat("Количество имен, соответствующих шаблону ГСГСГ =>", num_matching_names)
