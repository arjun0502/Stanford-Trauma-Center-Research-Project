# Read in files
adams_data <- read.csv("C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Spot-checking ADAMS data/merged_across_years_just_heli_census_hospital.csv", header = T)
census_data <- read.csv("C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/census_block_group_demographic_ground_transport_data.csv", header = T)

# Grab demographic data from census_data 
census_block_group_final_dataset <- census_data[, c(1:246, 305:311)]
colnames(census_block_group_final_dataset)[5] <- "State.Name"
colnames(census_block_group_final_dataset) <-  gsub('\\.', '_', colnames(census_block_group_final_dataset))
colnames(census_block_group_final_dataset)[c(12, 13)] <- c("Urbanicity", "Urban_Percent")
colnames(census_block_group_final_dataset) <- sub("^X", "", colnames(census_block_group_final_dataset))

# Adding additional columns
additional_columns <- c("shortest_access_time_L12_2013",
                        "shortest_access_time_L12_2014",
                        "shortest_access_time_L12_2015",
                        "shortest_access_time_L12_2016",
                        "shortest_access_time_L12_2017",
                        "shortest_access_time_L12_2018",
                        "shortest_access_time_L12_2019",
                        "shortest_access_time_L1234_2013",
                        "shortest_access_time_L1234_2014",
                        "shortest_access_time_L1234_2015",
                        "shortest_access_time_L1234_2016",
                        "shortest_access_time_L1234_2017",
                        "shortest_access_time_L1234_2018",
                        "shortest_access_time_L1234_2019")

census_block_group_final_dataset[,additional_columns] <- NA

# Checking if GISJOIN codes match up
length(intersect(census_block_group_final_dataset$GIS_Join_Match_Code, adams_data$ï..GIS_Join_Match_Code))
length(intersect(census_block_group_final_dataset$GIS_Join_Match_Code, census_data$GIS.Join.Match.Code))

# Checking indeces of columns with ground/air transport times and all line up in order
colnames(census_data)[c(255:261, 284:290)]
colnames(adams_data)[c(12, 34, 56, 78, 100, 122, 144, 23, 45, 67, 89, 111, 133, 155)]
colnames(census_block_group_final_dataset)[254:267]

# Creating the final dataset
## Looping through GISJOIN codes
for(GISJOIN in census_block_group_final_dataset$GIS_Join_Match_Code) {
  ## Get indices of GISJOIN code in each dataframe (final, census, ADAMS)
  final_index <- which(census_block_group_final_dataset$GIS_Join_Match_Code == GISJOIN)
  census_index <- which(census_data$GIS.Join.Match.Code == GISJOIN)
  adams_index <- which(adams_data$ï..GIS_Join_Match_Code == GISJOIN)
  ## Grab all ground transport times for given GISJOIN code
    ### i.e. Minutes2013_plus_prehosp & X1234_Minutes2013_plus_prehosp
  ground_transport_times <- census_data[census_index, c(255:261, 284:290)]
  ## Grab all air transport access times for given GISJOIN code 
    ### i.e. Heli_L12_FlightMinutesPlus21_6_2013 & Heli_L1234_FlightMinutesPlus21_6_2013 
  air_transport_times <- adams_data[adams_index, c(12, 34, 56, 78, 100, 122, 144, 23, 45, 67, 89, 111, 133, 155)]
  ## For all 14 access times (2013-2019 for Level I/II and 2013-2019 for Level I/II/III/IV)...
     ### If ground transport time is NA, then update final dataset with air transport time 
     ### Else update final dataset with minimum of ground and air transport times 
  for(i in 1:14) {
    if(is.na(ground_transport_times[[i]]) == TRUE) {
      census_block_group_final_dataset[final_index, i + 253] <- air_transport_times[[i]]
    } else {
      shortest_access_time <- min(ground_transport_times[[i]], air_transport_times[[i]])
      census_block_group_final_dataset[final_index, i + 253] <- shortest_access_time
    }
  }
}


saveRDS(census_block_group_final_dataset, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/census_block_group_final_dataset_with_shortest_access_times.rds")

write.csv(census_block_group_final_dataset, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/census_block_group_final_dataset_with_shortest_access_times.csv", row.names = F)

# Hand checking results

## Choose three random rows 
sample(1:217739, 3)
### 133196, 68953, 96490

## Row 133196
example1_GISJOIN = census_block_group_final_dataset$GIS_Join_Match_Code[133196]
example1_air_transport_times <- adams_data[which(adams_data$ï..GIS_Join_Match_Code == example1_GISJOIN), c(12, 34, 56, 78, 100, 122, 144, 23, 45, 67, 89, 111, 133, 155)]
example1_air_transport_times
example1_ground_transport_times <- census_data[which(census_data$GIS.Join.Match.Code == example1_GISJOIN), c(255:261, 284:290)]
example1_ground_transport_times
example1_final_times <- census_block_group_final_dataset[133196, c(254:267)]
example1_final_times
## Compared ground transport, air transport, and final times for all access times and it is correct

## Row 68953
example2_GISJOIN = census_block_group_final_dataset$GIS_Join_Match_Code[68953]
example2_air_transport_times <- adams_data[which(adams_data$ï..GIS_Join_Match_Code == example2_GISJOIN), c(12, 34, 56, 78, 100, 122, 144, 23, 45, 67, 89, 111, 133, 155)]
example2_air_transport_times
example2_ground_transport_times <- census_data[which(census_data$GIS.Join.Match.Code == example2_GISJOIN), c(255:261, 284:290)]
example2_ground_transport_times
example2_final_times <- census_block_group_final_dataset[68953, c(254:267)]
example2_final_times
## Compared ground transport, air transport, and final times for all access times and it is correct

## Row 96490
example3_GISJOIN = census_block_group_final_dataset$GIS_Join_Match_Code[96490]
example3_air_transport_times <- adams_data[which(adams_data$ï..GIS_Join_Match_Code == example3_GISJOIN), c(12, 34, 56, 78, 100, 122, 144, 23, 45, 67, 89, 111, 133, 155)]
example3_air_transport_times
example3_ground_transport_times <- census_data[which(census_data$GIS.Join.Match.Code == example3_GISJOIN), c(255:261, 284:290)]
example3_ground_transport_times
example3_final_times <- census_block_group_final_dataset[96490, c(254:267)]
example3_final_times
## Compared ground transport, air transport, and final times for all access times and it is correct

## Check one row where ground transport times are NA
example4_GISJOIN = census_block_group_final_dataset$GIS_Join_Match_Code[141]
example4_air_transport_times <- adams_data[which(adams_data$ï..GIS_Join_Match_Code == example4_GISJOIN), c(12, 34, 56, 78, 100, 122, 144, 23, 45, 67, 89, 111, 133, 155)]
example4_air_transport_times
example4_ground_transport_times <- census_data[which(census_data$GIS.Join.Match.Code == example4_GISJOIN), c(255:261, 284:290)]
example4_ground_transport_times
example4_final_times <- census_block_group_final_dataset[141, c(254:267)]
example4_final_times
## Compared ground transport, air transport, and final times for all access times and it is correct
