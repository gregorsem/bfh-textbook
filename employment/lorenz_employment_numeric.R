#Graph Designer: Simon Halliday + Scott Cohn

library(shape)
library(pBrackets)
pdf(file = "employment/lorenz_employment_numeric.pdf", width = 8, height = 8)

#Set parameters for graphics
pointsize <- 1.8
axislabelsize <- 1.8
labelsize <- 1.5
namesize <- 1.8
annotatesize <- 1.5
graphlinewidth <- 2
segmentlinewidth <- 1.5


COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")
COLC <- c("#fcfbfd", "#efedf5", "#dadaeb", "#bcbddc", "#9e9ac8", "#807dba", "#6a51a3", "#54278f", "#3f007d")
grays <- gray.colors(25, start = 1, end = 0, alpha = 1)

#Edited the margins to cater for the larger LHS labels
par(mar =  c(8, 6, 6, 6))


#Add limits on axes and levels of utility for each indifference curve
ylims <- c(0, 1)
xlims <- c(0, 1)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n", 
     xaxs="i", 
     yaxs="i"
)

#Calculate the Gini
#Area B:
#((0.5*(0.25*0.5)) + 0.25*0.5 + 0.5*(0.75*0.5))
#Therefore Area A: 
#0.5 - Area B
#Therefore Gini: 
# (0.5 - ((0.5*(0.25*0.5)) + 0.25*0.5 + 0.5*(0.75*0.5)))/0.5 = 0.25

ticksy <- c(ylims[1], 0.6, ylims[2])
ylabels <- c(0, expression(paste(60)), 100)
ticksx <- c(xlims[1], 0.1, 0.9, xlims[2])
xlabels <- c(NA,  10, 90,  100)
ticksy2 <- c(0,1)

axis(1,at = ticksx,  pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2,at = ticksy,  pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)
axis(4,at = ticksy2,  pos = 1, labels = NA, las = 1, cex.axis = labelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(0, xlims[2], length.out = npts)
xx3 <- seq(xlims[1], 0, length.out = npts)
xx4 <- seq(-11, 0, length.out = npts)

#Axis labels and draw linear utility function
#mtext(expression(paste("Cumulative population proportion, ", F(n))), side = 1, line = 2.5, cex = axislabelsize)
text(-0.15, 0.5*ylims[2], expression(paste("Cumulative income, (%)")), xpd = TRUE, cex = axislabelsize, srt = 90) 
text(0.5*xlims[2], -0.25, expression(paste("Cumulative population, (%)")), xpd = TRUE, cex = axislabelsize) 



#Shaded Areas A and B
#Area A
xpoly1 <- c(0, 0.1, 0.9, 1, 0)
ypoly1 <- c(0, 0, 0.6, 1, 0)
polygon(x = xpoly1,
        y = ypoly1,
        col = COLB[1], density = NULL, border = NA)
#Area B
xpoly2 <- c(0, 0.1, 1, 1, 0.9, 0.1)
ypoly2 <- c(0, 0, 0, 1, 0.6, 0)
polygon(x = xpoly2,
        y = ypoly2,
        col = COLA[1], density = NULL, border = NA)

# Lorenz curve
segments(0, 0, 0.1, 0, lty = 1, col = COLA[5], lwd = graphlinewidth, xpd = TRUE)
segments(0.1, 0, 0.9, 0.6, lty = 1, col = COLA[5], lwd = graphlinewidth)
segments(0.9, 0.6, 1, 1, lty = 1, col = COLA[5], lwd = graphlinewidth)
text(0.83, 0.47, expression(paste("Lorenz")), cex = labelsize)
text(0.83, 0.43, expression(paste("curve")), cex = labelsize)

#Line of equality
segments(0, 0, 1, 1, lty = 1, col = COLB[5], lwd = graphlinewidth)
text(0.76, 0.9, expression(paste("Line of")), cex = labelsize)
text(0.76, 0.85, expression(paste("equality")), cex = labelsize)

segments(0.9, 0, 0.9, 0.6, lty = 2, col = grays[20], lwd = segmentlinewidth)
segments(0, 0.6, 1, 0.6, lty = 2, col = grays[20], lwd = segmentlinewidth)


#Label areas A and B
#text(0.6, 0.5, expression(paste(A)), cex = labelsize)

# text(0.6, 0.2, expression(paste(B[1])), cex = labelsize)
#text(0.6, 0.2, expression(paste(B[1])), cex = labelsize)
#text(0.95, 0.2, expression(paste(B[2])), cex = labelsize)
#text(0.95, 0.7, expression(paste(B[3])), cex = labelsize)


# text(0.9, 0.7, expression(paste(B[3])), cex = labelsize)

#Label and provide Gini value
#Bottom of frame
#segments(0.08, 0.75, 0.32, 0.75, lty = 1, col = "black" , lwd = 1)
#Top of frame
#segments(0.08, 0.85, 0.32, 0.85, lty = 1, col = "black" , lwd = 1)
#Left of frame
#segments(0.08, 0.75, 0.08, 0.85, lty = 1, col = "black" , lwd = 1)
#Right of frame
#segments(0.32, 0.75, 0.32, 0.85, lty = 1, col = "black" , lwd = 1)
#Gini equation
#text(0.2, 0.8, expression(paste(Gini == frac(A, A + B), phantom() == 0.36 )), cex = labelsize)


brackets(x1 = 0.095, y1 = -0.07, x2 = 0, y2 = -0.07,  
         ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, lty = 1, xpd = TRUE)
text(0.0495, -0.14, expression(paste("unemployed = 10")), xpd = TRUE, cex = labelsize)
text(0.0495, -0.18, expression(paste(u == 10)), xpd = TRUE, cex = labelsize)

brackets(x1 = 0.895, y1 = -0.07, x2 = 0.105, y2 = -0.07,  
         ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, lty = 1, xpd = TRUE)
text(0.5, -0.14, expression(paste("employed = 80")), xpd = TRUE, cex = labelsize)
text(0.5, -0.18, expression(paste(u + n == 90)), xpd = TRUE, cex = labelsize)

brackets(x1 = 1, y1 = -0.07, x2 = 0.905, y2 = -0.07,  
         ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, lty = 1, xpd = TRUE)
text(0.9495, -0.14, expression(paste("owners")), xpd = TRUE, cex = labelsize)
text(0.9495, -0.19, expression(paste(1 - (u + n) == 10)), xpd = TRUE, cex = labelsize)
 
# brackets(x1 = 1.01, y1 = 1, x2 = 1.01, y2 = 0.252,  
#          ticks = 0.5, curvature = 0.5, type = 1, 
#          col = "black", lwd = 2, lty = 1, xpd = TRUE)
# text(1.11, 0.625, expression(paste("Cumulative income")), xpd = TRUE, srt = 270)
# text(1.08, 0.625, expression(paste("of the rich")), xpd = TRUE, srt = 270)


dev.off()

