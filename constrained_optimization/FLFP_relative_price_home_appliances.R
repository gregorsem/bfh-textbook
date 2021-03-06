#Graph Designer: Harriet Brookes-Gray + Scott Cohn
#Authors: Bowles and Halliday
#Title: Microeconomics: Competition, Conflict and Coordination

library(tidyverse)
library(digitize)
library(jpeg)
library(scales)
library(openxlsx)

#Using digitize to get data points 
# cal = ReadAndCal("constrained_optimization/FLFP.jpg")
# 
# data.points = DigitData(col = 'red')
# HAPI = Calibrate(data.points, cal, 1975, 1995, 0.8, 1.5 )
# 
# data.points1 = DigitData(col = 'red')
# MLFP = Calibrate(data.points1, cal, 1975, 1995, 0.8, 1.5 )
# 
# data.points2 = DigitData(col = 'red')
# FLFP = Calibrate(data.points2, cal, 1975, 1995, 0.8, 1.5 )
# 
# HAPI$group <- "HAPI"
# MLFP$group <- "MLFP"
# FLFP$group <- "FLFP"
# 
# data_final <- rbind(HAPI, MLFP, FLFP)
# data_final$group <- factor(data_final$group)
# 
# write.xlsx(data_final, 'FLFP_homeappliances.xlsx')
data_final_1 <- read.xlsx('constrained_optimization/FLFP_homeappliances.xlsx')


plot1 <- data_final_1 %>% ggplot(aes(x = x, y = y, group = group)) +
  geom_line(aes(linetype = group, color  = group), size = 1) + 
  xlab("Year") +
  ylab("Index Value (Base Year = 1975)") +
  scale_y_continuous(breaks = seq(0.8, 1.5, by = 0.1), limits = c(0.8,1.5)) + 
  scale_x_continuous(breaks = seq(1975, 1995, by = 5)) +
  theme_bw() + 
  theme(legend.position = "right", 
     legend.title = element_blank(), 
     axis.title.y = element_text(size = 14, vjust = 0.5),
     axis.title.x = element_text(size = 14, vjust = -1),
     legend.text = element_text(size = 11),
     axis.text.x = element_text(size = 12),
     axis.text.y = element_text(size = 12)
     ) 
  

print(plot1)

#Save plot to PDF
ggsave(plot1, filename = "FLFP_relative_price_home_appliances.pdf", 
       path = "constrained_optimization",
       width = 7, height = 7, units = "in")




