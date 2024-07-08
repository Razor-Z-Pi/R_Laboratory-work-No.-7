library("httr")
library("stringr")
library("ggplot2")

response <- GET("http://0861.ru/lab-07.txt")
text <- content(response, "text", encoding = 'UTF-8')

text <- str_replace_all(text, "\\[.*?\\]", "")
text <- gsub("TABLEAU.*", "TABLEAU", text)  # Удаление текста информации в конце
text <- gsub(".*FIRST ACT","FIRST ACT",text) # Удаление в начале

# [ Разбивка актов ]
# Определяем названия актов
act_titles <- c("FIRST ACT", "SECOND ACT", "THIRD ACT")
acts <- list()
for (i in 1:length(act_titles)) {
  # Определяем начало и конец текущего акта
  start <- regexpr(paste0("\\b", act_titles[i], "\\b"), text)
  if (start == -1) {
    next
  }
  end <- ifelse(i < length(act_titles), 
                regexpr(paste0("\\b", act_titles[i+1], "\\b"), text), 
                nchar(text))
  
  # Извлекаем текст текущего акта
  acts[[i]] <- substr(text, start, end)
}


# [ Разбивка текста по действующим лицам ]
pattern <- "\n([A-Z][a-z]*)(?:\\.|:)\\s(.*)"
# Извлечем все строки, удовлетворяющие шаблону
matches <- str_extract_all(text, pattern, simplify = FALSE)
matches

# [ Визуализация данных ]
# Функция извлекает список строк каждый из которых диалог для акта
act_dialogues <- lapply(acts, function(act_text) {
  str_extract_all(act_text, pattern, simplify = FALSE)
})

# [ Количество реплик по актам ]
# Возвращает вектор, содержащий количество строк диалогов для каждого акта
act_lines <- sapply(act_dialogues, function(dialogues) {
  sum(lengths(dialogues))
})

# [ Количество реплик во всем произведении ]
# unlist преобразует список act_dialogues в вектор, объеденяя все диалоги из всех актов в один вектор
total_lines <- sum(lengths(unlist(act_dialogues)))

# Датафрейм с количеством реплик по актам и итоговым количеством реплик
df <- data.frame(act = act_titles, lines = act_lines)
df <- rbind(df, data.frame(act = "Total", lines = total_lines))


ggplot(df, aes(x = act, y = lines, fill = act)) +
  geom_col() +
  labs(title = "Количество реплик по актам и итоговое количество реплик",
       x = "Акт",
       y = "Количество реплик") +
  theme_bw()


# Список имен
names <- c("Jack", "Algernon", "Gwendolen", "Cecily", "Chasuble", "Lane")
# Список для хранения количества слов в репликах после каждого имени
word_counts <- list()


for (name in names) {
  # Регулярное выражение для поиска реплик после имени
  pattern_1 <- paste0(name, "\\s*\\.\\s*([^\\.]*)\\.")
  # Извлекаем все реплики, удовлетворяющие шаблону
  matchesP <- str_extract_all(text, pattern_1, simplify = TRUE)
  # Для каждой реплики считаем количество слов после имени
  counts <- sapply(matchesP, function(x) {
    # Извлекаем реплику
    reply <- x[2]
    words <- strsplit(reply, " ")[[1]]
    # Возвращаем количество слов после имени
    length(words) - 1
  })
  # Добавляем список с количеством слов в репликах после имени в общий список
  word_counts[[name]] <- counts
}
for (name in names) {
  cat(name, ": ", length(word_counts[[name]]), "\n")
}