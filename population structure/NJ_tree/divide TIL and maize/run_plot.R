
pdf("./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.mdist.list.pdf");

aa<-read.table("./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.mdist.list.teosinte",header=F);
bb<-read.table("./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.mdist.list.teosinte_maize",header=F);
cc<-read.table("./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.mdist.list.maize",header=F);

plot(density(aa[,3]),xlim=c(0,0.5),lwd=2,type="l",col="green3",xlab="IBS distance",cex.lab=1.2,ylim=c(0,35));
points(density(bb[,3]),type="l",lwd=2,col="purple")
points(density(cc[,3]),type="l",lwd=2,col="red3");

dev.off();
