
install.packages("DataEditR")
library(devtools)
install_github("DillonHammill/DataEditR")
1


## Manipulate Data using a User friendly UI
library(DataEditR)

# Save output to R object & csv file
mtcars_new <- data_edit(mtcars,
                        save_as = "mtcars_new.csv")
## You can filter, select, edit names, create


p_load(fmsb)

# Create data: note in High school for Jonathan:
data <- as.data.frame(matrix( sample( 2:20 , 10 , replace=T) , ncol=10))
colnames(data) <- c("math" , "english" , "biology" , "music" , "R-coding", "data-viz" , "french" , "physic", "statistic", "sport" )

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each topic to show on the plot!
data <- rbind(rep(20,10) , rep(0,10) , data)
head(data)
radarchart( data  , axistype=1 , 
            
            #custom polygon
            pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
            
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8 
)



 p_load(sf, tmap, nigeria-maps, naijR) 


states <- selected_afrob %>% 
  select(REGION) %>% 
  characterize()
selected_afrob$REGION <- states
  
ss <- states()
numStates <- length(ss)
vv <- sample(LETTERS[1:5], numStates, TRUE)
Nigerian_states <- tibble(states = ss, letter = vv)

unique(Nigerian_states$states) 
 
 
 map_ng()

 vignette('nigeria-maps', 'naijR')
 
 
 esquisser()

 
 ## Remove scientific numbering
 options(scipen = 999)
 
 ## Sensitivity analysis
 p_load(sensemakr)
 
##  Determine effect_sizes for variables. 
 partial_f2() 
 
 
 ###  Fonts
 p_load(extrafont)
 
 
 ## Import fonts
 font_import()
 
 fonts()
  