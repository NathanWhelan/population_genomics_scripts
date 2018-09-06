####Script for L ampla project to look at IBD using Fst vs. geographical distance


library(hierfstat)
library(ggplot2)
setwd("yourDirectory")

##Generate Pairwise Fst
data1<-read.fstat("Leptoxis_ampla_SNPs.fstat")

pairwise.WCfst(data1,diploid = TRUE)



###Regression analysis after transforming Fst and distance matrices into table (Unfortunately, I did this by hand)


Distance_v_Fst<-read.csv(file = "Distance_v_Fst.csv",header = TRUE)
par(mfrow=c(1,1))
scatter.smooth(x=Distance_v_Fst$GeoDistance, y=Distance_v_Fst$Weir.s.Fst, main="Distance ~ Fst")

##Box plots to check for outliers
par(mfrow=c(1,2))
boxplot(Distance_v_Fst$GeoDistance, main="Distance", sub=paste("Outlier rows: ", boxplot.stats(Distance_v_Fst$GeoDistance)$out))
boxplot(Distance_v_Fst$Weir.s.Fst, main="Fst", sub=paste("Outlier rows: ", boxplot.stats(Distance_v_Fst$Weir.s.Fst)$out))
###There were not outliers



##Historgram to look at normality
library(e1071)
library(rcompanion)
par(mfrow=c(1,2))
plot(density(Distance_v_Fst$GeoDistance), main="Density Plot: Distance", ylab="Fequency", sub=paste("Skewness:", round(e1071::skewness(Distance_v_Fst$GeoDistance),2)))
plotNormalHistogram(Distance_v_Fst$GeoDistance)
qqnorm(Distance_v_Fst$GeoDistance)
qqline(Distance_v_Fst$GeoDistance)
plot(density(Distance_v_Fst$Weir.s.Fst), "Density Plot: Fst", ylab="Fequency", sub=paste("Skewness:", round(e1071::skewness(Distance_v_Fst$Weir.s.Fst), 2)))
qqline(Distance_v_Fst$Weir.s.Fst)
qqnorm(Distance_v_Fst$Weir.s.Fst)
###Seems reasonably "normal"

cor(Distance_v_Fst$GeoDistance, Distance_v_Fst$Weir.s.Fst, method="pearson")
linearMod<-lm(Weir.s.Fst ~ GeoDistance, data=Distance_v_Fst)
print(linearMod)
summary(linearMod)
##FORMULA: Fst=0.405880 +0.004477*GeoDistance

##Plot with regression line
pdf("Fst_v_GeoDistance_regression.pdf")
ggplot(data=Distance_v_Fst)+geom_point(aes(x=Distance_v_Fst$GeoDistance,y=Distance_v_Fst$Weir.s.Fst))+geom_line(aes(x=Distance_v_Fst$GeoDistance,y=linearMod$fit),color="red")+theme(panel.background=element_blank())
dev.off()



####MANTEL TEST
setwd("yourDirectory")
Distances<-read.csv("Distance.csv", header=FALSE)
Distances2<-as.dist(Distances)
Distances2

FST_pairwise<-read.csv("PairwiseFst.csv", header=FALSE)
FST_pairwise2<-as.dist(FST_pairwise)



ibd<-mantel.randtest(FST_pairwise2,Distances2)
plot(ibd)
ibd

