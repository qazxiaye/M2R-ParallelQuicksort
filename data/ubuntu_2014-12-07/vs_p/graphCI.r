data0 <- read.table("../tlevle0/CI")
data1 <- read.table("../tlevle1/CI")
data2 <- read.table("../tlevle2/CI")
data3 <- read.table("../tlevle3/CI")
data4 <- read.table("../tlevle4/CI")
data5 <- read.table("../tlevle5/CI")

point <- 1:15

i <- 0
while (i < 5) {
    point[1+i] <- data[i*6+1,];
    point[6+i]  <- data[i*6+2,];
    point[11+i] <- data[i*6+3,];
    i <- i + 1
}


png(filename="./time_vs_p.png")

colors <- c("blue","red","green")
toDraw <- 0
i <- 0
while (i < 3) {
    a <<- i*5+1
    b <<- i*5+5
    df <- data.frame(x = 1:5,
                    F = point[a:b],
                    L = lower[a:b],
                    U = upper[a:b])
    
    if (toDraw != 0) {
        par(new = TRUE)
    }
    else {
        toDraw <- 1
    }

    plot(df$x, df$F, ylim = c(0,0.1), type = "l", main = "time vs n o2", col.main = "blue", 
            xlab = "size", ylab = "time", axes=FALSE)
    polygon(c(df$x,rev(df$x)),c(df$L,rev(df$U)),col = "grey75", border = FALSE)
    lines(df$x, df$F, col=colors[i+1], lwd = 2)

    i <- i + 1
}

g_range <- range(0,point,upper,lower)
legend(1, g_range[2], c("seq","para","libc"), cex=1.5,
   col=colors,lty = c(1, 1, 1));
axis(1, at=1:5, lab=c("10","100","1000","10e3","10e4"))
axis(2, las=1)

dev.off();

