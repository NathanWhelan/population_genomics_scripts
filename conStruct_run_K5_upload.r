library(conStruct)

##Rstan option to auto detect cores
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

setwd("/home/aubnvw/conStruct/")

##read in alleles file
alleles<-read.table(file="ampla_conStruct.txt")
allelesMatrix<-as.matrix(alleles) ##Convert table to matrix

##read in coordinates file
geoCoords<-as.matrix(read.table(file="localities_conStruct.txt",header=TRUE))

##read in distances and convert to correct format
geoDistTemp<-read.table(file="distanceMatrix_conStruct_transposeTest.txt")
geoDistances<-(as.matrix(read.table(file="distanceMatrix_conStruct_transposeTest.txt")))
geoDistances2<-matrix(geoDistances,ncol=ncol(geoDistTemp),dimnames=NULL)

conStruct(spatial=TRUE, K=5, freqs=allelesMatrix, geoDist = geoDistances2, coords=geoCoords, prefix="ampla_3Chains_50000iter_K5_new", n.iter = 50000, n.chains =3)
q(save="no")
