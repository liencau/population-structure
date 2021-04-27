

pdf("./877_lines.PC1_PC2.pdf");
aa<-read.table("./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.eigenvec.names",header=F);
plot(aa[,3],aa[,4],xlab="PC1 (3.7%)",ylab="PC2 (2.8%)",cex.lab=1.3,cex.axis=1.2,main="");
dev.off();

pdf("./877_lines.PC2_PC3.pdf");
aa<-read.table("./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.eigenvec.names",header=F);
plot(aa[,4],aa[,5],xlab="PC2 (2.8%)",ylab="PC3 (2.6%)",cex.lab=1.3,cex.axis=1.2,main="");
dev.off();
