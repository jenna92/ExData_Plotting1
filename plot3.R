#generate plot3.png
names(subdata)

with(subdata, {
    plot(Sub_metering_1~DateTime, type="l",xlab="",ylab="Energy sub metering",col="black")
    lines(Sub_metering_2~DateTime,col="red")
    lines(Sub_metering_3~DateTime,col="blue")
})

?legend
legend("topright",col=c("black","red","blue"),lwd=1,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png",height=480,width=480)
dev.off()

