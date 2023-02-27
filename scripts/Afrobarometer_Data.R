# Afrobarometer

library(pacman)
p_load(tidyverse, rio, here, readr, tidytext)

## What are the perceptions of Nigerians about Elections?
## How does that impact their trust in elections?
## What role does the media play in this dynamic?

afrobarometer_ngr <- import(here("data", "afrobarometer_release-data_nig_r8_en_2021-03-31.sav"),
       setclass = "tbl_df")

glimpse(afrobarometer_ngr)

selected_afrob <-  afrobarometer_ngr %>% 
  select(RESPNO, REGION, Q101:Q103, Q13:Q19B, Q55A:Q60, starts_with("Q41"))
# Data For Proposal
selected_afrob %>% 
  group_by(Q101) %>% 
  summarize(avr_soc_media_effect = mean(Q59F, na.rm = T)) %>% 
  ggplot(aes(as.factor(Q101), avr_soc_media_effect)) +
  geom_col()


selected_afrob %>% 
  mutate( Q41A = replace_at(Q41A, c("8","9"), c("4","5")))

## How to revalue 
library(tidyverse)
df <- df %>% 
  mutate(col = case_when(col == 8 ~ 4,
                         col == 9 ~ 5,
                         TRUE ~ col))




# Elections Q13-q19
# Media Q55-60
# Trust Q41 


