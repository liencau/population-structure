pdf("./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.prunedData.11.Q.NJ_order.names.plot.maxvxv.xls.pdf",width=24,height=4);
aa<-read.table("./10chr.all_accessions.VQ50.877_lines.MAF_0.05.missing_value_0.5.prunedData.11.Q.NJ_order.names.plot.maxvxv.xls");

barplot(t(as.matrix(aa)),col=c(rgb(250,128,114,maxColorValue=255),rgb(173,255,47,maxColorValue=255),rgb(65,105,225,maxColorValue=255),rgb(85,26,139,maxColorValue=255),rgb(255,211,155,maxColorValue=255),rgb(255,255,0,maxColorValue=255),rgb(250,0,0,maxColorValue=255),rgb(205,79,57,maxColorValue=255),rgb(210,105,30,maxColorValue=255),rgb(46,139,87,maxColorValue=255),rgb(218,112,214,maxColorValue=255)),xlab="K=11",ylab="Ancestry Proportion",border=NA);dev.off();











