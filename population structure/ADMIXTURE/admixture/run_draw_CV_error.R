## this script was used to draw CV error
pdf("./CV_error.sorted.pdf",height=5,width=10);

aa<-read.table("./CV_error.sorted.xls",header=T);

plot(aa[,1],aa[,2],type="l",lwd=2,xlab="K",ylab="Cross validation error",xlim=c(2,15),cex.lab=1.3,cex.axis=1.2);
points(aa[,1],aa[,2],pch=16,col="royalblue");
abline(v=12,h=0.69535,lty="dashed",lwd=2);
dev.off();

#########   draw the number of assigned accessions
pdf("./Number_of_assigned_accessions.pdf",height=5,width=10);

aa<-read.table("./Number_of_assigned_accessions.xls",header=T);

plot(aa[,1],aa[,2],type="l",lwd=2,xlab="K",ylab="Number of assigned lines",xlim=c(2,15),cex.lab=1.3,cex.axis=1.2);
points(aa[,1],aa[,2],pch=16,col="royalblue");
abline(v=12,h=256,lty="dashed",lwd=2);
dev.off();
