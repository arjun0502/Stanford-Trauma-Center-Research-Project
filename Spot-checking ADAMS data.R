# Cleaning up census block group datasets
census_block_group_demographic_data <- read.csv("C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/Combined demographic MASTER dataset.csv", header = T)
census_block_group_demographic_data <- census_block_group_demographic_data[-c(217740:1048575), ]
colnames(census_block_group_demographic_data)[1] <- "GIS.Join.Match.Code"
colnames(census_block_group_demographic_data) <- sub("^X", "", colnames(census_block_group_demographic_data))
colnames(census_block_group_demographic_data) <- gsub("\\.\\.", "\\.", colnames(census_block_group_demographic_data))
write.csv(census_block_group_demographic_data, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/census_block_group_demographic_data.csv", row.names = F)

census_block_group_demographic_ground_transport_data <- read.csv("C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Adding urban-rural designations to demo.csv file/demo_with_urbanicity_and_urban_percent.csv", header = T)
census_block_group_demographic_ground_transport_data <- census_block_group_demographic_ground_transport_data[-c(217740:1048575), ]
write.csv(census_block_group_demographic_ground_transport_data, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/census_block_group_demographic_ground_transport_data.csv", row.names = F)

# Reading in ADAMS data and census data
adams_data <- read.csv("C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Spot-checking ADAMS data/merged_across_years_just_heli_census_hospital.csv", header = T)
census_data <- read.csv("C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/census_block_group_demographic_ground_transport_data.csv", header = T)
length(intersect(rownames(adams_data),rownames(census_data))) == 217739 #TRUE


# Checking ADAMS to Census and Hospital to Census distances 

## Get two random rows in ADAMS dataset
sample(1:217739, 2)
## 3340 and 164324

## Get data for census block group at row 3340 in ADAMS dataset
### Just checking data from 2013 and Level 1/II 

census_bg_1_data <- adams_data[3340, c(1:11)]
### Grabbing census block group center of population coordinates 
census_bg_1_coordinates <- census_data[which(census_data$GIS.Join.Match.Code == census_bg_1_data[[1]]), c(14:15)]
census_bg_1_data <- c(census_bg_1_data, census_bg_1_coordinates)
library(stringr)
names(census_bg_1_data) <- str_replace(names(census_bg_1_data), "_X", "_Longitude")
names(census_bg_1_data) <- str_replace(names(census_bg_1_data), "_Y", "_Latitude")

## Checking distances using https://www.nhc.noaa.gov/gccalc.shtml 
## Gives two lat/long coordinates and finds distance to nearest whole km
  ### Are coordinates mapping to correct location? Yes
  ### Is Hospital to Census distance correct? Yes 
  ### Is ADAMS to Census distance correct? Yes

census_bg_1_data

## Get data for census block group at row 164324 in ADAMS dataset
## Just checking data from 2019 and Level 1/II/III/IV 
census_bg_2_data <- adams_data[164324, c(1, 145:153)]
### Grabbing census block group center of population coordinates 
census_bg_1_coordinates <- census_data[which(census_data$GIS.Join.Match.Code == census_bg_2_data[[1]]), c(14:15)]
census_bg_2_data <- c(census_bg_2_data, census_bg_1_coordinates)
library(stringr)
names(census_bg_2_data) <- str_replace(names(census_bg_2_data), "_X", "_Longitude")
names(census_bg_2_data) <- str_replace(names(census_bg_2_data), "_Y", "_Latitude")

## Checking distances using https://www.nhc.noaa.gov/gccalc.shtml 
## Gives two lat/long coordinates and finds distance to nearest whole km
  ### Is Hospital to Census distance correct? Yes 
  ### Is ADAMS to Census distance correct? Yes
  ### Is combined distance correct? Yes

census_bg_2_data

# Make sure that hospitals have data for right level and right year

## Loading TIEP hospital dataset
TIEP_data <- read.csv("C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_combined_latest_cleaned.csv", header = T)

## Banner Baywood Medical Center_85206 should not have data for 2013 and not for Level I/II
### Should be false
TIEP_data[144, "unique_ID"] %in% adams_data$Heli_L12_Hospital_ID_2013 ## False
### Should be false
TIEP_data[144, "unique_ID"] %in% adams_data$Heli_L1234_Hospital_ID_2013 ## False
### Should be true
TIEP_data[144, "unique_ID"] %in% adams_data$Heli_L1234_Hospital_ID_2014 ## True
### Should be false 
TIEP_data[144, "unique_ID"] %in% adams_data$Heli_L12_Hospital_ID_2014 ## False
### Should be true
TIEP_data[144, "unique_ID"] %in% adams_data$Heli_L1234_Hospital_ID_2015 ## True


## Loma Linda University Medical Center_92354 should not have data for 2014, 2015, 2016, amd 2017 and for both Level I/II and Level I/II/III/IV
### Should be true
TIEP_data[176, "unique_ID"] %in% adams_data$Heli_L12_Hospital_ID_2013 ## True
### Should be true
TIEP_data[176, "unique_ID"] %in% adams_data$Heli_L1234_Hospital_ID_2013 ## True
### Should be false
TIEP_data[176, "unique_ID"] %in% adams_data$Heli_L12_Hospital_ID_2014 ## False
### Should be false 
TIEP_data[176, "unique_ID"] %in% adams_data$Heli_L12_Hospital_ID_2015 ## False
### Should be false
TIEP_data[176, "unique_ID"] %in% adams_data$Heli_L1234_Hospital_ID_2016 ## False
### Should be true
TIEP_data[176, "unique_ID"] %in% adams_data$Heli_L1234_Hospital_ID_2018 ## True


# Checking distance to flight time is correct by comparing combined distance and flight minutes 

## Get random row in ADAMS dataset
sample(1:217739, 2)
## 133196

## Get combined distance and flight minutes for row 133196
## Just checking data from 2013 and Level 1/II
distance_flight_time_data1 <- adams_data[133196, c(6, 11)]
### 1 kilometer per hour (kmph) is 0.539957 knots
### average non-zero rotor speed is 133.5 knots which is (133.5 knots)*(1 kmph/0.539957 knots) = 247.241910004 kmph
## So, (50089.58 meters)*(1 km/1000 meters)*(1 hr/247.241910004 km)*(60 minutes/1hr) = ~12.15 which is the distance listed!
