## Healy Chapter 5


## Learn how to subset() within function, use reorder and annotate
library(pacman)
require(hrbrthemes)
p_load(tidyverse, here, rio, skmir, ggthemes, flextable, ggrepel, hrbrthemes)

my_packages <- c("tidyverse", "broom", "coefplot", "cowplot",
                 "gapminder", "GGally", "ggrepel", "ggridges", "gridExtra",
                 "here", "interplot", "margins", "maps", "mapproj",
                 "mapdata", "MASS", "quantreg", "rlang", "scales",
                 "survey", "srvyr", "viridis", "viridisLite", "devtools")

install.packages(my_packages, repos = "http://cran.rstudio.com")

devtools::install_github("kjhealy/socviz")

## 5.2 Continuous variables by group or category
organdata1 <- socviz::organdata

organdata1 %>% 
  head() %>% 
  flextable()

p <- ggplot(data = organdata1,
            mapping = aes(x = year, y = donors))
p + geom_line(aes(group = country)) + facet_wrap(~ country)

# We can use geom_boxplot() to get a picture of variation by year across countries. 
# Just as geom_bar() by default calculates a count of observations by the category you map to x,
# the stat_boxplot() function that works with geom_boxplot() will calculate a number of statistics 
# that allow the box and whiskers to be drawn. Corrd flip for clarity

p <- ggplot(data = organdata1,
            mapping = aes(x = country, y = donors))
p + geom_boxplot() + coord_flip()

##  Reorder for organization

p <- ggplot(data = organdata1,
            mapping = aes(x = reorder(country, donors, na.rm=TRUE),
                          y = donors))
p + geom_boxplot() +
  labs(x=NULL) +
  coord_flip()
## Fill by World Economic orientation
p <- ggplot(data = organdata1,
            mapping = aes(x = reorder(country, donors, na.rm=TRUE),
                          y = donors, fill = world))
p + geom_boxplot() + labs(x=NULL) +
  coord_flip() + theme(legend.position = "top")


## using summarize_if
 by_country <- organdata1 %>% 
  group_by(consent_law, country) %>%
  summarize_if(is.numeric, funs(mean, sd), na.rm = TRUE) %>% 
   ungroup()
by_country

p <- ggplot(data = by_country,
            mapping = aes(x = donors_mean, y = reorder(country, donors_mean),
                          color = consent_law))
p + geom_point(size=3) +
  labs(x = "Donor Procurement Rate",
       y = "", color = "Consent Law") +
  theme(legend.position="top")

## Plotting OCeficient and range
p <- ggplot(data = by_country, mapping = aes(x = reorder(country,
                                                         donors_mean), y = donors_mean))
## Calculating range and plotting 
p + geom_pointrange(mapping = aes(ymin = donors_mean - donors_sd,
                                  ymax = donors_mean + donors_sd)) +
  labs(x= "", y= "Donor Procurement Rate") + coord_flip()


## Geom_Repel

elections_historic <- socviz::elections_historic %>% select(2:7)
p_title <- "Presidential Elections: Popular & Electoral College Margins"
p_subtitle <- "1824-2016"
p_caption <- "Data for 2016 are provisional."
x_label <- "Winner's share of Popular Vote"
y_label <- "Winner's share of Electoral College Votes"

p <- ggplot(elections_historic, aes(x = popular_pct, y = ec_pct,
                                    label = winner_label))

## Didn't  run
p + geom_hline(yintercept = 0.5, size = 1.4, color = "gray80") +
  geom_vline(xintercept = 0.5, size = 1.4, color = "gray80") +
  geom_point() +
  geom_text_repel() +
  scale_x_continuous(labels = scales::percent) +
  scale_y_continuous(labels = scales::percent) +
  labs(x = x_label, y = y_label, title = p_title, subtitle = p_subtitle,
       caption = p_caption)


p <- ggplot(data = by_country,
            mapping = aes(x = gdp_mean, y = health_mean))

p + geom_point() +
  ## How to label outliers
  geom_text_repel(data = subset(by_country, gdp_mean > 25000),
                  mapping = aes(label = country))



## Label specific areas in the plot
p <- ggplot(data = organdata1,
            mapping = aes(x = roads, y = donors))
p + geom_point() +
  annotate(geom = "rect", xmin = 125, xmax = 155,
           ymin = 30, ymax = 35, fill = "red", alpha = 0.2) + 
  annotate(geom = "text", x = 157, y = 33,
           label = "A surprisingly high \n recovery rate.", hjust = 0)


## Labeling Axis = scale.mapping.variabletype

p <- ggplot(data = organdata1,
            mapping = aes(x = roads,
                          y = donors,
                          color = world))
p + geom_point() +
  scale_x_log10() +
  scale_y_continuous(breaks = c(5, 15, 25),
                     labels = c("Five", "Fifteen", "Twenty Five")) +
  
##  Labeling color
  
  p <- ggplot(data = organdata1,
              mapping = aes(x = roads,
                            y = donors,
                            color = world))
p + geom_point() +
  #color mapping
  scale_color_discrete(labels =
                         c("Corporatist", "Liberal",
                           "Social Democratic", "Unclassified")) +
  labs(x = "Road Deaths",
       y = "Donor Procurement",
       color = "Welfare State") +
  theme_ipsum()


