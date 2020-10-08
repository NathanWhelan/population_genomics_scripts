library(adegenet)
library(ape)
rm(list=ls())


##Modify for your file structure
setwd("~/PleuroceridaePopGen/Analyses/Leptoxis_compacta/stacks_demultiplexed/")

data<-read.genepop(file="Lcom_m5M3n2_pop_r75p3_allSNPs.gen")

find.clusters(data,max.n.clust=25)

groups2<-find.clusters(data,max.n.clust=25)
####200, 2
groups2
help(find.clusters)

dapc2<-dapc(data,groups2$grp)
15##75,4


pdf("Leptoxis_compacta_DAPC.pdf")
scatter(dapc2,scree.da=TRUE,posi.da = "topleft", cell=0, cstar=0, clab=0, col=c("#FF6600","#0099E5"))  #can use grp=data$pop to color by collection locality
#scatter(dapc2,scree.da=TRUE,posi.da = "topleft", cell=0, cstar=0, clab=0, grp=data$pop)
dev.off()

