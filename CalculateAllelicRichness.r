library(diveRsity)

setwd("/path/to/your/files")

##READ in GENEPOP FILE. I used from Stacks
test_results<-divBasic(infile="Lcom_m5M3n2_r75p3_randomSNP.genepop",gp=2)
##Split out Allelic Richness, make into table.  NOTE: Could modify here (and later with variable name) to split out other statistics
test_results$Allelic_richness
alleicRichenes<-test_results$Allelic_richness
allelicRichness<-as.table(alleicRichenes)

##Data check. Note overall values.
allelicRichness
allelicRichness["overall",]

##seperate by population and remove loci that were not genotyped for that population (i.e., Allelic Richness of 0)
pop1_allelicR<-allelicRichness[,1]
pop1_allelicR<-as.data.frame(pop1_allelicR)
pop1_allelicR_zeroesRemoved<-pop1_allelicR[apply(pop1_allelicR!=0,1,all),]

pop2_allelicR<-allelicRichness[,2]
pop2_allelicR<-as.data.frame(pop2_allelicR)
pop2_allelicR_zeroesRemoved<-pop2_allelicR[apply(pop2_allelicR!=0,1,all),]

pop3_allelicR<-allelicRichness[,3]
pop3_allelicR<-as.data.frame(pop3_allelicR)
pop3_allelicR_zeroesRemoved<-pop3_allelicR[apply(pop3_allelicR!=0,1,all),]

pop4_allelicR<-allelicRichness[,4]
pop4_allelicR<-as.data.frame(pop4_allelicR)
pop4_allelicR_zeroesRemoved<-pop4_allelicR[apply(pop4_allelicR!=0,1,all),]

#Calculate Mean
pop1mean<-mean(pop1_allelicR_zeroesRemoved)
pop2mean<-mean(pop2_allelicR_zeroesRemoved)
pop3mean<-mean(pop3_allelicR_zeroesRemoved)
pop4mean<-mean(pop4_allelicR_zeroesRemoved)


##Calculate Sstandard Deviation
pop1sd<-sd(pop1_allelicR_zeroesRemoved)
pop2sd<-sd(pop2_allelicR_zeroesRemoved)
pop3sd<-sd(pop3_allelicR_zeroesRemoved)
pop4sd<-sd(pop4_allelicR_zeroesRemoved)
