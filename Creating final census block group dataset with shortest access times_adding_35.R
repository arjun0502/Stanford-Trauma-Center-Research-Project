# Read in files
adams_data <- read.csv("C:/Users/arjun/Downloads/merged_across_years_just_heli_census_hospital.csv", header = T)
census_data <- read.csv("C:/Users/arjun/Downloads/census_block_group_demographic_ground_transport_data.csv", header = T)

# Grab demographic data from census_data 
census_block_group_final_dataset <- census_data[, c(1:246, 305:311)]
colnames(census_block_group_final_dataset)[5] <- "State.Name"
colnames(census_block_group_final_dataset) <-  gsub('\\.', '_', colnames(census_block_group_final_dataset))
colnames(census_block_group_final_dataset)[c(12, 13)] <- c("Urbanicity", "Urban_Percent")
colnames(census_block_group_final_dataset) <- sub("^X", "", colnames(census_block_group_final_dataset))

# Adding additional columns
additional_columns <- c("shortest_access_time_L12_2013",
                        "shortest_access_time_L12_2019",
                        "shortest_access_time_L1234_2013",
                        "shortest_access_time_L1234_2019")

census_block_group_final_dataset[,additional_columns] <- NA

# Checking if GISJOIN codes match up
length(intersect(census_block_group_final_dataset$GIS_Join_Match_Code, adams_data$ï..GIS_Join_Match_Code))
length(intersect(census_block_group_final_dataset$GIS_Join_Match_Code, census_data$GIS.Join.Match.Code))

# Checking indeces of columns with ground/air transport times and all line up in order
colnames(census_data)[c(255, 261, 284, 290)]
colnames(adams_data)[c(12, 144, 23, 155)]
colnames(census_block_group_final_dataset)[254:257]

GISJOIN = "G26003500008004"
# Creating the final dataset
## Looping through GISJOIN codes
for(GISJOIN in census_block_group_final_dataset$GIS_Join_Match_Code) {
  ## Get indices of GISJOIN code in each dataframe (final, census, ADAMS)
  final_index <- which(census_block_group_final_dataset$GIS_Join_Match_Code == GISJOIN)
  census_index <- which(census_data$GIS.Join.Match.Code == GISJOIN)
  adams_index <- which(adams_data$ï..GIS_Join_Match_Code == GISJOIN)
  ## Grab all ground transport times for given GISJOIN code
    ### i.e. Minutes2013_plus_prehosp & X1234_Minutes2013_plus_prehosp
  ground_transport_times <- census_data[census_index, c(255, 261, 284, 290)]
  ## Grab all air transport access times for given GISJOIN code 
    ### i.e. Heli_L12_FlightMinutesPlus21_6_2013 & Heli_L1234_FlightMinutesPlus21_6_2013 
  air_transport_times <- adams_data[adams_index, c(12, 144, 23, 155)]
  ## For all 4 access times (2013 + 2019 for Level I/II and 2013-2019 for Level I/II/III/IV)
     ### If ground transport time is NA, then update final dataset with air transport time 
     ### Else update final dataset with minimum of ground and air transport times 
  for(i in 1:4) {
    if(is.na(ground_transport_times[[i]]) == TRUE) {
      census_block_group_final_dataset[final_index, i + 253] <- (air_transport_times[[i]] + 3.5)
    } else {
      shortest_access_time <- min(ground_transport_times[[i]], air_transport_times[[i]] + 3.5)
      census_block_group_final_dataset[final_index, i + 253] <- shortest_access_time
    }
  }
}

write.csv(census_block_group_final_dataset, "C:/Users/arjun/Downloads/cbg_final_dataset_with_shortest_access_times_heli_35.csv", row.names = F)

saveRDS(census_block_group_final_dataset, "C:/Users/Arjun/Downloads/cbg_final_dataset_with_shortest_access_times_heli_35.rds")

## Row 77
example3_GISJOIN = census_block_group_final_dataset$GIS_Join_Match_Code[77]
example3_air_transport_times <- adams_data[which(adams_data$ï..GIS_Join_Match_Code == example3_GISJOIN), c(12, 144, 23, 155)]
example3_air_transport_times
example3_ground_transport_times <- census_data[which(census_data$GIS.Join.Match.Code == example3_GISJOIN), c(255, 261, 284, 290)]
example3_ground_transport_times
example3_final_times <- census_block_group_final_dataset[77, c(254:257)]
example3_final_times

census_block_group_final_dataset <- readRDS("C:/Users/arjun/Downloads/Updated census block group dataset/cbg_final_dataset_with_shortest_access_times_heli_35.rds")

# total US residents
total_pop_2013 <- sum(census_block_group_final_dataset$Total_Pop_2013)
total_pop_2019 <- sum(census_block_group_final_dataset$Total_Pop_2019)

