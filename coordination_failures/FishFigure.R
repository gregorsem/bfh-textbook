require(shape)
library(tidyverse)
library(lubridate)
library(openxlsx)
library(readxl)
library(digitize)

fish_data <- read_excel("coordination_failures/FishData.xlsx")

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824", "#f0027f")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081", "#9e9ac8","#f0027f")
COLC <- c("#fcfbfd", "#efedf5", "#dadaeb", "#bcbddc", "#9e9ac8", "#807dba", "#6a51a3", "#54278f", "#3f007d")
COLD <- c("#DA3030","#41ae76","#F7DE04", "#4eb3d3","#AE82FF","#386cb0","#F48318","#41ae76","#6a51a3", "#DA3030")

fish_data_2 <- fish_data %>%
  filter(Year >= 1950)
#this isa test

#-----------GGplot---------
Fish_plot <- ggplot(fish_data, aes(x = Year, y = Tonnes)) +
  geom_line(color = "#0868ac") +
  #geom_line(aes(linetype = Country)) + #if we differentiate the lines without color
  labs(y = "Landings (tons)", x = "Year", color = "") + 
  scale_y_continuous(breaks = seq(0, 800000, by = 100000), limits = c(0,800000)) +
  scale_x_continuous(breaks = seq(1850, 2010, by = 10)) +
  scale_color_brewer(palette = "Set1") +
  theme_bw() + 
  #coord_cartesian(xlim = c(1850, 2010), ylim = c(0, 600000), expand = FALSE) + 
theme(panel.grid.minor = element_blank(),
      axis.title.y = element_text(size = 17, vjust = 1),
      axis.text.x = element_text(size = 13, angle = 90),
      axis.text.y = element_text(size = 13),  
      axis.title.x = element_text(size = 17, vjust = -1), 
      plot.margin = margin(10, 20, 10, 0))
Fish_plot


#print(wealth_share_plot)

#Save plot to PDF
ggsave(Fish_plot, filename = "Fish_plot_CORE.pdf", 
       path = "coordination_failures",
       width = 9, height = 7, units = "in")



#-----------Digitize---------

# Using digitize to get data points 
#cal = ReadAndCal("Fish.jpg")
# 
# Tonnes of fish
#data.points = DigitData(col = 'red')
#tonnes = Calibrate(data.points, cal, 0, 60, 0, 600000 )

#tonnes$x <- c(1:37)
# 
#write.xlsx(tonnes, 'FishData2.xlsx')

data_fish <- read.xlsx('coordination_failures/FishData2.xlsx')

options(scipen=999)

Years <- c("1950", "1960", "1970", "1980", "1990", "2000", "2010")

Fish_plot2 <- ggplot(data_fish, aes(x = x, y = y)) +
  geom_line(color = "#0868ac") +
  labs(y = "Landings (tons)", x = "Year", color = "") + 
  scale_color_brewer(palette = "Set1") +
  coord_cartesian(xlim = c(0, 60), ylim = c(0, 600000), expand = FALSE) + 
  scale_x_continuous(labels = Years) + 
  theme_bw() +
theme(panel.grid.minor = element_blank(),
 axis.title.y = element_text(size = 17, vjust = 1),
 axis.text.x = element_text(size = 13),
 axis.text.y = element_text(size = 13),  
 axis.title.x = element_text(size = 17, vjust = -1),  
 plot.margin = margin(10, 20, 10, 0))
# 
Fish_plot2

#Save plot to PDF
ggsave(Fish_plot2, filename = "Fish_plot.pdf", 
       path = "coordination_failures",
       width = 9, height = 7, units = "in")


# dev.off()

