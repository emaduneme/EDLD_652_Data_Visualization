
my_packages <- c("tidyverse", "broom", "coefplot", "cowplot",
                 "gapminder", "GGally", "ggrepel", "ggridges", "gridExtra",
                 "here", "interplot", "margins", "maps", "mapproj",
                 "mapdata", "MASS", "quantreg", "rlang", "scales",
                 "survey", "srvyr", "viridis", "viridisLite", "devtools")

install.packages(my_packages, repos = "http://cran.rstudio.com")


library(pacman)

p_load("tidyverse", "broom", "coefplot", "cowplot",
       "gapminder", "GGally", "ggrepel", "ggridges", "gridExtra",
       "here", "interplot", "margins", "maps", "mapproj",
       "mapdata", "MASS", "quantreg", "rlang", "scales",
       "survey", "srvyr", "viridis", "viridisLite", "devtools")
p_load(dplyr)


?midwest

p <- ggplot(data = midwest,
            mapping = aes(x = area))
p + geom_histogram(bins = 10)

oh_wi <- c("OH", "WI")
p <- ggplot(data = subset(midwest, subset = state %in% oh_wi),
            mapping = aes(x = percollege, fill = state))
p + geom_histogram(alpha = 0.4, bins = 20)

p <- ggplot(data = subset(midwest, subset = state %in% c("OH", "WI")),
            mapping = aes(x = percollege, fill = state))
p + geom_histogram(alpha = 0.4, bins = 20)


p <- ggplot(data = midwest,
            mapping = aes(x = area))
p + geom_density()

p <- ggplot(data = midwest,
            mapping = aes(x = area, fill = state, color = state))
p + geom_density(alpha = 0.3) +
  theme_classic()
view(midwest)








