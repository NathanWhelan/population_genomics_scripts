library(adegenet)
library(poppr)
library(ape)
setwd("yourDirectory")
rm(list=ls())
ampla.geneid.nout = import2genind("Leptoxis_ampla_SNPs.str", onerowperind=FALSE, n.ind = 159, n.loc = 2608, row.marknames=1, col.lab = 1, col.pop=2, ask=FALSE, NA.char=0)
ampla.genclone.nout<-as.genclone(ampla.geneid.nout)

ampla.hier.noout<-read.table("PopulationsForAMOVA_numberNames.txt", header=TRUE)
ampla.gc.strat.noout<-as.genclone(ampla.geneid.nout, strata = ampla.hier.noout)
ampla.gc.strat.noout$strata
strata(ampla.geneid.nout)=ampla.hier.noout[-1]
pop(ampla.geneid.nout)
ampla.gc.strat.noout<-as.genclone(ampla.geneid.nout)
ampla.gc.strat.noout

##AMOVA
ampla.site.amova.pop = poppr.amova(ampla.gc.strat.noout, ~pop, cutoff = 0.3, method = "ade4")



####Print Results
ampla.site.amova.pop

##Randomization Test
ampla.site.amova.pop.rtest<-randtest(ampla.site.amova.pop,nrepet = 500)
ampla.site.amova.pop.rtest
plot(ampla.site.amova.pop.rtest)


