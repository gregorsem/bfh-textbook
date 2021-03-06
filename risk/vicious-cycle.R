#Graph Designer(s): Simon Halliday,Riley Boeth '17 & Weikai Chen
#Authors: Bowles, Foley and Halliday
#Title: Coordination, Conflict and Competition: A Text in Microeconomics

library(shape)
require(shape)
library(diagram)
require(diagram)
                                        # set the color
COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

                                        # define the text for both diagram
text1  <- c("Heightened \nRisk Aversion",
            "Limited Income",
            "Avoid Risky \nInvestments",
            "Lower Returns \non Investments"
            )
text2 <- c("Less Risk Aversion \nor Risk Neutrality",
           "Substantial Income",
           "Invest in Riskier \nInvestments",
           "Higher Returns \non Investments"
           )
                                        # define the plot function
circleplot <- function(text, file, width = 10, height = 8){
    pdf(file = file, width = width, height = height)
    par(mar = c(1, 1, 1, 1))
    openplotmat()
    textpos <- coordinates (c(1, 2,1))
    c <- c(1,3,4,2,1)
    for (i in 1:4){
        curvedarrow(textpos[c[i],],textpos[c[(i+1)],],
                    lwd = 2, curve = -0.2,
                    lcol = "blue",arr.col = "blue")
    }
    for (i in 1:4){
        textrect (textpos[i,], 0.14, 0.06,lab = text[i],
                  lcol = COLA[5],lwd = 2.5, cex = 1.5,
                  shadow.col = COLA[1], shadow.size = 0.012)
    }
    dev.off()    
}
circleplot(text1, "risk/vicious-cycle-1.pdf")
circleplot(text2, "risk/vicious-cycle-2.pdf")
