require(shape, rootSolve)
# third plot:  monopsony, minwage and EITC
pdf(file = "employment/monopsony_minwage3.pdf", width = 15, height = 12)
par(mar =  c(5, 7, 3, 3))

#define functions
Delta <- function(n,v=0.05){
  1-v*n / (1-n)
}

ACL <- function(n, a = 1, tau = 0.5, v = 0.05, b = 2, s = 0) {
  a / ( tau * Delta(n,v) ) + b - s
}


MCL <- function(n,a=1,tau = 0.5 , v = 0.05, b = 2, s= 0) {
  d_Delta <- function(n,v= 0.05){
    -v/(1-n)^2
  }
  d_ACL <- function(n,a=1,tau = 0.5 , v = 0.05, b = 2, s= 0){
    - a*d_Delta(n,v) / (tau * Delta(n,v)^2)
  }
  ACL(n,a,tau,v,b,s) + n * d_ACL(n, a,tau, v, b, s)
}

MRP<-function(n){
  4/n
}
# solve the level of employment in different setting.
employment <- function(a=1,tau = 0.5 , v = 0.05, b = 2, s = 0, min = FALSE){
  ## return the employment level
  ## The four cases: 
  ## No EITC, no min wage:  employment()
  ## No EITC, min = 4.6: employment(min =  4.6)
  ## EITC, no min wage: employment(s=1)
  ## EITC, min = 4.6: employment(min = 4.6, s = 1)
  nmax <- 1/(1+v)-0.001
  if (min == FALSE){
    n <- uniroot(MRP_eq_MCL(n,a,tau,v,b,s),c(0.0001,nmax))$root
  } else{
    n1 <- uniroot(MRP_eq_min(n, min),c(0.0001,nmax))$root
    n2 <- uniroot(ACL_eq_min(n, a, tau, v, b, s, min),c(0.0001,nmax))$root
    n <- min(n1,n2)
  }
  return(n)
}

MRP_eq_MCL <- function(n,a=1,tau = 0.5 , v = 0.05, b = 2, s = 0){
  equation <- function(n){
    MRP(n) - MCL(n,a,tau,v, b, s)
  }
}
ACL_eq_min <- function(n, a = 1, tau = 0.5, v = 0.05, b = 2, s = 0, min = 4.6){
  equation<-function(n){
    ACL(n,a,tau,v,b,s)-min
  }
}
MRP_eq_min <- function(n,min=4.6){
  equation <- function(n){
    MRP(n) - min
  }
}
Min <- function(n, min = 4.6){
  min*n/n
}

#Set parameters for graphics
axislabelsize <- 1.8
labelsize <- 1.5
namesize <- 1.8
annotatesize <- 1.5
graphlinewidth <- 2
segmentlinewidth <- 1.5

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")
grays <- gray.colors(25, start = 1, end = 0)


ylims <- c(0, 14.1)
xlims <- c(0.25, 1.05)
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


axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1,cex.axis = labelsize)

#Draw the graphs
lines(xx1, ACL(xx1), col = COLA[3], lwd  = graphlinewidth)
lines(xx1, MCL(xx1), col = COLB[3], lwd = graphlinewidth)
lines(xx2, MRP(xx2), col = COL[3], lwd = graphlinewidth)
lines(xx2,Min(xx2), col = COL[2],lwd = graphlinewidth)
# with s=1
lines(xx1, ACL(xx1, s = 1), col = COLA[3], lwd = graphlinewidth, lty= 2)
lines(xx1, MCL(xx1, s = 1), col = COLB[3], lwd = graphlinewidth,lty = 2)

#Axis labels
mtext(expression(paste("Total labor used by the employer, ", italic(l) == e^N*h)), side = 1, line = 2.5, cex = axislabelsize)
text(-0.1, 0.5*ylims[2], expression(paste("Marginal cost of labor, ", c[italic(l)], ", marginal revenue product of labor, ", r[italic(l)])), xpd = TRUE, cex = axislabelsize, srt = 90) 


#add segments
segments(employment(), 0, employment(), MRP(employment()), lty = 2, col = grays[20], lwd = segmentlinewidth)
segments(employment(min = 4.6), 0, employment(min =  4.6), MCL(employment(min = 4.6)), lty = 2, col = grays[20], lwd = segmentlinewidth)
segments(employment(min = 4.6, s=1), 0, employment(min =  4.6, s=1), MRP(employment(min = 4.6, s= 1)), lty = 2, col = grays[20], lwd = segmentlinewidth)
segments(employment(s=1), 0, employment(s=1), MRP(employment(s= 1)), lty = 2, col = grays[20], lwd = segmentlinewidth)
## add points

points(employment(), ACL(employment()), pch = 16, col = "black", cex = 1)
points(employment(), MRP(employment()), pch = 16, col = "black", cex = 1)
points(employment(min=4.6), MCL(employment(min=4.6)), pch = 16, col = "black", cex = 1)
points(employment(min=4.6), Min(employment(min=4.6)), pch = 16, col = "black", cex = 1)
#with s=1
points(employment(s=1), ACL(s=1,employment(s=1)), pch = 16, col = "black", cex = 1)
points(employment(s=1), MRP(employment(s=1)), pch = 16, col = "black", cex = 1)
points(employment(min=4.6,s=1), MCL(s=1,employment(min=4.6,s=1)), pch = 16, col = "black", cex = 1)
points(employment(min=4.6,s=1), Min(employment(min=4.6,s=1)), pch = 16, col = "black", cex = 1)

# add labels
text(1.03, 13.8, "Average cost", cex = labelsize, xpd = TRUE)
text(1.03, 13.3, "of labor", cex = labelsize, xpd = TRUE)
text(1.03, 12.8, "(acl)", cex = labelsize, xpd = TRUE)

text(0.77, 13.8, "Marginal cost", cex = labelsize)
text(0.77, 13.3, "of labor", cex = labelsize)
text(0.77, 12.8, "(mcl)", cex = labelsize)

text(0.4, 13.8, "Marginal revenue", cex = labelsize)
text(0.4, 13.3, "product", cex = labelsize)
text(0.4, 12.8, "(mrp)", cex = labelsize)

text(employment()-0.01,ACL(employment())-0.3 , "b", cex = labelsize)
text(employment()-0.01,MCL(employment())+0.3 , "a", cex = labelsize)
text(employment(min = 4.6)-0.01,ACL(employment(min = 4.6))-0.3 , "c", cex = labelsize)
text(employment(min = 4.6)-0.01,MCL(employment(min =  4.6))+0.3 , "d", cex = labelsize)
text(employment(s=1)-0.01,ACL(s=1,employment(s=1))-0.3 , "f", cex = labelsize)
text(employment(s=1)-0.01,MCL(employment(s=1),s=1)+0.3 , "e", cex = labelsize)
text(employment(s=1, min = 4.6)-0.01,4.6-0.3 , "g", cex = labelsize)

dev.off()
