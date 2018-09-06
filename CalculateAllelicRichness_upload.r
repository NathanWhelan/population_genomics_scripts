library(PopGenKit)
library(adegenet)
library(diveRsity)
library(ggplot2)
library(gridExtra)

##Change for your Files
ampla_genepop<-read.genepop("yourDirectory")



##Measure allelic richness, among other things
test_results<-divBasic(infile="~/Leptoxis_ampla/Leptoxis_ampla_SNPs.gen", gp = 2)


#Make results into a table and list out allelic richness per population
alleicRichenes<-test_results$Allelic_richness
allelicRichness<-as.table(alleicRichenes)
allelicRichness["overall",]


#Calculate mean allelic richness per population
pop1_alleles<-mean(allelicRichness[,1])
pop2_alleles<-mean(allelicRichness[,2])
pop3_alleles<-mean(allelicRichness[,3])
pop4_alleles<-mean(allelicRichness[,4])
pop5_alleles<-mean(allelicRichness[,5])
pop6_alleles<-mean(allelicRichness[,6])
pop7_alleles<-mean(allelicRichness[,7])
pop8_alleles<-mean(allelicRichness[,8])

pop1_SD_alleles<-sd(allelicRichness[,1])
pop2_SD_alleles<-sd(allelicRichness[,2])
pop3_SD_alleles<-sd(allelicRichness[,3])
pop4_SD_alleles<-sd(allelicRichness[,4])
pop5_SD_alleles<-sd(allelicRichness[,5])
pop6_SD_alleles<-sd(allelicRichness[,6])
pop7_SD_alleles<-sd(allelicRichness[,7])
pop8_SD_alleles<-sd(allelicRichness[,8])