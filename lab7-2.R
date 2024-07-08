library(rebus)
"@email\\."
pattern <- "\\s\\w+" %R%
  "@" %R%
  "\\w+" %R%
  DOT %R%
  "\\w+\\s"

result <- as.integer(grepl(pattern, "В одной из этих почт, что-то есть: test_email_228@example.com и alternativ_email@example.com."))
if (result == 0) {
  print("e-mail адрес не найден") 
} else {
  print("e-mail адрес найден")
}