# R_Laboratory-work-No.-7 / Лабораторная работа №7
Working with string data using stringr and rebus packages. / Работа со строковыми данными с помощью пакетов stringr и rebus.
__

Цель работы: научиться работать со строковыми данными с использованием пакетов stringr и rebus. / Purpose of work: to learn how to work with string data using stringr and rebus packages.
__

# Теоретические сведения / Theoretical information

# Некоторые сведения о пакете `babynames` / Some information about the `babynames` package

`babynames` представляет собой пакет, содержащий сведения об именах детей рожденных в США в период с 1880 по 2017 гг. В рамках выполнения лабораторной работы необходимо работать с набором данных `babynames` аналогичного пакета.
В наборе содержатся сведения об именах (name), поле (sex), годе (year), количестве детей (n) и частоте встречаемости имени (`prop`). Данные хранятся в виде `tibble` датафрейма. 

`babynames` is a package containing information on the names of children born in the United States between 1880 and 2017. As part of the lab work, you need to work with the `babynames` dataset of a similar package.
The set contains information about names (name), sex (sex), year (year), number of children (n), and name frequency (`prop`). The data is stored as a `tibble` dataframe.
__

# Практическая часть / Practical part

Задание 1 – С помощью пакетов stringr и rebus, используя набор данных babynames пакета babynames реализуйте код, дающий ответы на вопросы, согласно варианту. При решении задач также может быть полезен пакет dplyr. 
Вариант – 0

Какое самое частое женское имя в период с 1920 по 1950 год?

Сколько букв имеет самое короткое женское имя?

Какое самое длинное мужское имя? (если таких имен несколько программа должна выводить наиболее часто встречающееся имя)

Сколько имен соответствуют шаблону: ГСГСГ? (где Г – гласная буква, С – согласная)

/

Task 1 - Using the stringr and rebus packages, using the babynames dataset of the babynames package, implement the code that answers the questions according to the variant. The dplyr package may also be useful in solving the problems. 
Variant - 0

What was the most frequent female name between 1920 and 1950?

How many letters does the shortest female name have?

What is the longest male name? (if there is more than one such name, the programme should output the most frequent name)

How many names match the pattern: GSGSGSG? (where G is a vowel letter, C is a consonant letter).

__

Задание 2 – Используя пакет rebus постройте шаблон, находящий совпадения в тексте по заданному варианту. Вариант определяется остатком от деления числа вашего логина на 3

Вариант – 0

Поиск e-mail адреса

/

Task 2 - Using the rebus package, build a template that finds matches in text for a given variant. The variant is determined by the remainder of dividing the number of your login by 3

Variant - 0

Finding an e-mail address.

__

Задание 3 – Используя исходный текст, с помощью пакетов работы с текстом, сделайте обработку текста:

Удалите информацию, добавленную издательством;
Удалите пустые строки из текста;
Разбейте текст на акты;
Выполните разбивку текста по действующим в произведении лицам;
Визуализируйте количество реплик действующих лиц по актам и итоговое по произведению;
Определите действующих лиц, использующих наибольшее и наименьше количество слов в своих речах (необходимо исключать информацию, описывающую поведение героя, например: Jack. Good morning! [Algernon, from the other room, strikes up the Wedding March. Jack looks perfectly furious, and goes to the door.] For goodness’ sake don’t play that ghastly tune, Algy. How idiotic you are!)

/

Task 3 - Using the source text, using word processing packages, do some word processing:

Remove information added by the publisher;
Remove blank lines from the text;
Break the text into acts;
Do a breakdown of the text by the actors in the work;
Visualise the number of actors' lines by act and the total number of lines by work;
Identify the actors who use the most and least words in their speeches (information describing the character's behaviour should be excluded, e.g.: Jack. Good morning! [Algernon, from the other room, strikes up the Wedding March. Jack looks perfectly furious, and goes to the door.] For goodness' sake don't play that ghastly tune, Algy. How idiotic you are!)