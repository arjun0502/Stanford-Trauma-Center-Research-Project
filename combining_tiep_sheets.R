# Arjun Jain
# Combining TIEP data 
# January 5, 2020

## Cleaning up and formatting data 
 
### Loading files and required libraries 

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

### Extracting necessary columns 

TIEP_2013 <- TIEP_2013[which(names(TIEP_2013) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Des", "State_Ver", "Beds_Total"))]
TIEP_2014 <- TIEP_2014[which(names(TIEP_2014) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2015 <- TIEP_2015[which(names(TIEP_2015) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2016 <- TIEP_2016[which(names(TIEP_2016) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2017 <- TIEP_2017[which(names(TIEP_2017) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2018 <- TIEP_2018[which(names(TIEP_2018) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]
TIEP_2019 <- TIEP_2019[which(names(TIEP_2019) %in% c("TCN", "Add_1", "City_Town", "State", "ZIP", "ACS_Ver", "State_Des", "Beds_Total", "TICU_Beds"))]

### Removing duplicate records (all fields match)

TIEP_2013 <- TIEP_2013[!duplicated(TIEP_2013), ]
TIEP_2014 <- TIEP_2014[!duplicated(TIEP_2014), ]
TIEP_2015 <- TIEP_2015[!duplicated(TIEP_2015), ]
TIEP_2016 <- TIEP_2016[!duplicated(TIEP_2016), ]
TIEP_2017 <- TIEP_2017[!duplicated(TIEP_2017), ]
TIEP_2018 <- TIEP_2018[!duplicated(TIEP_2018), ]
TIEP_2019 <- TIEP_2019[!duplicated(TIEP_2019), ]

### Removing whitespace from all strings

TIEP_2013[] <- lapply(TIEP_2013, trimws)
TIEP_2014[] <- lapply(TIEP_2014, trimws)
TIEP_2015[] <- lapply(TIEP_2015, trimws)
TIEP_2016[] <- lapply(TIEP_2016, trimws)
TIEP_2017[] <- lapply(TIEP_2017, trimws)
TIEP_2018[] <- lapply(TIEP_2018, trimws)
TIEP_2019[] <- lapply(TIEP_2019, trimws)

### Removing extra 4 digits on zip codes for all files (e.g. 66521-9574 to 66521)

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

### Putting "-" in blank cells

TIEP_2013[TIEP_2013 == ""] <- "-"
TIEP_2014[TIEP_2014 == ""] <- "-"
TIEP_2015[TIEP_2015 == ""] <- "-"
TIEP_2016[TIEP_2016 == ""] <- "-"
TIEP_2017[TIEP_2017 == ""] <- "-"
TIEP_2018[TIEP_2018 == ""] <- "-"
TIEP_2019[TIEP_2019 == ""] <- "-"

#####################################################################################################################################
## Adding unique identifier based on TCN and ZIP
## Checking for duplicates and making necessary changes 

TIEP_2013 <- unite(TIEP_2013, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2013$unique_ID)) == nrow(TIEP_2013)
duplicate <- TIEP_2013$unique_ID[duplicated(TIEP_2013$unique_ID)]
TIEP_2013 <- TIEP_2013[!(TIEP_2013$TCN =="Sanford Medical Center Fargo" & TIEP_2013$State == "MN"),]
is_unique <- length(unique(TIEP_2013$unique_ID)) == nrow(TIEP_2013)
 
TIEP_2014 <- unite(TIEP_2014, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2014$unique_ID)) == nrow(TIEP_2014)
duplicate <- TIEP_2014$unique_ID[duplicated(TIEP_2014$unique_ID)]
TIEP_2014 <- TIEP_2014[!(TIEP_2014$TCN =="Sanford Medical Center - Fargo" & TIEP_2014$State == "MN"),]
is_unique <- length(unique(TIEP_2014$unique_ID)) == nrow(TIEP_2014)

TIEP_2015 <- unite(TIEP_2015, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2015$unique_ID)) == nrow(TIEP_2015)
duplicate <- TIEP_2015$unique_ID[duplicated(TIEP_2015$unique_ID)]
### Removing records with all identifiable fields as blank or NA
TIEP_2015 <- TIEP_2015[!(TIEP_2015$unique_ID == '-_NA'), ]
is_unique <- length(unique(TIEP_2015$unique_ID)) == nrow(TIEP_2015)

TIEP_2016 <- unite(TIEP_2016, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2016$unique_ID)) == nrow(TIEP_2016)
duplicate <- TIEP_2016$unique_ID[duplicated(TIEP_2016$unique_ID)]
TIEP_2016 <- TIEP_2016[!(TIEP_2016$unique_ID == '-_NA'), ]
is_unique <- length(unique(TIEP_2016$unique_ID)) == nrow(TIEP_2016)

TIEP_2017 <- unite(TIEP_2017, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2017$unique_ID)) == nrow(TIEP_2017)
duplicate <- TIEP_2017$unique_ID[duplicated(TIEP_2017$unique_ID)]
TIEP_2017 <- TIEP_2017[!(TIEP_2017$unique_ID == '-_NA'), ]
is_unique <- length(unique(TIEP_2017$unique_ID)) == nrow(TIEP_2017)

TIEP_2018 <- unite(TIEP_2018, unique_ID, c(TCN, ZIP), remove=FALSE)
is_unique <- length(unique(TIEP_2018$unique_ID)) == nrow(TIEP_2018)
duplicate <- TIEP_2018$unique_ID[duplicated(TIEP_2018$unique_ID)]
TIEP_2018 <- TIEP_2018[!(TIEP_2018$unique_ID == '-_NA'), ]
### Two identical records except the ACS_Ver field is blank in one record and - in another record
TIEP_2018 <- TIEP_2018[-(1776), ]
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

#####################################################################################################################################
## Looking at records with same addresses 

### There are records that have same address, city, and state but are different trauma centers (within same hospital)
### Problematic when matching with address + city + state because could match two records that have same address + city + state but are different trauma centers
### So, for a group of records with same address + city + state, each one gets a duplicate_ID
### This ID is common across the years
### For example, lets say there are two trauma centers called "Children's Hospital" and "Main Medical Center" that both have same address + city + state
### In every year, the record of "Children's Hospital" assigned a duplicate_ID of 1 and "Main Medical Center" record assigned duplicate_ID of 2

### Also I changed addresses so they are fully consistent across years and also change addresses that are wrong

TIEP_2013$duplicate_id <- NA
TIEP_2014$duplicate_id <- NA
TIEP_2015$duplicate_id <- NA
TIEP_2016$duplicate_id <- NA
TIEP_2017$duplicate_id <- NA
TIEP_2018$duplicate_id <- NA
TIEP_2019$duplicate_id <- NA

duplicate_2013 <- TIEP_2013$Add_1[duplicated(TIEP_2013$Add_1)]
duplicate_2014 <- TIEP_2014$Add_1[duplicated(TIEP_2014$Add_1)]
duplicate_2015 <- TIEP_2015$Add_1[duplicated(TIEP_2015$Add_1)]
duplicate_2016 <- TIEP_2016$Add_1[duplicated(TIEP_2016$Add_1)]
duplicate_2017 <- TIEP_2017$Add_1[duplicated(TIEP_2017$Add_1)]
duplicate_2018 <- TIEP_2018$Add_1[duplicated(TIEP_2018$Add_1)]
duplicate_2019 <- TIEP_2019$Add_1[duplicated(TIEP_2019$Add_1)]

duplicate_2013

#### There is a trauma center part of a pair of records with same address that has a wrong address so changing that  
TIEP_2013[217, 'Add_1'] <- "7500 Hospital Drive"

#### Changing address (from Rd. to Road) so that can be matched across years
TIEP_2013[216, 'Add_1'] <- "6600 Bruceville Road"
TIEP_2014[226, 'Add_1'] <- "6600 Bruceville Road"

TIEP_2013[741, 10] <- 1
TIEP_2013[742, 10] <- 2
TIEP_2014[779, 11] <- 1
TIEP_2014[780, 11] <- 2
TIEP_2015[819, 11] <- 1
TIEP_2015[820, 11] <- 2
TIEP_2016[820, 11] <- 1
TIEP_2016[821, 11] <- 2
TIEP_2017[887, 11] <- 1
TIEP_2017[888, 11] <- 2
TIEP_2018[951, 11] <- 1
TIEP_2018[952, 11] <- 2
TIEP_2019[848, 11] <- 1
TIEP_2019[834, 11] <- 2

TIEP_2013[c(763, 765), 'Add_1'] <- "1216 Second Street Southwest"
TIEP_2014[800, 'Add_1'] <- "1216 Second Street Southwest"

TIEP_2013[763, 10] <- 1
TIEP_2013[765, 10] <- 2
TIEP_2014[800, 11] <- 2
TIEP_2015[840, 11] <- 2
TIEP_2016[841, 11] <- 2
TIEP_2017[834, 11] <- 2
TIEP_2018[899, 11] <- 2
TIEP_2019[833, 11] <- 2

TIEP_2013[940, 10] <- 1
TIEP_2013[941, 10] <- 2
TIEP_2014[998, 11] <- 2
TIEP_2015[1040, 11] <- 2
TIEP_2016[1041, 11] <- 2
TIEP_2017[1055, 11] <- 2
TIEP_2018[1126, 11] <- 2
TIEP_2019[1114, 11] <- 2

TIEP_2013[1633, c("TCN", "Add_1", "ZIP", "unique_ID")] <- c("DeTar Hospital - North", "101 Medical Drive", "77901", "DeTar Hospital - North_77901")
TIEP_2013[1634, c("TCN", "unique_ID", "ZIP")] <- c("DeTar Hospital Navarro", "DeTar Hospital Navarro_77901", "77901")
TIEP_2014[1748, c("ZIP", "unique_ID")] <- c("77901", "DeTar Hospital - North_77901")
TIEP_2014[1747, c("ZIP", "unique_ID")] <- c("77901", "DeTar Hospital Navarro_77901")

TIEP_2013[1698, c("Add_1", "ZIP", "unique_ID")] <- c("600 East Main Street", "98541", "Summit Pacific Medical Center_98541")
TIEP_2014[1818, c("Add_1", "ZIP", "unique_ID")] <- c("600 East Main Street", "98541", "Summit Pacific Medical Center_98541")

TIEP_2013 <- TIEP_2013[!(TIEP_2013$unique_ID =="City Hospital_25401"),]
rownames(TIEP_2013) <- NULL

duplicate_2014

TIEP_2014[c(50, 51), 'Add_1'] <- "101 Sivley Road SW"
TIEP_2013[48, 'Add_1'] <- "101 Sivley Road SW"

TIEP_2014[50, 11] <- 1
TIEP_2014[51, 11] <- 2
TIEP_2013[48, 10] <- 1
TIEP_2015[66, 11] <- 1
TIEP_2016[66, 11] <- 1
TIEP_2017[41, 11] <- 1
TIEP_2018[42, 11] <- 1
TIEP_2019[20, 11] <- 1

TIEP_2013[105, 'Add_1'] <- "Two St Vincent Circle"
TIEP_2014[117, 'City_Town'] <- "Little Rock"
TIEP_2018[88, 'Add_1'] <- "Two St Vincent Circle"
TIEP_2019[76, 'Add_1'] <- "Two St Vincent Circle"

TIEP_2013[105, 'duplicate_id'] <- 1
TIEP_2013[106, 'duplicate_id'] <- 2
TIEP_2014[105, 11] <- 1
TIEP_2014[117, 11] <- 2
TIEP_2015[137, 11] <- 1
TIEP_2016[137, 11] <- 1
TIEP_2017[84, 11] <- 1
TIEP_2018[88, 11] <- 1
TIEP_2019[76, 11] <- 1

TIEP_2014[803, 1:6] <- TIEP_2015[843, 1:6]

TIEP_2014[1600, 11] <- 1
TIEP_2014[1606, 11] <- 2
TIEP_2013[1500, 10] <- 2
TIEP_2015[1652, 11] <- 1
TIEP_2015[1658, 11] <- 2
TIEP_2016[1653, 11] <- 1
TIEP_2016[1659, 11] <- 2
TIEP_2017[1718, 11] <- 2
TIEP_2018[1783, 11] <- 2
TIEP_2019[1622, 11] <- 2

TIEP_2014[1703, c('Add_1','ZIP')] <- c("2827 Babcock Rd", "78229")
TIEP_2013[1590, c('Add_1', 'ZIP')] <- c("2827 Babcock Rd", "78229")

TIEP_2014[1731, 1:6] <- TIEP_2015[1777, 1:6]

duplicate_2015
duplicate_2016
duplicate_2017

TIEP_2017 <- TIEP_2017[!(TIEP_2017$unique_ID == "Providence Park Hospital_48075"),]
rownames(TIEP_2017) <- NULL

TIEP_2014[688, 1:6] <- TIEP_2019[767, 1:6]
TIEP_2015[727, 1:6] <- TIEP_2019[767, 1:6]
TIEP_2016[728, 1:6] <- TIEP_2019[767, 1:6]
TIEP_2017 <- TIEP_2017[!(TIEP_2017$unique_ID == "Sinai-Grace Hospital_48235"),]
rownames(TIEP_2017) <- NULL

TIEP_2017 <- TIEP_2017[!(TIEP_2017$unique_ID == "St. Mary's of Michigan_48601"),]
rownames(TIEP_2017) <- NULL
TIEP_2013[670, 1:6] <- TIEP_2017[718, 1:6]
TIEP_2014[708, 1:6] <- TIEP_2017[718, 1:6]
TIEP_2015[747, 1:6] <- TIEP_2017[718, 1:6]
TIEP_2016[748, 1:6] <- TIEP_2017[718, 1:6]

TIEP_2017[1208, 11] <- 1
TIEP_2017[1210, 11] <- 2
TIEP_2013[1094, 10] <- 1
TIEP_2014[1149, 11] <- 1
TIEP_2015[1194, 11] <- 1
TIEP_2016[1195, 11] <- 1
TIEP_2017[1718, 11] <- 2
TIEP_2018[1278, 11] <- 1
TIEP_2018[1280, 11] <- 2
TIEP_2019[1260, 11] <- 1
TIEP_2019[1292, 11] <- 2
TIEP_2013[1094, 1:6] <- TIEP_2017[1208, 1:6]
TIEP_2014[1149, 1:6] <- TIEP_2017[1208, 1:6]
TIEP_2015[1194, 1:6] <- TIEP_2017[1208, 1:6]
TIEP_2016[1195, 1:6] <- TIEP_2017[1208, 1:6]

TIEP_2017[1278, 11] <- 1
TIEP_2017[1280, 11] <- 2
TIEP_2013[1123, 10] <- 1
TIEP_2014[1177, 11] <- 1
TIEP_2015[1224, 11] <- 1
TIEP_2016[1225, 11] <- 1
TIEP_2018[1345, 11] <- 1
TIEP_2018[1347, 11] <- 2
TIEP_2019[1303, 11] <- 2
TIEP_2019[1334, 11] <- 1

TIEP_2017[1805, 7] <- 2
TIEP_2017 <- TIEP_2017[!(TIEP_2017$unique_ID == "Texas Health Presbyterian Hospital of Dallas_75231"),]
rownames(TIEP_2017) <- NULL

duplicate_2018
duplicate_2019

TIEP_2019[700, c('Add_1','ZIP', 'City_Town')] <- c("110 Metker Trail", "40484", "Stanford")

TIEP_2019[1660, 3] <- "4000 24th St"
TIEP_2013[1538, 3] <- "4000 24th St"
TIEP_2014[1645, 3] <- "4000 24th St"
TIEP_2015[1696, 3] <- "4000 24th St"
TIEP_2016[1697, 3] <- "4000 24th St"
TIEP_2017[1628, 3] <- "4000 24th St"
TIEP_2018[1702, 3] <- "4000 24th St"


TIEP_2019[1756, "Add_1"] <- "1604 Rock Prairie Road"

######################################################################################################################################### 
## Looking at records that have same name across years but different address and zip codes 

### This usually means that an address has different spelling or zipcode has changed (For example, "Third Street" instead of "3rd Street")
### So going to change accordingly so that address and zip code also match up 

which(TIEP_2013$TCN %in% TIEP_2019$TCN == TRUE & TIEP_2013$ZIP %in% TIEP_2019$ZIP == FALSE & TIEP_2013$Add_1 %in% TIEP_2019$Add_1 == FALSE)

TIEP_2013[41, c(1:6)] <- TIEP_2016[56, c(1:6)]
TIEP_2014[45, c(1:6)] <- TIEP_2016[56, c(1:6)]
TIEP_2013[175, c(1:6)] <- TIEP_2016[216, c(1:6)]
TIEP_2014[182, c(1:6)] <- TIEP_2016[216, c(1:6)]
TIEP_2013[181, c(1:6)] <- TIEP_2016[223, c(1:6)]
TIEP_2014[189, c(1:6)] <- TIEP_2016[223, c(1:6)]
TIEP_2013[184, c(1:6)] <- TIEP_2016[225, c(1:6)]
TIEP_2014[192, c(1:6)] <- TIEP_2016[225, c(1:6)]
TIEP_2013[270, c(1:6)] <- TIEP_2016[319, c(1:6)]
TIEP_2014[283, c(1:6)] <- TIEP_2016[319, c(1:6)]
TIEP_2013[322, c(1:6)] <- TIEP_2016[369, c(1:6)]
TIEP_2014[334, c(1:6)] <- TIEP_2016[369, c(1:6)]
TIEP_2019[342, c(1:6)] <- TIEP_2016[369, c(1:6)]
TIEP_2013[399, c(1:6)] <- TIEP_2016[455, c(1:6)]
TIEP_2014[419, c(1:6)] <- TIEP_2016[455, c(1:6)]
TIEP_2017[508, c(1:6)] <- TIEP_2016[455, c(1:6)]
TIEP_2018[526, c(1:6)] <- TIEP_2016[455, c(1:6)]
TIEP_2019[432, c(1:6)] <- TIEP_2016[455, c(1:6)]
TIEP_2013[452, c(1:6)] <- TIEP_2019[543, c(1:6)]
TIEP_2014[471, c(1:6)] <- TIEP_2019[543, c(1:6)]
TIEP_2015[506, c(1:6)] <- TIEP_2019[543, c(1:6)]
TIEP_2016[507, c(1:6)] <- TIEP_2019[543, c(1:6)]
TIEP_2018[453, c(1:6)] <- TIEP_2019[543, c(1:6)]
TIEP_2013[558, c(1:6)] <- TIEP_2019[573, c(1:6)]
TIEP_2014[582, c(1:6)] <- TIEP_2019[573, c(1:6)]
TIEP_2015[617, c(1:6)] <- TIEP_2019[573, c(1:6)]
TIEP_2016[618, c(1:6)] <- TIEP_2019[573, c(1:6)]
TIEP_2017[546, c(1:6)] <- TIEP_2019[573, c(1:6)]
TIEP_2018[577, c(1:6)] <- TIEP_2019[573, c(1:6)]
TIEP_2013[803, c(1:6)] <- TIEP_2019[970, c(1:6)]
TIEP_2014[840, c(1:6)] <- TIEP_2019[970, c(1:6)]
TIEP_2015[879, c(1:6)] <- TIEP_2019[970, c(1:6)]
TIEP_2016[880, c(1:6)] <- TIEP_2019[970, c(1:6)]
TIEP_2017[909, c(1:6)] <- TIEP_2019[970, c(1:6)]
TIEP_2018[978, c(1:6)] <- TIEP_2019[970, c(1:6)]
TIEP_2013[810, c(1:6)] <- TIEP_2019[977, c(1:6)]
TIEP_2014[848, c(1:6)] <- TIEP_2019[977, c(1:6)]
TIEP_2013[814, c(1:6)] <- TIEP_2019[974, c(1:6)]
TIEP_2014[851, c(1:6)] <- TIEP_2019[974, c(1:6)]
TIEP_2015[890, c(1:6)] <- TIEP_2019[974, c(1:6)]
TIEP_2016[891, c(1:6)] <- TIEP_2019[974, c(1:6)]
TIEP_2017[901, c(1:6)] <- TIEP_2019[974, c(1:6)]
TIEP_2018[968, c(1:6)] <- TIEP_2019[974, c(1:6)]
TIEP_2013[833, c(1:6)] <- TIEP_2019[1038, c(1:6)]
TIEP_2014[871, c(1:6)] <- TIEP_2019[1038, c(1:6)]
TIEP_2013[859, c(1:6)] <- TIEP_2019[998, c(1:6)]
TIEP_2014[895, c(1:6)] <- TIEP_2019[998, c(1:6)]
TIEP_2013[874, c(1:6)] <- TIEP_2019[1056, c(1:6)]
TIEP_2014[909, c(1:6)] <- TIEP_2019[1056, c(1:6)]
TIEP_2013[932, c(1:6)] <- TIEP_2019[1111, c(1:6)]
TIEP_2014[991, c(1:6)] <- TIEP_2019[1111, c(1:6)]
TIEP_2013[1056, c(1:6)] <- TIEP_2019[1233, c(1:6)]
TIEP_2014[1106, c(1:6)] <- TIEP_2019[1233, c(1:6)]
TIEP_2013[1151, c(1:6)] <- TIEP_2019[1327, c(1:6)]
TIEP_2014[1205, c(1:6)] <- TIEP_2019[1327, c(1:6)]
TIEP_2013[1266, c(1:6)] <- TIEP_2019[1460, c(1:6)]
TIEP_2014[1327, c(1:6)] <- TIEP_2019[1460, c(1:6)]
TIEP_2013[1339, c(1:6)] <- TIEP_2019[1548, c(1:6)]
TIEP_2014[1403, c(1:6)] <- TIEP_2019[1548, c(1:6)]
TIEP_2013[1439, c(1:6)] <- TIEP_2019[1665, c(1:6)]
TIEP_2014[1543, c(1:6)] <- TIEP_2019[1665, c(1:6)]
TIEP_2013[1598, c(1:6)] <- TIEP_2019[1759, c(1:6)]
TIEP_2014[1637, c(1:6)] <- TIEP_2019[1759, c(1:6)]
TIEP_2013[1669, c(1:6)] <- TIEP_2019[1950, c(1:6)]
TIEP_2014[1788, c(1:6)] <- TIEP_2019[1950, c(1:6)]
TIEP_2013[1718, c(1:6)] <- TIEP_2016[1887, c(1:6)]
TIEP_2014[1837, c(1:6)] <- TIEP_2016[1887, c(1:6)]
TIEP_2019[1984, c(1:6)] <- TIEP_2016[1887, c(1:6)]
TIEP_2013[363, c(1:6)] <- TIEP_2019[406, c(1:6)]
TIEP_2014[375, c(1:6)] <- TIEP_2019[406, c(1:6)]
TIEP_2013[364, c(1:6)] <- TIEP_2019[407, c(1:6)]
TIEP_2014[376, c(1:6)] <- TIEP_2019[407, c(1:6)]
TIEP_2013[17, c(1:6)] <- TIEP_2019[37, c(1:6)]
TIEP_2014[19, c(1:6)] <- TIEP_2019[37, c(1:6)]
TIEP_2015[20, c(1:6)] <- TIEP_2019[37, c(1:6)]
TIEP_2016[20, c(1:6)] <- TIEP_2019[37, c(1:6)]
TIEP_2017[55, c(1:6)] <- TIEP_2019[37, c(1:6)]
TIEP_2018[55, c(1:6)] <- TIEP_2019[37, c(1:6)]
TIEP_2013[203, c(1:6)] <- TIEP_2019[199, c(1:6)]
TIEP_2014[211, c(1:6)] <- TIEP_2019[199, c(1:6)]
TIEP_2013[360, c(1:6)] <- TIEP_2019[403, c(1:6)]
TIEP_2014[373, c(1:6)] <- TIEP_2019[403, c(1:6)]
TIEP_2013[563, c(1:6)] <- TIEP_2019[625, c(1:6)]
TIEP_2014[587, c(1:6)] <- TIEP_2019[625, c(1:6)]
TIEP_2013[1302, c(1:6)] <- TIEP_2019[1502, c(1:6)]
TIEP_2014[1363, c(1:6)] <- TIEP_2019[1502, c(1:6)]

which(TIEP_2014$TCN %in% TIEP_2015$TCN == TRUE & TIEP_2014$ZIP %in% TIEP_2015$ZIP == FALSE & TIEP_2014$Add_1 %in% TIEP_2015$Add_1 == FALSE)

TIEP_2013[246, c(1:6)] <- TIEP_2016[293, c(1:6)]
TIEP_2014[258, c(1:6)] <- TIEP_2016[293, c(1:6)]
TIEP_2013[305, c(1:6)] <- TIEP_2016[355, c(1:6)]
TIEP_2014[319, c(1:6)] <- TIEP_2016[355, c(1:6)]
TIEP_2013[568, c(1:6)] <- TIEP_2016[629, c(1:6)]
TIEP_2014[591, c(1:6)] <- TIEP_2016[629, c(1:6)]
TIEP_2013[1014, c(1:6)] <- TIEP_2016[1113, c(1:6)]
TIEP_2014[1070, c(1:6)] <- TIEP_2016[1113, c(1:6)]
TIEP_2013[311, c(1:6)] <- TIEP_2019[339, c(1:6)]
TIEP_2014[325, c(1:6)] <- TIEP_2019[339, c(1:6)]
TIEP_2013[428, c(1:6)] <- TIEP_2016[483, c(1:6)]
TIEP_2014[447, c(1:6)] <- TIEP_2016[483, c(1:6)]
TIEP_2013[957, c(1:6)] <- TIEP_2016[1056, c(1:6)]
TIEP_2014[1013, c(1:6)] <- TIEP_2016[1056, c(1:6)]
TIEP_2013[2, c(1:6)] <- TIEP_2016[4, c(1:6)]
TIEP_2014[4, c(1:6)] <- TIEP_2016[4, c(1:6)]

TIEP_2018 <- TIEP_2018[!(TIEP_2018$unique_ID == "Wilmington Hospital_NA"),]
rownames(TIEP_2018) <- NULL

#____________________________________________________________________________________________________________________________________--
## Matching the records across years

### Strategy: Match using TCN_zipcode unique_ID and then, for the matching records where the name is different across years, match based on Address, City, State, 
### and duplicate_ID  

### Create combined dataframe 

TIEP_combined <- rbind(TIEP_2013[, c(1:6, 10)], TIEP_2014[, c(1:6, 11)], TIEP_2015[, c(1:6, 11)], TIEP_2016[, c(1:6, 11)], TIEP_2017[, c(1:6, 11)],TIEP_2018[, c(1:6, 11)],TIEP_2019[, c(1:6, 11)])
TIEP_combined <- TIEP_combined[!duplicated(TIEP_combined$unique_ID), ]
TIEP_combined <- TIEP_combined %>% distinct(Add_1, City_Town, State, duplicate_id, .keep_all = TRUE)
rownames(TIEP_combined) <- NULL

TIEP_combined$ACS_Ver_2013 <- ""
TIEP_combined$ACS_Ver_2014 <- ""
TIEP_combined$ACS_Ver_2015 <- ""
TIEP_combined$ACS_Ver_2016 <- ""
TIEP_combined$ACS_Ver_2017 <- ""
TIEP_combined$ACS_Ver_2018 <- ""
TIEP_combined$ACS_Ver_2019 <- ""

TIEP_combined$State_Des_2013 <- ""
TIEP_combined$State_Des_2014 <- ""
TIEP_combined$State_Des_2015 <- ""
TIEP_combined$State_Des_2016 <- ""
TIEP_combined$State_Des_2017 <- ""
TIEP_combined$State_Des_2018 <- ""
TIEP_combined$State_Des_2019 <- ""

TIEP_combined$Beds_Total_2013 <- ""
TIEP_combined$Beds_Total_2014 <- ""
TIEP_combined$Beds_Total_2015 <- ""
TIEP_combined$Beds_Total_2016 <- ""
TIEP_combined$Beds_Total_2017 <- ""
TIEP_combined$Beds_Total_2018 <- ""
TIEP_combined$Beds_Total_2019 <- ""

TIEP_combined$TICU_Beds_2013 <- ""
TIEP_combined$TICU_Beds_2014 <- ""
TIEP_combined$TICU_Beds_2015 <- ""
TIEP_combined$TICU_Beds_2016 <- ""
TIEP_combined$TICU_Beds_2017 <- ""
TIEP_combined$TICU_Beds_2018 <- ""
TIEP_combined$TICU_Beds_2019 <- ""

### Actual matching of records

for (row in 1:nrow(TIEP_2013)) {
  if(TIEP_2013[row, 1] %in% TIEP_combined[, 1] == TRUE | (TIEP_2013[row, 3] %in% TIEP_combined[, 3] == TRUE & TIEP_2013[row, 4] %in% TIEP_combined[, 4] == TRUE & TIEP_2013[row, 5] %in% TIEP_combined[, 5] == TRUE & TIEP_2013[row, 10] %in% TIEP_combined[, 7] == TRUE)) {
    row_combined <- which(TIEP_combined$unique_ID %in% TIEP_2013[row, 1] == TRUE | (TIEP_combined$Add_1 %in% TIEP_2013[row, 3] == TRUE & TIEP_combined$City_Town %in% TIEP_2013[row, 4] == TRUE & TIEP_combined$State %in% TIEP_2013[row, 5] == TRUE & TIEP_combined$duplicate_id %in% TIEP_2013[row, 10] == TRUE))
    values <- TIEP_2013[row, 7:9]
    TIEP_combined[row_combined, c('ACS_Ver_2013', 'State_Des_2013', 'Beds_Total_2013')] <- values
  } else {
    TIEP_combined[nrow(TIEP_combined) + 1, ] <- ""
    entire_row <- TIEP_2013[row, c(1:9)]
    TIEP_combined[nrow(TIEP_combined), c('unique_ID', 'TCN', 'Add_1', 'City_Town', 'State', 'ZIP', 'ACS_Ver_2013', 'State_Des_2013', 'Beds_Total_2013')] <- entire_row
  }
}


for (row in 1:nrow(TIEP_2014)) {
  if(TIEP_2014[row, 1] %in% TIEP_combined[, 1] == TRUE | (TIEP_2014[row, 3] %in% TIEP_combined[, 3] == TRUE & TIEP_2014[row, 4] %in% TIEP_combined[, 4] == TRUE & TIEP_2014[row, 5] %in% TIEP_combined[, 5] == TRUE & TIEP_2014[row, 11] %in% TIEP_combined[, 7] == TRUE)) {
    row_combined <- which(TIEP_combined$unique_ID %in% TIEP_2014[row, 1] == TRUE | (TIEP_combined$Add_1 %in% TIEP_2014[row, 3] == TRUE & TIEP_combined$City_Town %in% TIEP_2014[row, 4] == TRUE & TIEP_combined$State %in% TIEP_2014[row, 5] == TRUE & TIEP_combined$duplicate_id %in% TIEP_2014[row, 11] == TRUE))
    values <- TIEP_2014[row, 7:10]
    TIEP_combined[row_combined, c('ACS_Ver_2014', 'State_Des_2014', 'Beds_Total_2014', 'TICU_Beds_2014')] <- values
  } else {
    TIEP_combined[nrow(TIEP_combined) + 1, ] <- "-"
    entire_row <- TIEP_2014[row, c(1:10)]
    TIEP_combined[nrow(TIEP_combined), c('unique_ID', 'TCN', 'Add_1', 'City_Town', 'State', 'ZIP', 'ACS_Ver_2014', 'State_Des_2014', 'Beds_Total_2014', 'TICU_Beds_2014')] <- entire_row
  }
}

for (row in 1:nrow(TIEP_2015)) {
  if(TIEP_2015[row, 1] %in% TIEP_combined[, 1] == TRUE | (TIEP_2015[row, 3] %in% TIEP_combined[, 3] == TRUE & TIEP_2015[row, 4] %in% TIEP_combined[, 4] == TRUE & TIEP_2015[row, 5] %in% TIEP_combined[, 5] == TRUE & TIEP_2015[row, 11] %in% TIEP_combined[, 7] == TRUE)) {
    row_combined <- which(TIEP_combined$unique_ID %in% TIEP_2015[row, 1] == TRUE | (TIEP_combined$Add_1 %in% TIEP_2015[row, 3] == TRUE & TIEP_combined$City_Town %in% TIEP_2015[row, 4] == TRUE & TIEP_combined$State %in% TIEP_2015[row, 5] == TRUE & TIEP_combined$duplicate_id %in% TIEP_2015[row, 11] == TRUE))
    values <- TIEP_2015[row, 7:10]
    TIEP_combined[row_combined, c('ACS_Ver_2015', 'State_Des_2015', 'Beds_Total_2015', 'TICU_Beds_2015')] <- values
  } else {
    TIEP_combined[nrow(TIEP_combined) + 1, ] <- ""
    entire_row <- TIEP_2015[row, c(1:10)]
    TIEP_combined[nrow(TIEP_combined), c('unique_ID', 'TCN', 'Add_1', 'City_Town', 'State', 'ZIP', 'ACS_Ver_2015', 'State_Des_2015', 'Beds_Total_2015', 'TICU_Beds_2015')] <- entire_row
  }
}

for (row in 1:nrow(TIEP_2016)) {
  if(TIEP_2016[row, 1] %in% TIEP_combined[, 1] == TRUE | (TIEP_2016[row, 3] %in% TIEP_combined[, 3] == TRUE & TIEP_2016[row, 4] %in% TIEP_combined[, 4] == TRUE & TIEP_2016[row, 5] %in% TIEP_combined[, 5] == TRUE & TIEP_2016[row, 11] %in% TIEP_combined[, 7] == TRUE)) {
    row_combined <- which(TIEP_combined$unique_ID %in% TIEP_2016[row, 1] == TRUE | (TIEP_combined$Add_1 %in% TIEP_2016[row, 3] == TRUE & TIEP_combined$City_Town %in% TIEP_2016[row, 4] == TRUE & TIEP_combined$State %in% TIEP_2016[row, 5] == TRUE & TIEP_combined$duplicate_id %in% TIEP_2016[row, 11] == TRUE))
    values <- TIEP_2016[row, 7:10]
    TIEP_combined[row_combined, c('ACS_Ver_2016', 'State_Des_2016', 'Beds_Total_2016', 'TICU_Beds_2016')] <- values
  } else {
    TIEP_combined[nrow(TIEP_combined) + 1, ] <- ""
    entire_row <- TIEP_2016[row, c(1:10)]
    TIEP_combined[nrow(TIEP_combined), c('unique_ID', 'TCN', 'Add_1', 'City_Town', 'State', 'ZIP', 'ACS_Ver_2016', 'State_Des_2016', 'Beds_Total_2016', 'TICU_Beds_2016')] <- entire_row
  }
}

for (row in 1:nrow(TIEP_2017)) {
  if(TIEP_2017[row, 1] %in% TIEP_combined[, 1] == TRUE | (TIEP_2017[row, 3] %in% TIEP_combined[, 3] == TRUE & TIEP_2017[row, 4] %in% TIEP_combined[, 4] == TRUE & TIEP_2017[row, 5] %in% TIEP_combined[, 5] == TRUE & TIEP_2017[row, 11] %in% TIEP_combined[, 7] == TRUE)) {
    row_combined <- which(TIEP_combined$unique_ID %in% TIEP_2017[row, 1] == TRUE | (TIEP_combined$Add_1 %in% TIEP_2017[row, 3] == TRUE & TIEP_combined$City_Town %in% TIEP_2017[row, 4] == TRUE & TIEP_combined$State %in% TIEP_2017[row, 5] == TRUE & TIEP_combined$duplicate_id %in% TIEP_2017[row, 11] == TRUE))
    values <- TIEP_2017[row, 7:10]
    TIEP_combined[row_combined, c('ACS_Ver_2017', 'State_Des_2017', 'Beds_Total_2017', 'TICU_Beds_2017')] <- values
  } else {
    TIEP_combined[nrow(TIEP_combined) + 1, ] <- ""
    entire_row <- TIEP_2017[row, c(1:10)]
    TIEP_combined[nrow(TIEP_combined), c('unique_ID', 'TCN', 'Add_1', 'City_Town', 'State', 'ZIP', 'ACS_Ver_2017', 'State_Des_2017', 'Beds_Total_2017', 'TICU_Beds_2017')] <- entire_row
  }
}

for (row in 1:nrow(TIEP_2018)) {
  if(TIEP_2018[row, 1] %in% TIEP_combined[, 1] == TRUE | (TIEP_2018[row, 3] %in% TIEP_combined[, 3] == TRUE & TIEP_2018[row, 4] %in% TIEP_combined[, 4] == TRUE & TIEP_2018[row, 5] %in% TIEP_combined[, 5] == TRUE & TIEP_2018[row, 11] %in% TIEP_combined[, 7] == TRUE)) {
    row_combined <- which(TIEP_combined$unique_ID %in% TIEP_2018[row, 1] == TRUE | (TIEP_combined$Add_1 %in% TIEP_2018[row, 3] == TRUE & TIEP_combined$City_Town %in% TIEP_2018[row, 4] == TRUE & TIEP_combined$State %in% TIEP_2018[row, 5] == TRUE & TIEP_combined$duplicate_id %in% TIEP_2018[row, 11] == TRUE))
    values <- TIEP_2018[row, 7:10]
    TIEP_combined[row_combined, c('ACS_Ver_2018', 'State_Des_2018', 'Beds_Total_2018', 'TICU_Beds_2018')] <- values
  } else {
    TIEP_combined[nrow(TIEP_combined) + 1, ] <- ""
    entire_row <- TIEP_2018[row, c(1:10)]
    TIEP_combined[nrow(TIEP_combined), c('unique_ID', 'TCN', 'Add_1', 'City_Town', 'State', 'ZIP', 'ACS_Ver_2018', 'State_Des_2018', 'Beds_Total_2018', 'TICU_Beds_2018')] <- entire_row
  }
}

for (row in 1:nrow(TIEP_2019)) {
  if(TIEP_2019[row, 1] %in% TIEP_combined[, 1] == TRUE | (TIEP_2019[row, 3] %in% TIEP_combined[, 3] == TRUE & TIEP_2019[row, 4] %in% TIEP_combined[, 4] == TRUE & TIEP_2019[row, 5] %in% TIEP_combined[, 5] == TRUE & TIEP_2019[row, 11] %in% TIEP_combined[, 7] == TRUE)) {
    row_combined <- which(TIEP_combined$unique_ID %in% TIEP_2019[row, 1] == TRUE | (TIEP_combined$Add_1 %in% TIEP_2019[row, 3] == TRUE & TIEP_combined$City_Town %in% TIEP_2019[row, 4] == TRUE & TIEP_combined$State %in% TIEP_2019[row, 5] == TRUE & TIEP_combined$duplicate_id %in% TIEP_2019[row, 11] == TRUE))
    values <- TIEP_2019[row, 7:10]
    TIEP_combined[row_combined, c('ACS_Ver_2019', 'State_Des_2019', 'Beds_Total_2019', 'TICU_Beds_2019')] <- values
  } else {
    TIEP_combined[nrow(TIEP_combined) + 1, ] <- ""
    entire_row <- TIEP_2019[row, c(1:10)]
    TIEP_combined[nrow(TIEP_combined), c('unique_ID', 'TCN', 'Add_1', 'City_Town', 'State', 'ZIP', 'ACS_Ver_2019', 'State_Des_2019', 'Beds_Total_2019', 'TICU_Beds_2019')] <- entire_row
  }
}

#######################################################################################################################
## Checking matching 

### Mark those records that should have got matched up but did not
### These are records where some ACS designations are a number and others are blank (not "-" but blank) cells
### For these unmatched records, then move over all data to one of the records and then delete duplicate record

TIEP_combined$records_to_check <- ""

for (row in 1:nrow(TIEP_combined)) {
  if(("1" %in% TIEP_combined[row, 8:14] == TRUE & "" %in% TIEP_combined[row, 8:14] == TRUE) | ("2" %in% TIEP_combined[row, 8:14] == TRUE & "" %in% TIEP_combined[row, 8:14] == TRUE) | ("3" %in% TIEP_combined[row, 8:14] == TRUE & "" %in% TIEP_combined[row, 8:14] == TRUE)) {
    TIEP_combined[row, 36] <- "yes"
  } else {
    TIEP_combined[row, 36] <- "no"
  }
}

TIEP_combined[2165, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[28, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "University of Alabama Hospital (UAB)_35233"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2164, 36] <- "no"

TIEP_combined[2198, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[150, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Banner Good Samaritan Medical Center_85006"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2197, 36] <- "no"


TIEP_combined[2198, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[150, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "John C. Lincoln North Mountain Hospital_85020"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2197, 36] <- "no"


TIEP_combined[2198, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[153, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "St. Joseph's Hospital & Medical Center_85013"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2197, 36] <- "no"

TIEP_combined[2199, c(8,15,22)] <- TIEP_combined[155, c(8,15,22)]
TIEP_combined[2199, c(9,16,23, 30)] <- TIEP_combined[1954, c(9,16,23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Scottsdale Healthcare Osborn Medical Center_85251"),]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Scottsdale Healthcare -  Osborn Medical Center_85251"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2197, 36] <- "no"

TIEP_combined[2200, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[159, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "The University of Arizona Medical Center_85724"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2199, 36] <- "no"

TIEP_combined[2563, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[172, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "NorthBay Medical Center_94533"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2562, 36] <- "no"

TIEP_combined[1954, c(8,15,22)] <- TIEP_combined[173, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Community Regional Medical Center_93721"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[1953, 36] <- "no"

TIEP_combined[1955, c(8,15,22)] <- TIEP_combined[185, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "UCLA Medical Center_90095"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[1954, 36] <- "no"

TIEP_combined[2454, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[186, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Rideout Memorial Hospital_95901"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2453, 36] <- "no"

TIEP_combined[2561, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[187, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Mission Hospital_92691"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2560, 36] <- "no"

TIEP_combined[2197, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[188, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Memorial Medical Center_95355"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2196, 36] <- "no"

TIEP_combined[2197, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[192, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Alameda County Medical Center_94602"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2196, 36] <- "no"

TIEP_combined[2198, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[205, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "UC Davis Medical Center_95687"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2197, 36] <- "no"

TIEP_combined[2198, c(8,15,22)] <- TIEP_combined[207, c(8,15,22)]
TIEP_combined[2198, c(9,16,23, 30)] <- TIEP_combined[1952, c(9,16,23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "UC San Diego Health System_92103"),]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "University of California San Diego Medical Center_92103"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2196, 36] <- "no"

TIEP_combined[2297, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[211, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Western Medical Center-Santa Ana_92705"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2296, 36] <- "no"

TIEP_combined[2197, c(8,15,22)] <- TIEP_combined[211, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Santa Barbara Cottage Hospital_93102"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2196, 36] <- "no"

TIEP_combined[2192, c(8,15,22)] <- TIEP_combined[212, c(8,15,22)]
TIEP_combined[2192, c(9,16,23, 30)] <- TIEP_combined[1947, c(9,16,23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Stanford University Medical Center_94305"),]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Stanford Hospital_94305"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2190, 36] <- "no"

TIEP_combined[204, 36] <- "no"

TIEP_combined[1950, c(8,15,22)] <- TIEP_combined[236, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Penrose-St Francis Health Services_80907"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[1949, 36] <- "no"

TIEP_combined[292, 36] <- "no"

TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Bayhealth, Milford Campus_19963"),]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Bayhealth Memorial Hospital - Milford Memorial Hospital_19963"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2300, 36] <- "no"

TIEP_combined[319, c(10, 11, 17, 18, 24, 25, 31, 32)] <- TIEP_combined[2194, c(10, 11, 17, 18, 24, 25, 31, 32)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Lawnwood Regional Medical Center & Heart Institute_34950"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[319, 36] <- "no"

TIEP_combined[1964, c(8,15,22)] <- TIEP_combined[362, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "The Queen's Medical Center_96813"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[1963, 36] <- "no"

TIEP_combined[2324, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[541, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "St. Mary's Medical Center of Evansville_47714"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2323, 36] <- "no"

TIEP_combined[2207, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[547, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "IU/Wishard Memorial Hospital (new 2013: Eskenazi Health)_46202"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2206, 36] <- "no"

TIEP_combined[580, c(14, 21, 28, 35)] <- TIEP_combined[2566, c(14, 21, 28, 35)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "University of Kentucky Albert B. Chandler Hospital_40536"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[580, 36] <- "no"

TIEP_combined[587, c(12:14, 19:21, 26:28, 33:35)] <- TIEP_combined[2341, c(12:14, 19:21, 26:28, 33:35)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "University Medical Center New Orleans_70112"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[587, 36] <- "no"

TIEP_combined[606, c(14, 21, 28, 35)] <- TIEP_combined[2534, c(14, 21, 28, 35)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "UMass Memorial Medical Center - University Campus_1605"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[606, 36] <- "no"

TIEP_combined[2461, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[616, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Eastern Maine Medical Center_4401"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2460, 36] <- "no"

TIEP_combined[2207, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[618, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "University of Michigan Trauma Burn Center_48109"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2206, 36] <- "no"

TIEP_combined[618, c(10, 11, 17, 18, 24, 25, 31, 32)] <- TIEP_combined[2208, c(10, 11, 17, 18, 24, 25, 31, 32)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "St. Joseph Mercy Ann Arbor_48197"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[618, 36] <- "no"

TIEP_combined[1994, c(8,15,22)] <- TIEP_combined[625, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Sinia Grace Hospital_48235"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[1993, 36] <- "no"

TIEP_combined[2206, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[626, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Botsford Hospital Trauma Center_48336"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2205, 36] <- "no"

TIEP_combined[2458, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[628, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Genesys Regional Medical Center_48439"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2457, 36] <- "no"

TIEP_combined[1914, c(8,15,22)] <- TIEP_combined[5, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Joint Base Elemendorf-Richardson Hospital (U.S. Air Force Regional Hospital)_99502"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[1913, 36] <- "no"

TIEP_combined[628, c(14, 21, 28, 35)] <- TIEP_combined[2557, c(14, 21, 28, 35)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Spectrum Health -  Butterworth Hospital_49503"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[628, 36] <- "no"

TIEP_combined[2542, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[635, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Marquette General Hospital_49855"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2541, 36] <- "no"

TIEP_combined[673, c(14, 21, 28, 35)] <- TIEP_combined[2556, c(14, 21, 28, 35)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Essentia Health - St. Mary's Medical Center_55805"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[673, 36] <- "no"

TIEP_combined[2542, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[732, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "North Memorial_55422"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2541, 36] <- "no"

TIEP_combined[2205, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[744, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "St Cloud Hospital_56303"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2204, 36] <- "no"

TIEP_combined[772, c(10,17,24,31)] <- TIEP_2015[880, 7:10]
TIEP_combined[772, c(11,18,25,32)] <- TIEP_2016[881, 7:10]
TIEP_combined[772, c(12,19,26,33)] <- TIEP_2017[920, 7:10]
TIEP_combined[772, c(13,20,27,34)] <- TIEP_2018[987, 7:10]
TIEP_combined[772, c(14,21,28,35)] <- TIEP_2019[960, 7:10]
TIEP_combined[772, 36] <- "no"

TIEP_combined[2185, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[437, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Alegent Health Community Memorial Hospital_51555"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2184, 36] <- "no"

TIEP_combined[911, c(9, 16, 23, 30)] <- TIEP_combined[909, c(9, 16, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Sanford Medical Center Bismarck_58501"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[910, 36] <- "no"

TIEP_combined[2021, c(8,15,22)] <- TIEP_combined[939, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Trinity Health_58701"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2020, 36] <- "no"

TIEP_combined[2217, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1016, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Cooper Health System_8103"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2216, 36] <- "no"

TIEP_combined[2360, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1019, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Jersey Shore University Medical Center_7754"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2359, 36] <- "no"

TIEP_combined[2216, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1020, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "University of Medicine and Dentistry of New Jersey-University Hospital_70102"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2215, 36] <- "no"

TIEP_combined[2369, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1072, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Akron General Medical Center_44307"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2368, 36] <- "no"

TIEP_combined[2537, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1078, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Bethesda North_45242"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2536, 36] <- "no"

TIEP_combined[2368, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1081, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Hillcrest Hospital_44124"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2367, 36] <- "no"

TIEP_combined[2221, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1090, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "ProMedica Defiance Regional Medical Center_43512"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2220, 36] <- "no"

TIEP_combined[1097, 36] <- "no"

TIEP_combined[2222, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1098, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Affinity Medical Center - Massillon_44646"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2221, 36] <- "no"

TIEP_combined[2367, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1101, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Robinson Memorial Hospital_44266"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2366, 36] <- "no"

TIEP_combined[2221, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1108, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "St. John West Shore Hospital_44145"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2220, 36] <- "no"

TIEP_combined[1109, 36] <- "no"

TIEP_combined[2221, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1111, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Genesis - Good Samaritan Hospital_43701"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2220, 36] <- "no"

TIEP_combined[2367, c(8,15,22)] <- TIEP_combined[1242, c(8,15,22)]
TIEP_combined[2367, c(9,16,23, 30)] <- TIEP_combined[2027, c(9,16,23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Legacy Emanuel Hospital and Health Center_97227"),]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Legacy Emanuel Hospital_97227"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2365, 36] <- "no"

TIEP_combined[1288, c(14, 21, 28, 35)] <- TIEP_combined[2542, c(14, 21, 28, 35)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Medical Center of Medical University of South Carolina_29425"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[1288, 36] <- "no"

TIEP_combined[2488, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1307, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Rapid City Regional Health_57701"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2487, 36] <- "no"

TIEP_combined[2373, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1307, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Avera McKennan Hospital and University Health Center_57105"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2372, 36] <- "no"

TIEP_combined[2379, c(8,15,22)] <- TIEP_combined[1342, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "University Medical Center Brackenridge_78701"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2378, 36] <- "no"

TIEP_combined[2377, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1379, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Christus Spohn Hospital Corpus Christi Memorial_78405"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2376, 36] <- "no"

TIEP_combined[2081, c(8,15,22)] <- TIEP_combined[1447, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Kindred Hospital-Houston (ben taub)_77030"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2080, 36] <- "no"

TIEP_combined[2083, c(8,15,22)] <- TIEP_combined[1487, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "UMC Health System (Texas Specialty Hospital at Lubbock)_79415"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2082, 36] <- "no"

TIEP_combined[1611, c(10, 11, 17, 18, 24, 25, 31, 32)] <- TIEP_combined[2527, c(10, 11, 17, 18, 24, 25, 31, 32)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "University of Virginia Medical Center (Charlottesville)_22908"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[1611, 36] <- "no"

TIEP_combined[2101, c(8,15,22)] <- TIEP_combined[1748, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Mercy Hospital and Trauma Center_53547"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2100, 36] <- "no"

TIEP_combined[2101, c(8,15,22)] <- TIEP_combined[1748, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Mercy Hospital and Trauma Center_53547"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2100, 36] <- "no"

TIEP_combined[1898, 36] <- "no"
TIEP_combined[1899, 36] <- "no"
TIEP_combined[1904, 36] <- "no"
TIEP_combined[1906, 36] <- "no"

TIEP_combined[1908, c(8,15,22)] <- TIEP_combined[179, c(8,15,22)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "St. Mary Medical Center_90813"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[1907, 36] <- "no"

TIEP_combined[2400, c(9, 16, 23, 30)] <- TIEP_combined[1910, c(9, 16, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Marian Regional Medical Center_93454"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2399, 36] <- "no"

TIEP_combined[1919, 36] <- "no"
TIEP_combined[1937, 36] <- "no"
TIEP_combined[1938, 36] <- "no"
TIEP_combined[1944, 36] <- "no"
TIEP_combined[1945, 36] <- "no"
TIEP_combined[1961, 36] <- "no"
TIEP_combined[1962, 36] <- "no"
TIEP_combined[1964, 36] <- "no"
TIEP_combined[1965, 36] <- "no"
TIEP_combined[2007, 36] <- "no"
TIEP_combined[2009, 36] <- "no"
TIEP_combined[2025, 36] <- "no"
TIEP_combined[2063, 36] <- "no"
TIEP_combined[2067, 36] <- "no"
TIEP_combined[2073, 36] <- "no"
TIEP_combined[2090, 36] <- "no"
TIEP_combined[2102, 36] <- "no"

TIEP_combined[2144, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[157, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Tuba City Regional Health Care Corp._86045"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2143, 36] <- "no"

TIEP_combined[2152, 36] <- "no"
TIEP_combined[2156, 36] <- "no"
TIEP_combined[2196, 36] <- "no"

TIEP_combined[2342, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1037, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Brookdale Hospital Medical Center_11212"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2341, 36] <- "no"

TIEP_combined[2197, 36] <- "no"
TIEP_combined[2199, 36] <- "no"

TIEP_combined[2200, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1063, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "Stony Brook Medicine_11794"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2199, 36] <- "no"

TIEP_combined[2226, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1488, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "McAllen Medical Center_78503"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2225, 36] <- "no"

TIEP_combined[2236, 36] <- "no"
TIEP_combined[2258, 36] <- "no"
TIEP_combined[2259, 36] <- "no"
TIEP_combined[2262, 36] <- "no"
TIEP_combined[2274, 36] <- "no"
TIEP_combined[2275, 36] <- "no"
TIEP_combined[2276, 36] <- "no"
TIEP_combined[2277, 36] <- "no"
TIEP_combined[2278, 36] <- "no"
TIEP_combined[2279, 36] <- "no"
TIEP_combined[2280, 36] <- "no"
TIEP_combined[2281, 36] <- "no"
TIEP_combined[2282, 36] <- "no"
TIEP_combined[2284, 36] <- "no"
TIEP_combined[2285, 36] <- "no"
TIEP_combined[2297, 36] <- "no"
TIEP_combined[2298, 36] <- "no"

TIEP_combined[2514, c(8, 9, 15, 16, 22, 23, 30)] <- TIEP_combined[1047, c(8, 9, 15, 16, 22, 23, 30)]
TIEP_combined <- TIEP_combined[!(TIEP_combined$unique_ID == "United Health Services - Wilson Medical Center_13790"),]
rownames(TIEP_combined) <- NULL
TIEP_combined[2513, 36] <- "no"

### The rest are records to check because they exist only in those 2017, 2018, 2019 or because duplicates

to_check <- TIEP_combined$ZIP[TIEP_combined$records_to_check == "yes"]
to_check %in% TIEP_2013$ZIP
to_check %in% TIEP_2014$ZIP
to_check %in% TIEP_2015$ZIP
to_check %in% TIEP_2016$ZIP

TIEP_combined$records_to_check <- NULL

### Marking rows where ACS designation changes from level 1/2 to NA/3 or vice versa

TIEP_combined$ACS_des_change <- ""

for (row in 1:nrow(TIEP_combined)) {
  if(("1" %in% TIEP_combined[row, 8:14] == TRUE & "-" %in% TIEP_combined[row, 8:14] == TRUE) | ("1" %in% TIEP_combined[row, 8:14] == TRUE & "3" %in% TIEP_combined[row, 8:14] == TRUE) | ("2" %in% TIEP_combined[row, 8:14] == TRUE & "-" %in% TIEP_combined[row, 8:14] == TRUE) | ("2" %in% TIEP_combined[row, 8:14] == TRUE & "3" %in% TIEP_combined[row, 8:14] == TRUE)) {
    TIEP_combined[row, "ACS_des_change"] <- "yes"
  } else {
    TIEP_combined[row, "ACS_des_change"] <- "no"
  }
}

### Indicating whether hospital was in a sheet for a given year

TIEP_combined$In_2013_Sheet <- ""
TIEP_combined$In_2014_Sheet <- ""
TIEP_combined$In_2015_Sheet <- ""
TIEP_combined$In_2016_Sheet <- ""
TIEP_combined$In_2017_Sheet <- ""
TIEP_combined$In_2018_Sheet <- ""
TIEP_combined$In_2019_Sheet <- ""

for (row in 1:nrow(TIEP_combined)) {
  if(TIEP_combined[row, "ACS_Ver_2013"] != "") {
    TIEP_combined[row, "In_2013_Sheet"] <- "yes"
  } else {
    TIEP_combined[row, "In_2013_Sheet"] <- "no"
  }
}

for (row in 1:nrow(TIEP_combined)) {
  if(TIEP_combined[row, "ACS_Ver_2014"] != "") {
    TIEP_combined[row, "In_2014_Sheet"] <- "yes"
  } else {
    TIEP_combined[row, "In_2014_Sheet"] <- "no"
  }
}

for (row in 1:nrow(TIEP_combined)) {
  if(TIEP_combined[row, "ACS_Ver_2015"] != "") {
    TIEP_combined[row, "In_2015_Sheet"] <- "yes"
  } else {
    TIEP_combined[row, "In_2015_Sheet"] <- "no"
  }
}

for (row in 1:nrow(TIEP_combined)) {
  if(TIEP_combined[row, "ACS_Ver_2016"] != "") {
    TIEP_combined[row, "In_2016_Sheet"] <- "yes"
  } else {
    TIEP_combined[row, "In_2016_Sheet"] <- "no"
  }
}

for (row in 1:nrow(TIEP_combined)) {
  if(TIEP_combined[row, "ACS_Ver_2017"] != "") {
    TIEP_combined[row, "In_2017_Sheet"] <- "yes"
  } else {
    TIEP_combined[row, "In_2017_Sheet"] <- "no"
  }
}

for (row in 1:nrow(TIEP_combined)) {
  if(TIEP_combined[row, "ACS_Ver_2018"] != "") {
    TIEP_combined[row, "In_2018_Sheet"] <- "yes"
  } else {
    TIEP_combined[row, "In_2018_Sheet"] <- "no"
  }
}

for (row in 1:nrow(TIEP_combined)) {
  if(TIEP_combined[row, "ACS_Ver_2019"] != "") {
    TIEP_combined[row, "In_2019_Sheet"] <- "yes"
  } else {
    TIEP_combined[row, "In_2019_Sheet"] <- "no"
  }
}

                                             
### Change SouthEast Alaska Regional Health Consortium (SEARHC)/Mt. Edgecumbe Hospital_99508 City to Anchorage instead of Sitka

TIEP_combined[10, "City_Town"] <- "Anchorage"

### Making ZIP column numeric 

TIEP_combined$ZIP <- as.numeric(TIEP_combined$ZIP)

### Remove duplicate_ID column

TIEP_combined <- TIEP_combined[, -7]

### Creating Excel file from combined dataframe

library(xlsx)
write.xlsx(TIEP_combined, file = "~/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_combined_revised.xlsx", col.names = T, row.names = F, showNA = F)
