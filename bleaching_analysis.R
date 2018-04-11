
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


# separate numerical variables from categorical variables
ds.numeric = ds[ , sapply(ds, is.numeric)]
ds.categorical = ds[ , sapply(ds, is.factor)]


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


# plot histograms of numerical variables
lapply(1:3, histogram)
lapply(4:6, histogram)
lapply(7:9, histogram)


# plot bar charts of categorical variables
barchart(get_column_index("region", ds.categorical))
barchart(get_column_index("subregion", ds.categorical))
barchart(get_column_index("bleaching_severity", ds.categorical))

# mortality is numeric in reality, need to replace with numbers
barchart(get_column_index("mortality", ds.categorical))


##############################################################################################################
## Numerical/Categorical Variables Recoding for Coral Bleaching
##############################################################################################################
require(stringr, quietly=TRUE, warn.conflicts=FALSE)


# lowercase bleaching severity levels & show graph
levels(ds$bleaching_severity) = c("High", "Low", "Medium", "No Bleaching", "Unknown")
i = get_column_index("bleaching_severity", ds)
qplot(ds[,i], geom="bar", main=names(ds)[i], xlab=names(ds)[i])
rm(i)


# replace empty levels with no data (NA)
levels(ds$region)[1] = "NA"
levels(ds$subregion)[1] = "NA"


# verify percentage of mortalities and codes
length(which(is.na(ds$mortality_code)))
length(which(is.na(ds$mortality_code))) / nrow(ds) * 100

##
## 91% of 'mortality_code' and 'mortality' are NA's
## 9% may be used as sample for graph
##


# verify percentage of coral affected by bleaching
length(which(ds$percentage_affected == ""))
length(which(ds$percentage_affected == "")) / nrow(ds) * 100

##
## 75% of 'percentage_affected' are NA's
## 25% may be used as sample for graph
##

# regex for float or int numbers only
p = "([0-9]+)(.*)([0-9]+)"

# take sample (non-NAs) and extract numbers only from strings
sample_rows = which(ds$percentage_affected != "")
sample = ds$percentage_affected[sample_rows]
sample = str_extract(sample, p)

sample_numbers_only_rows = which(!is.na(sample))
sample = sample[sample_numbers_only_rows]

# remove hyphen symbol (-) and find average
rm_hyphen = function(v){
  # parse numbers then calculate mean
  v = mean(as.numeric(unlist(strsplit(v, "-"))))
  # format number with 2 decimal digits only
  v = format(round(v, 2), nsmall=2)
  return(v)
}

sample = as.numeric(unlist(lapply(sample, rm_hyphen)))


# verify bleaching duration time
length(which(ds$bleaching_duration == ""))
length(which(ds$bleaching_duration == "")) / nrow(ds) * 100

##
## 95% of 'bleaching_duration' are NA's
## 5% may be used as sample for graph
##


# drop any variables that will not be used
ds = ds[, -which(colnames(ds) == "recovery_code")]
ds = ds[, -which(colnames(ds) == "reference_code")]

ds = ds[, -which(colnames(ds) == "remarks")]
ds = ds[, -which(colnames(ds) == "other_factors")]
ds = ds[, -which(colnames(ds) == "survey_area")]
ds = ds[, -which(colnames(ds) == "survey_type")]
ds = ds[, -which(colnames(ds) == "recovery")]

##############################################################################################################
# Export prepared dataset(s)
##############################################################################################################
write.csv(ds, file="data/CoralBleaching.csv", na="", row.names=FALSE, col.names=TRUE)



