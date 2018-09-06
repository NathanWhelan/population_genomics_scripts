library(bestNormalize)
library(psych)
library(dplyr)
library(ggplot2)
library(rcompanion)
library(FSA)
library(PerformanceAnalytics)


setwd("yourDirectory")
data1<-read.csv(file = "Genetics_distanceToCenterville.csv", stringsAsFactors = TRUE)



##Allelic Richnes V Distance to centerville
model.2<-lm(Allelic.Richness ~ Distance.to.Centerville, data=data1)
summary(model.2)  ##p = 0.010; R2 = 0.70; y = -0.0059x+1.5370
pdf("allelicRichness_v_DistanceToCentreville.pdf")
ggplot(data=data1)+geom_point(aes(x=data1$Distance.to.Centerville,y=data1$Allelic.Richness))+geom_line(aes(x=data1$Distance.to.Centerville,y=model.2$fit),color="red")+theme(panel.background=element_blank())
dev.off()


###Observed Heterozygosity V Distance to Centerville

#First make data normal
BN_obsHetero<-bestNormalize(data1$Observed.Heterozygosity)
#.xt refers to the normalized data
model.obsHetero<-lm(BN_obsHetero$x.t ~ data1$Distance.to.Centerville)
summary(model.obsHetero)  ##p = 0.009, R2 = 0.71, y = -0.0352x + 1.0463
pdf("observedHeterozygosity_v_DistanceToCenterville.pdf")
ggplot(data=data1)+geom_point(aes(x=data1$Distance.to.Centerville,y=BN_obsHetero$x.t))+geom_line(aes(x=data1$Distance.to.Centerville,y=model.obsHetero$fit),color="red")+theme(panel.background=element_blank())
dev.off()

###Expected Heterozygosity V Distance to Centerville

model.ExpHetero<-lm(Expected.Heterozygosity ~ Distance.to.Centerville, data=data1)
summary(model.ExpHetero) ##p = 0.004, R2 = 0.78, y = -0.0020x + 0.1830 
pdf("expectedHeterozygosity_v_DistanceToCenterville.pdf")
ggplot(data=data1)+geom_point(aes(x=data1$Distance.to.Centerville,y=data1$Expected.Heterozygosity))+geom_line(aes(x=data1$Distance.to.Centerville,y=model.ExpHetero$fit),color="red")+theme(panel.background=element_blank())
dev.off()

###Nucleotide Diversity V Distance to Centerville
model.nucleotideDiversity<-lm(nucleotide_diversity ~ Distance.to.Centerville, data=data1)
summary(model.nucleotideDiversity) ## p = 0.004, R2 = 0.78, y = -0.0020x + 0.1879
pdf("nucleotideDiversity_v_DistanceToCenterville.pdf")
ggplot(data=data1)+geom_point(aes(x=data1$Distance.to.Centerville,y=data1$nucleotide_diversity))+geom_line(aes(x=data1$Distance.to.Centerville,y=model.nucleotideDiversity$fit),color="red")+theme(panel.background=element_blank())
dev.off()
