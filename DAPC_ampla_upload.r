library(adegenet)
library(ape)
rm(list=ls())


##Modify for your file structure
setwd("~/amplaPopulationGenetics/Data/")

data<-read.genepop(file="Leptoxis_ampla_SNPs.gen")



groups8<-find.clusters(data,max.n.clust=25)
####150, 8

dapc8<-dapc(data,groups8$grp)
##75,4

dapc8$posterior
pdf("DAPC.pdf")
scatter(dapc8,scree.da=TRUE,posi.da = "topleft", cell=0, cstar=0, clab=0,grp=data$pop)
dev.off()
scatter(dapc8, scree.da=FALSE, bg="white", pch=20, cell=0, cstar=0, solid=.4,cex=3,clab=0,leg=TRUE,text.leg=paste("Cluster",1:10))
