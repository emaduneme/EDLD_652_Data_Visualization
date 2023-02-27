#  Missing    Not at all Just a little      Somewhat         A lot       Refused 
#     -1             0             1             2             3             8 
# Don’t know 

#3 Don't know = 

df <- data.frame(col1 = c(1,2,3,4), col2 = c(5,6,7,8), col3 = c(9,10,11,12))

# recode values using across()
df_recoded <- df %>%
  mutate(across(everything(), ~ ifelse(.x > 5, .x + 10, .x))) %>%
  as_tibble()


selected_afrob %>% 
  select(Q41A:Q41N_NIG) %>% 
  mutate_all(~ ifelse(.x < 4, .x + 1, .x - 4 + 5))

