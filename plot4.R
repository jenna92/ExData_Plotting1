#generate plot4.png

par(mfrow = c(2,2))

with(subdata,
     plot(Global_active_power~DateTime, type="l", ylab="Global Active Power ",xlab=""))
with(subdata,
     plot(Voltage~DateTime, type="l", ylab="Voltage",xlab="datetime"))

with(subdata, {
    plot(Sub_metering_1~DateTime, type="l",xlab="",ylab="Energy sub metering",col="black")
    lines(Sub_metering_2~DateTime,col="red")
    lines(Sub_metering_3~DateTime,col="blue")
})
legend("topright",col=c("black","red","blue"),lwd=1,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),bty = "n")
with(subdata,
     plot(Global_reactive_power~DateTime, type="l",xlab="datetime"))
dev.copy(png,"plot4.png",height=480,width=480)
dev.off()