# 2013 - total US residents with 60-minute access to Level I/II center 
L12_2013_60min <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$shortest_access_time_L12_2013 <= 60), "Total_Pop_2013"])

# 2019 - total US residents with 60-minute access to Level I/II center 
L12_2019_60min <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$shortest_access_time_L12_2019 <= 60), "Total_Pop_2019"])

# 2013 - total US residents with 60-minute access to Level I/II center 
L1234_2013_60min <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$shortest_access_time_L1234_2013 <= 60), "Total_Pop_2013"])

# 2019 - total US residents with 60-minute access to Level I/II center 
L1234_2019_60min <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$shortest_access_time_L1234_2019 <= 60), "Total_Pop_2019"])

# % of US residents with 60-minute access to Level I/II trauma center in 2013
pct_L12_2013 <- (L12_2013_60min/total_pop_2013) * 100

# % of US residents with 60-minute access to Level I/II trauma center in 2019
pct_L12_2019 <- (L12_2019_60min/total_pop_2019) * 100

# % of US residents with 60-minute access to Level I/II/III/IV trauma center in 2013
pct_L1234_2013 <- (L1234_2013_60min/total_pop_2013) * 100

# % of US residents with 60-minute access to Level I/II/III/IV trauma center in 2019
pct_L1234_2019 <- (L1234_2019_60min/total_pop_2019) * 100

states <- c("Northeast", "Connecticut", "Maine", "Massachusetts", "New Hampshire", "New Jersey", "New York",
            "Pennsylvania", "Rhode Island", "Vermont", "Midwest", "Illinois", "Indiana", "Iowa", "Kansas", "Michigan", 
            "Minnesota", "Missouri", "Nebraska", "North Dakota", "Ohio", "South Dakota", "Wisconsin", "South", 
            "Alabama", "Arkansas", "Delaware", "Florida", "Georgia", "Kentucky", "Louisiana", "Maryland", "Mississippi", 
            "North Carolina", "Oklahoma", "South Carolina", "Tennessee", "Texas", "Virginia", "West Virginia", "West", 
            "Alaska", "Arizona", "California", "Colorado", "Hawaii","Idaho", "Montana", "Nevada", "New Mexico", "Oregon", 
            "Utah", "Washington", "Wyoming", "United States, total")


state_access <- data.frame(states)
additional_columns <- c("shortest_access_time_L12_2013",
                        "shortest_access_time_L12_2019",
                        "absolute_difference_L12",
                        "shortest_access_time_L1234_2013",
                        "shortest_access_time_L1234_2019", 
                        "absolute_difference_L1234")

state_access[,additional_columns] <- NA


for (state in states) {
  L12_2013_60min <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$State_Name == state & census_block_group_final_dataset$shortest_access_time_L12_2013 <= 60), "Total_Pop_2013"])
  L1234_2013_60min <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$State_Name == state & census_block_group_final_dataset$shortest_access_time_L1234_2013 <= 60), "Total_Pop_2013"])
  total_state_pop_2013 <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$State_Name == state), "Total_Pop_2013"])
  
  L12_2019_60min <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$State_Name == state & census_block_group_final_dataset$shortest_access_time_L12_2019 <= 60), "Total_Pop_2019"])
  L1234_2019_60min <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$State_Name == state & census_block_group_final_dataset$shortest_access_time_L1234_2019 <= 60), "Total_Pop_2019"])
  total_state_pop_2019 <- sum(census_block_group_final_dataset[which(census_block_group_final_dataset$State_Name == state), "Total_Pop_2019"])
  
  index <- which(state_access$states == state)
  state_access$shortest_access_time_L12_2013[index] <- round(((L12_2013_60min/total_state_pop_2013) * 100), 1)
  state_access$shortest_access_time_L1234_2013[index] <- round(((L1234_2013_60min/total_state_pop_2013) * 100), 1)
  state_access$shortest_access_time_L12_2019[index] <- round(((L12_2019_60min/total_state_pop_2019) * 100), 1)
  state_access$shortest_access_time_L1234_2019[index] <- round(((L1234_2019_60min/total_state_pop_2019) * 100), 1)
}

state_access$shortest_access_time_L12_2013[55] <- round(pct_L12_2013, 1)
state_access$shortest_access_time_L1234_2013[55] <- round(pct_L1234_2013, 1)
state_access$shortest_access_time_L12_2019[55] <- round(pct_L12_2019, 1)
state_access$shortest_access_time_L1234_2019[55] <- round(pct_L1234_2019, 1)

state_access$absolute_difference_L12 <- state_access$shortest_access_time_L12_2019 - state_access$shortest_access_time_L12_2013
state_access$absolute_difference_L1234 <- state_access$shortest_access_time_L1234_2019 - state_access$shortest_access_time_L1234_2013

state_access[is.na(state_access)] <- ""

write.csv(state_access,"C:/Users/arjun/Downloads/state_access_revised.csv", row.names = TRUE)
