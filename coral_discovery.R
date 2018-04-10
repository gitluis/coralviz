
##############################################################################################################
## CAP 6737 - Final Project - Coral Data Visualization
## 
## Name: Luis A. Rivera Morales
## UCF ID: 4402075
##############################################################################################################

# set working dir
setwd("C:/Users/groot/Desktop/gitluis/coralviz")


## MISSING PACKAGES
## ----------------
## Use install.packages("pkg_name") to install any missing packages.


## CORAL DATA ANALYSIS
## -------------------
## The idea is to obtain a coral dataset containing coral information such as location, coral bleaching, or
## coral diseases with enough different corals and/or metrics to generate multiple visualizations of the
## data set for further analysis. A dashboard containing different graphs showing the information in
## different forms which could even lead to detecting any similarities in between the coral samples.

# read Coral dataset
ds = read.csv("data/CoralBleachingRaw.csv")
ds.raw = ds

ds = read.csv("data/CoralDiseasesRaw.csv")
ds.raw = ds


##############################################################################################################
## Data Analysis
##############################################################################################################

#install.packages("ggplot2")
require(ggplot2, quietly=TRUE, warn.conflicts=FALSE)

# get_column_index: Retrieves column index of a data frame
get_column_index = function(column, data){
  return( grep(column, colnames(data))[1] )
}

# Histogram & Bar chart functions
histogram = function(i){
  qplot(ds.numeric[,i], geom="histogram", bins=50, main=names(ds.numeric)[i], xlab=names(ds.numeric)[i])
}
barchart = function(i){
  qplot(ds.categorical[,i], geom="bar", main=names(ds.categorical)[i], xlab=names(ds.categorical)[i])
}


# check structure & analyze variables
str(ds)

# print a summary of the dataset
summary(ds)


# separate numerical variables from categorical variables
ds.numeric = ds[ , sapply(ds, is.numeric)]
ds.categorical = ds[ , sapply(ds, is.factor)]


# generate summary statistics of numerical variables
#install.packages("e1071")
require(e1071, quietly=TRUE, warn.conflicts=FALSE)

ds.stats = as.data.frame(t(do.call(cbind, lapply(ds.numeric, summary))))
ds.stats$skewness = as.data.frame(t(do.call(cbind, lapply(na.omit(ds.numeric), skewness))))[,1]
ds.stats$kurtosis = as.data.frame(t(do.call(cbind, lapply(na.omit(ds.numeric), kurtosis))))[,1]


# plot histograms of numerical variables
lapply(1:3, histogram)
lapply(4:6, histogram)
lapply(7:9, histogram)


# plot bar charts of categorical variables
barchart(get_column_index("region", ds.categorical))
barchart(get_column_index("subregion", ds.categorical))

barchart(get_column_index("bleaching_severity", ds.categorical))
barchart(get_column_index("mortality", ds.categorical))


##############################################################################################################
## Numerical/Categorical Variables Recoding for Coral Bleaching
##############################################################################################################

# replace empty levels with no data (NA)
levels(ds$region)[1] = "NA"
levels(ds$subregion)[1] = "NA"


# clean up percentage of coral affected by bleaching
length(which(ds$percentage_affected == ""))
length(which(ds$percentage_affected == "")) / nrow(ds) * 100

##
## 75% of 'percentage_affected' are NA's
## data is no good for visual graph
##


# clean up bleaching duration time
length(which(ds$bleaching_duration == ""))
length(which(ds$bleaching_duration == "")) / nrow(ds) * 100

##
## 95% of 'bleaching_duration' are NA's
## data is no good for visual graph
##


##############################################################################################################
# Export prepared dataset(s)
##############################################################################################################
write.csv(ds, file="data/CoralBleaching.csv", na="", row.names=FALSE, col.names=TRUE)



