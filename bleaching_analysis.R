
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
ds = read.csv("data/CoralBleachingRaw.csv")
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


## -----------------------------------------------------------------------------------------------------------
## Numerical/Categorical Variables Recoding for Coral Bleaching
## -----------------------------------------------------------------------------------------------------------
require(stringr, quietly=TRUE, warn.conflicts=FALSE)

# lowercase bleaching severity levels & show graph
levels(ds$bleaching_severity) = c("High", "Low", "Medium", "No Bleaching", "Unknown")
i = get_column_index("bleaching_severity", ds)
qplot(ds[,i], geom="bar", main=names(ds)[i], xlab=names(ds)[i])
rm(i)


# replace empty levels with no data (NA)
levels(ds$region)[1] = "NA"
levels(ds$subregion)[1] = "NA"


# re-code coral families
# ----------------------
str(ds$coral_family)
families = ds$coral_family

comma_in_string = function(x){
  return( grepl(",", x) )
}

# retrieve which families can be converted
rows = comma_in_string( levels(families) )
levels(families)[rows] = "Mixed"

# save variable
ds$coral_family = families

# show graph
ds.categorical = ds[ , sapply(ds, is.factor)]
barchart(get_column_index("coral_family", ds.categorical))


# convert mortality code to factor
# --------------------------------
summary(ds$mortality_code)

# 92% missing data
5681/nrow(ds) * 100

# convert
mc = as.factor(ds$mortality_code)
mc[which(is.na(mc))] = NA

# save
ds$mortality_code = mc


# regex for float or int numbers only
p_num = "\\d+\\.*\\d*"

# verify coral mortality level (%)
# --------------------------------
#   92% of 'mortalitly' levels is missing data
length(which(ds$mortality == ""))
length(which(ds$mortality == "")) / nrow(ds) * 100

# take sample (non-NAs)
m = ds$mortality
sample_rows = which(m != "")

# extract numbers from strings
sample = m[sample_rows]
sample = str_extract(sample, p_num)

# convert to numeric
sample = as.numeric(format(round(as.numeric(sample), 2), nsmall=2))

# prepare cleaned data
m = rep(NA, nrow(ds))
m[sample_rows] = sample

# conver any mortality % over 100 to NA
m[which(m > 100)] = NA

# check stats
summary(m)
nrow(ds) - 5857 == length(sample_rows)

# save
ds$mortality = m

# re-calculate coral mortality level proportions
length(which(is.na(m)))
length(which(is.na(m))) / nrow(ds) * 100

# so we ended up with 94% of 'mortality' levels missing
# and 6% of data being good...


# verify coral affected by bleaching (%)
# --------------------------------------
#   75% of 'percentage_affected' is missing data
length(which(ds$percentage_affected == ""))
length(which(ds$percentage_affected == "")) / nrow(ds) * 100

# take sample (non-NAs)
perc_affected = ds$percentage_affected
sample_rows = which(perc_affected != "")

# extract numbers from strings
sample = perc_affected[sample_rows]
sample = str_extract(sample, p_num)

# convert to numeric
sample = as.numeric(format(round(as.numeric(sample), 2), nsmall=2))

# prepare cleaned data
perc_affected = rep(NA, nrow(ds))
perc_affected[sample_rows] = sample

# check stats
summary(perc_affected)
nrow(ds) - 4591 == length(sample_rows)

# save
ds$percentage_affected = perc_affected


# how much data from mortality and percentage affected
# variables can we use in reality for graphs?
m_rows = which(!is.na(m))
tmp_data = cbind(mortality=m[m_rows], percentage_affected=perc_affected[m_rows])

nrow(na.omit(tmp_data))

# view data
View(na.omit(tmp_data))

# Answer: There are 103 observations that we can use.


# verify sea water temperature for observations
# ---------------------------------------------
#   83% of 'water_temperature' is missing data
length(which(ds$water_temperature == ""))
length(which(ds$water_temperature == "")) / nrow(ds) * 100

# take sample (non-NAs)
water_temp = ds$water_temperature
sample_rows = which(water_temp != "")

# extract numbers from strings
sample = water_temp[sample_rows]
sample = str_extract(sample, p_num)

# convert to numeric
sample = as.numeric(format(round(as.numeric(sample), 2), nsmall=2))

# Function: Converts emperature from Fahrenheit to Celsius
F_to_C = function(f){
  temp = (f - 32) / 1.8
  temp = as.numeric(format(round(temp, 2), nsmall=2))
  return(temp)
}

# any temp > 90 --- set to 90 F
sample[sample > 90] = 90
summary(sample)

# any temp > 50 --- to Celsius
over_50_rows = sample > 50
sample[over_50_rows] = sapply(sample[over_50_rows], F_to_C)
sample[sample > 32.22] = 32.22
summary(sample)

# prepare cleaned data
water_temp = rep(NA, nrow(ds))
water_temp[sample_rows] = sample

# check stats
summary(water_temp)
nrow(ds) - 5124 == length(sample_rows)

# save
ds$water_temperature = water_temp


# drop any variables that will not be used
ds = ds[, -which(colnames(ds) == "month")]
ds = ds[, -which(colnames(ds) == "bleaching_duration")]
ds = ds[, -which(colnames(ds) == "recovery_code")]
ds = ds[, -which(colnames(ds) == "reference_code")]
ds = ds[, -which(colnames(ds) == "remarks")]
ds = ds[, -which(colnames(ds) == "other_factors")]
ds = ds[, -which(colnames(ds) == "survey_area")]
ds = ds[, -which(colnames(ds) == "survey_type")]
ds = ds[, -which(colnames(ds) == "recovery")]

## -----------------------------------------------------------------------------------------------------------
# Export prepared dataset(s)
## -----------------------------------------------------------------------------------------------------------
write.csv(ds, file="data/CoralBleaching.csv", na="", row.names=FALSE, col.names=TRUE)



