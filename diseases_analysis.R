
##############################################################################################################
## CAP 6737 - Final Project - Coral Data Visualization
## Name: Luis A. Rivera Morales
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
ds = read.csv("data/CoralDiseasesRaw.csv")
ds.raw = ds


# separate numerical variables from categorical variables
ds.numeric = ds[ , sapply(ds, is.numeric)]
ds.categorical = ds[ , sapply(ds, is.factor)]


## -----------------------------------------------------------------------------------------------------------
## Data Analysis
## -----------------------------------------------------------------------------------------------------------

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


# disease proportions
summary(ds$disease_type)


# plot histograms of numerical variables
lapply(1:5, histogram)


# plot bar charts of categorical variables
barchart(get_column_index("disease_type", ds.categorical))
barchart(get_column_index("region", ds.categorical))
barchart(get_column_index("subregion", ds.categorical))


## -----------------------------------------------------------------------------------------------------------
## Numerical/Categorical Variables Recoding for Coral Bleaching
## -----------------------------------------------------------------------------------------------------------
require(stringr, quietly=TRUE, warn.conflicts=FALSE)


# re-code all levels that have under 125 observations
# in disease_type variable to Other
rows = which( summary(ds$disease_type) < 125)
levels(ds$disease_type)[rows] = "Other"

# re-code unspecified diseases to Oher as well
levels(ds$disease_type)[4] = "Other"

summary(ds$disease_type)

ds.categorical = ds[ , sapply(ds, is.factor)]
barchart(get_column_index("disease_type", ds.categorical))


# replace empty levels with no data (NA)
levels(ds$region)[1] = "NA"
levels(ds$subregion)[1] = "NA"


# drop any variables that will not be used
ds = ds[, -which(colnames(ds) == "reference_id")]
ds = ds[, -which(colnames(ds) == "disease_remarks")]
ds = ds[, -which(colnames(ds) == "remarks")]

## -----------------------------------------------------------------------------------------------------------
# Export prepared dataset(s)
## -----------------------------------------------------------------------------------------------------------
write.csv(ds, file="data/CoralDiseases.csv", na="", row.names=FALSE, col.names=TRUE)



