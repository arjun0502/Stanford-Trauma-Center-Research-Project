# Arjun Jain
# Combining TIEP data 
# January 5, 2020

## Loading files and required libraries 

library(dplyr)
library(tidyr)
library(stringr)

TIEP_2013 <- read.csv(file = "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_2013_test_mapq.csv", header = T)
TIEP_2014 <- read.csv(file = "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_2014_test_mapq.csv", header = T)
TIEP_2015 <- read.csv(file = "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_2015_test_mapq.csv", header = T)
TIEP_2016 <- read.csv(file = "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_2016_test_mapq.csv", header = T)
TIEP_2017 <- read.csv(file = "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_2017_test_mapq.csv", header = T)
TIEP_2018 <- read.csv(file = "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_2018_test.csv", header = T)
TIEP_2019 <- read.csv(file = "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_2019_test_mapq.csv", header = T)

## Extract necessary columns 

TIEP_2013 <- TIEP_2013[which(names(TIEP_2013) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Des", "State_Des", "Beds_Total"))]
TIEP_2014 <- TIEP_2014[which(names(TIEP_2014) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2015 <- TIEP_2015[which(names(TIEP_2015) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2016 <- TIEP_2016[which(names(TIEP_2016) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2017 <- TIEP_2017[which(names(TIEP_2017) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2018 <- TIEP_2018[which(names(TIEP_2018) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2019 <- TIEP_2019[which(names(TIEP_2019) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]

## Remove duplicate records (all fields match)

TIEP_2013 <- TIEP_2013[!duplicated(TIEP_2013), ]
TIEP_2014 <- TIEP_2014[!duplicated(TIEP_2014), ]
TIEP_2015 <- TIEP_2015[!duplicated(TIEP_2015), ]
TIEP_2016 <- TIEP_2016[!duplicated(TIEP_2016), ]
TIEP_2017 <- TIEP_2017[!duplicated(TIEP_2017), ]
TIEP_2018 <- TIEP_2018[!duplicated(TIEP_2018), ]
TIEP_2019 <- TIEP_2019[!duplicated(TIEP_2019), ]


## Removing extra 4 digits on zip codes for all files (e.g. 66521-9574 to 66521)

zipcodes <- c()
for(zipcode in TIEP_2013$ZIP) {
  new_zipcode <- as.integer(strsplit(as.character(zipcode), "-")[[1]][1])
  zipcodes <- append(zipcodes, new_zipcode)
}
TIEP_2013$ZIP <- zipcodes


zipcodes <- c()
for(zipcode in TIEP_2014$ZIP) {
  new_zipcode <- as.integer(strsplit(as.character(zipcode), "-")[[1]][1])
  zipcodes <- append(zipcodes, new_zipcode)
}
TIEP_2014$ZIP <- zipcodes

zipcodes <- c()
for(zipcode in TIEP_2015$ZIP) {
  new_zipcode <- as.integer(strsplit(as.character(zipcode), "-")[[1]][1])
  zipcodes <- append(zipcodes, new_zipcode)
}
TIEP_2015$ZIP <- zipcodes


zipcodes <- c()
for(zipcode in TIEP_2016$ZIP) {
  new_zipcode <- as.integer(strsplit(as.character(zipcode), "-")[[1]][1])
  zipcodes <- append(zipcodes, new_zipcode)
}
TIEP_2016$ZIP <- zipcodes


zipcodes <- c()
for(zipcode in TIEP_2017$ZIP) {
  new_zipcode <- as.integer(strsplit(as.character(zipcode), "-")[[1]][1])
  zipcodes <- append(zipcodes, new_zipcode)
}
TIEP_2017$ZIP <- zipcodes


zipcodes <- c()
for(zipcode in TIEP_2018$ZIP) {
  new_zipcode <- as.integer(strsplit(as.character(zipcode), "-")[[1]][1])
  zipcodes <- append(zipcodes, new_zipcode)
}
TIEP_2018$ZIP <- zipcodes


zipcodes <- c()
for(zipcode in TIEP_2019$ZIP) {
  new_zipcode <- as.integer(strsplit(as.character(zipcode), "-")[[1]][1])
  zipcodes <- append(zipcodes, new_zipcode)
}
TIEP_2019$ZIP <- zipcodes

## Adding unique identifier based on TCN (hospital name) and zip code 
## Checking if unique identifier is truly unique and remove odd records  

TIEP_2013 <- unite(TIEP_2013, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2013$unique_ID)) == nrow(TIEP_2013)
duplicate <- TIEP_2013$unique_ID[duplicated(TIEP_2013$unique_ID)]
### Two records identical except for different states, removing record with wrong state 
TIEP_2013 <- TIEP_2013[!(TIEP_2013$TCN =="Sanford Medical Center Fargo" & TIEP_2013$State == "MN"),]
is_unique <- length(unique(TIEP_2013$unique_ID)) == nrow(TIEP_2013)

TIEP_2014 <- unite(TIEP_2014, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2014$unique_ID)) == nrow(TIEP_2014)
duplicate <- TIEP_2014$unique_ID[duplicated(TIEP_2014$unique_ID)]
TIEP_2014 <- TIEP_2014[!(TIEP_2014$TCN =="Sanford Medical Center - Fargo" & TIEP_2014$State == "MN"),]
is_unique <- length(unique(TIEP_2014$unique_ID)) == nrow(TIEP_2014)

TIEP_2015 <- unite(TIEP_2015, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2015$unique_ID)) == nrow(TIEP_2015)

TIEP_2016 <- unite(TIEP_2016, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2016$unique_ID)) == nrow(TIEP_2016)

TIEP_2017 <- unite(TIEP_2017, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2017$unique_ID)) == nrow(TIEP_2017)
duplicate <- TIEP_2017$unique_ID[duplicated(TIEP_2017$unique_ID)]
### Removing records with all identifiable fields as blank or NA
TIEP_2017 <- TIEP_2017[!(TIEP_2017$unique_ID == '_NA'), ]
is_unique <- length(unique(TIEP_2017$unique_ID)) == nrow(TIEP_2017)

TIEP_2018 <- unite(TIEP_2018, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2018$unique_ID)) == nrow(TIEP_2018)
duplicate <- TIEP_2018$unique_ID[duplicated(TIEP_2018$unique_ID)]
TIEP_2018 <- TIEP_2018[!(TIEP_2018$unique_ID == '_NA'), ]
### Two identical records except the ACS_Ver field is blank in one record and - in another record
TIEP_2018 <- TIEP_2018[!(TIEP_2018$TCN == 'Medical City Weatherford' & TIEP_2018$ACS_Ver == ""), ]
is_unique <- length(unique(TIEP_2018$unique_ID)) == nrow(TIEP_2018)

TIEP_2019 <- unite(TIEP_2019, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2019$unique_ID)) == nrow(TIEP_2019)
duplicate <- TIEP_2019$unique_ID[duplicated(TIEP_2019$unique_ID)]
### Two identical records except have different State_Des, looked up State_Des as of June 2020 and it is 5 not 4
TIEP_2019 <- TIEP_2019[!(TIEP_2019$TCN == "Lincoln Hospital" & TIEP_2019$State_Des == "4"),]
is_unique <- length(unique(TIEP_2019$unique_ID)) == nrow(TIEP_2019)

## Set rownames to NULL so that row numbers are not messed up after deleting rows
rownames(TIEP_2013) <- NULL
rownames(TIEP_2014) <- NULL
rownames(TIEP_2015) <- NULL
rownames(TIEP_2016) <- NULL
rownames(TIEP_2017) <- NULL
rownames(TIEP_2018) <- NULL
rownames(TIEP_2019) <- NULL

## Remove whitespace from all strings

TIEP_2017 <- trimws(TIEP_2017)

#####################################################################################################################################

# Creating combined TIEP dataframe

## Building combined TIEP dataframe based on TIEP 2019 data
TIEP_combined <- TIEP_2019[1:6]

TIEP_combined$ACS_Ver_2013 <- ""
TIEP_combined$ACS_Ver_2014 <- ""
TIEP_combined$ACS_Ver_2015 <- ""
TIEP_combined$ACS_Ver_2016 <- ""
TIEP_combined$ACS_Ver_2017 <- ""
TIEP_combined$ACS_Ver_2018 <- ""
TIEP_combined$ACS_Ver_2019 <- TIEP_2019$ACS_Ver

TIEP_combined$State_Ver_2013 <- ""
TIEP_combined$State_Des_2014 <- ""
TIEP_combined$State_Des_2015 <- ""
TIEP_combined$State_Des_2016 <- ""
TIEP_combined$State_Des_2017 <- ""
TIEP_combined$State_Des_2018 <- ""
TIEP_combined$State_Des_2019 <- TIEP_2019$State_Des

TIEP_combined$Beds_Total_2013 <- ""
TIEP_combined$Beds_Total_2014 <- ""
TIEP_combined$Beds_Total_2015 <- ""
TIEP_combined$Beds_Total_2016 <- ""
TIEP_combined$Beds_Total_2017 <- ""
TIEP_combined$Beds_Total_2018 <- ""
TIEP_combined$Beds_Total_2019 <- TIEP_2019$Beds_Total

TIEP_combined$TICU_Beds_2013 <- ""
TIEP_combined$TICU_Beds_2014 <- ""
TIEP_combined$TICU_Beds_2015 <- ""
TIEP_combined$TICU_Beds_2016 <- ""
TIEP_combined$TICU_Beds_2017 <- ""
TIEP_combined$TICU_Beds_2018 <- ""
TIEP_combined$TICU_Beds_2019 <- TIEP_2019$TICU_Beds

## TIEP 2013 does not have data on TICU Beds
TIEP_combined$TICU_Beds_2013 <- "-"

########################################################################################################################

## Matching with 2019 

### Figure out how to deal with name does not exactly match up
### Maybe if address state zip all match up 

TIEP_combined[which(TIEP_combined$unique_ID == id), 'City_Town'] == TIEP_2014[which(TIEP_2014$unique_ID == id), 'City_Town'] & 

TIEP_combined[which(TIEP_combined$unique_ID == id), 'State'] == TIEP_2014[which(TIEP_2014$unique_ID == id), 'State'] & 

TIEP_combined[which(TIEP_combined$unique_ID == id), 'Add_1'] == TIEP_2014[which(TIEP_2014$unique_ID == id), 'Add_1'] & 
  
TIEP_combined[which(TIEP_combined$unique_ID == id), 'ZIP'] == TIEP_2014[which(TIEP_2014$unique_ID == id), 'ZIP'] 
  
  
TIEP_combined[10, 'Add_1'] == TIEP_2017[17, 'Add_1']

TIEP_combined[10, 3:6]

for (id in TIEP_2019$unique_ID) {
  if(id %in% TIEP_2014$unique_ID) {
    row_2019 <- which(TIEP_2019$unique_ID == id)
    values <- TIEP_2014[which(TIEP_2014$unique_ID == id), ][, 7:10]
    TIEP_combined[row_2019, c('ACS_Ver_2014', 'State_Des_2014', 'Beds_Total_2014', 'TICU_Beds_2014')] <- values
  } else if() {
    
  } else {
    
  }
}

TIEP_combined[nrow(TIEP_combined) + 1, ] <- "-"
entire_row <- TIEP_2014[which(TIEP_2014$unique_ID == id), ]
TIEP_combined[nrow(TIEP_combined), c('unique_ID', 'TCN', 'Add_1', 'City_Town', 'State', 'ZIP','ACS_Ver_2014', 'State_Des_2014', 'Beds_Total_2014', 'TICU_Beds_2014')] <- entire_row