## R4DS Chpter 14 
p_load(tidyverse)

x <- "\u00b5"  ## WRITING MU 


## Checking length of String
str_length(c("a", "R for data science", NA))
 


## Combine strings
str_c("x", "y")

str_c("x", "y", "z")


# Use the sep argument to control how they’re separated:
str_c("x", "y", sep = ",") 


# If you want missing values to print as "NA", use str_replace_na():

x <- c("abc", NA)
str_c("|-", x, "-|")
str_c("|-", str_replace_na(x), "-|")

## To collapse a vector of strings into a single string, use collapse:
  
  str_c(c("x", "y", "z"), collapse = ", ")

#You can extract parts of a string using str_sub()
x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 4)

# negative numbers count backwards from end
str_sub(x, -4, -1)



## Matching
#match any word with str_view(x, "ap")
x <- c("apple", "banana", "pear")
str_view(x, "ap")

## match any word sorrounding "a"
str_view(x, ".a.")

# TO search for strings
# ^ to match the start of the string.
# $ to match the end of the string.
x <- c("apple", "banana", "pear")
str_view(x, "^a")
str_view(x, "a$")

# Repetitions

x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
str_view(x, "CC?")
str_view(x, "CC+")
str_view(x, 'C[LX]+')


# Specify how many number
str_view(x, "C{2}")
str_view(x, "C{3}")
str_view(x, "X{3}")


## Detect matches
x <- c("apple", "banana", "pear")
str_detect(x, "e")

## You can calculate stats using detect function
sum(str_detect(words, "^t"))
sum(str_detect(words, "r$"))
!str_detect(words, "r$")


# Find all words containing at least one vowel, and negate
no_vowels_1 <- !str_detect(words, "[aeiou]")

# Find all words consisting only of consonants (non-vowels)
no_vowels_2 <- str_detect(words, "^[^aeiou]+$")
identical(no_vowels_1, no_vowels_2)

x <- c("apple", "banana", "pear")
str_count(x, "a")

mean(str_count(words, "[aeiou]"))

## It’s natural to use str_count() with mutate():

words

## sentences

# Extract
colours <- c("red", "orange", "yellow", "green", "blue", "purple")
colour_match <- str_c(colours, collapse = ", ")
colour_match

## Replacing strings
x <- c("1 house", "2 cars", "3 people")
str_replace_all(x, c("1" = "one", "2" = "two", "3" = "three"))

## Split Sentences
sentences %>%
  head(5) %>% 
  str_split(" ")
