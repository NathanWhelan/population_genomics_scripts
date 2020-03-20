library(poppr)

setwd("~/yourDirectory")
rm(list=ls())
compacta.geneid.nout = read.genepop("Lcom_m5M3n2_r75p3_randomSNP.gen")
compacta.genclone.nout<-as.genclone(compacta.geneid.nout)
compacta.genclone.nout$strata
strata(compacta.genclone.nout)<-(as.data.frame(compacta.geneid.nout$pop))
help(read.genepop)

##AMOVA
compacta.genclone.nout
compacta.genclone.nout$strata
compacta.site.amova.pop = poppr.amova(compacta.genclone.nout, ~compacta.geneid.nout.pop, cutoff = 0.5, method = "ade4")
help("poppr.amova")

####Print Results
compacta.site.amova.pop

##Randomization Test
compacta.site.amova.pop.rtest<-randtest(compacta.site.amova.pop,nrepet = 10000)
compacta.site.amova.pop.rtest
plot(compacta.site.amova.pop.rtest)
