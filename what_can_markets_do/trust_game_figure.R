#Graph Designer: Harriet Brookes-Gray
#Authors: Bowles and Halliday
#Title: Microeconomics: Competition, Conflict and Coordination

library(tidyverse)
library(digitize)
library(jpeg)
library(scales)
library(openxlsx)

trust_game_data <- read.xlsx("what_can_markets_do/Fig4.1_trust_game_data.xlsx")

colnames(trust_game_data)[1] <- "transfer of investor"
colnames(trust_game_data)[2] <- "incentive condition - fine imposed"
colnames(trust_game_data)[3] <- "trust condition - no fine possible"
colnames(trust_game_data)[4] <- "incentive condition - fine possible but not imposed"

trust_game_data_long <- trust_game_data %>%
  gather("Stat", "Value", -`transfer of investor`)


trust_game_data_long$`transfer of investor` <- factor(trust_game_data_long$`transfer of investor`)

trust_game_plot <- 
  ggplot(trust_game_data_long, aes(x = `transfer of investor`, y = Value, fill = Stat, group = desc(-Value))) + 
  geom_col(position = "dodge", alpha = 0.9, width = 0.95) + 
  xlab("Transfer by the investor") +
  ylab(element_blank()) + 
  scale_y_continuous(breaks = seq(0, 14, by = 2), limits = c(0, 14)) + 
  labs(fill = "Treatment") +
  scale_fill_manual(values=c("#E41A1C", "#377EB8", "#4DAF4A"),labels = c("Incentive condition - fine imposed", "Incentive condition - fine possible 
but not imposed", "Trust condition - no fine possible")) +
  theme_bw() + 
  theme(panel.grid.minor = element_blank(),
        axis.title.x = element_text(size = 20),
        axis.text = element_text(size = 17),
        legend.title = element_text(size = 17),
        legend.text = element_text(size = 15))
  
ggsave("what_can_markets_do/trust_game_figure.pdf", width = 9, height = 7, units = "in")

trust_game_plot1 <- 
  ggplot(trust_game_data_long, aes(x = `transfer of investor`, y = Value, fill = Stat, group = Value)) + 
  geom_col(position = "dodge", alpha = 0.9) + 
  xlab("Transfer by the investor") +
  ylab(element_blank()) + 
  scale_y_continuous(breaks = seq(0, 16, by = 2), limits = c(0,16)) + 
  theme_bw() + 
  labs(fill = "Treatment") +
  scale_fill_manual(values=c("#E41A1C", "#377EB8", "#4DAF4A"),labels = c("Incentive condition - fine imposed", "Incentive condition - fine possible 
but not imposed", "Trust condition - no fine possible"))

print(trust_game_plot1)
