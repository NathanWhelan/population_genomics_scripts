####Script for L. compacta project to look at IBD using Fst vs. geographical distance
library(vegan)
library(hierfstat)
library(ggplot2)
library(ecodist)
setwd("path/to/your/files/")


##Fstat file created in PGDspider from genepop file.
##Generate Pairwise Fst
data1<-read.fstat("Lcom_m5M3n2_r75p3_randomSNP.fstat.dat")
pairwise.WCfst(data1,diploid = TRUE)



####MANTEL TEST
Distances<-read.csv("compacta_distances.csv", header=FALSE)
distances<-as.matrix(Distances)
Distances2<-as.dist(Distances)
Distances2
FST_pairwise<-read.csv("Compacta_WeirCockerham_PairwiseFst.csv", header=FALSE)
FST_pairwise2<-as.dist(FST_pairwise)
FST_pairwise2

ibd<-mantel.randtest(FST_pairwise2,Distances2, nrepet = 1000)
plot(ibd)
ibd

###Multiple Regression on distance matrices###
###Note to self, RDA is multivariate MRM according to Legendre et al. (2015).

##Response on left. ##Fst is response.
MRM.results<-MRM(FST_pairwise2 ~ Distances2)
MRM.results
##Regression on Distance from most downstream site
data2<-read.csv(file = "DownstreamGeneticDiversity.csv")

##Observed Heterozygosity##
model.obsHet<-lm(data2$Ho ~ data2$Distance)
summary(model.obsHet)##p = 0.1649
ggplot(data2,aes(x=data2$Distance,y=data2$Ho)) + geom_point(shape=1) +expand_limits(y=0)+geom_line(aes(x=data2$Distance,y=model.obsHet$fitted.values,color="red"))+theme(panel.background = element_blank())

##Expected Heterozygosity##
model.expHet<-lm(data2$He ~ data2$Distance)
summary(model.expHet)##p=0.3296
ggplot(data2,aes(x=data2$Distance,y=data2$He)) + geom_point(shape=1) +expand_limits(y=0)+geom_line(aes(x=data2$Distance,y=model.expHet$fitted.values,color="red"))+theme(panel.background = element_blank())

model.pi<-lm(data2$Pi ~ data2$Distance)
summary(model.pi)##p =0.1762
ggplot(data2,aes(x=data2$Distance,y=data2$Pi)) + geom_point(shape=1) +expand_limits(y=0)+geom_line(aes(x=data2$Distance,y=model.pi$fitted.values,color="red"))+theme(panel.background = element_blank())

model.Ar<-lm(data2$Ar ~data2$Distance)
summary(model.Ar)##p=0.3592
ggplot(data2,aes(x=data2$Distance,y=data2$Ar)) + geom_point(shape=1) +expand_limits(y=0)+geom_line(aes(x=data2$Distance,y=model.Ar$fitted.values,color="red"))+theme(panel.background = element_blank())
