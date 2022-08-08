# Arjun Jain
# Stanford Trauma Center Research Project
# Creating manuscript figures


# CREATING DATASET TO PLOT 

# loading required packages
library(ggplot2)      
library(tidycensus)  
library(dplyr)        
library(sf)        
library(tigris)
options(tigris_use_cache = TRUE)

census_api_key("5917c9cd54a81df78628d2684e0ab0bbeaba281c", install = TRUE, overwrite = TRUE)
Sys.getenv("CENSUS_API_KEY")


# Setting path for loading and saving files 
path = "C:/Users/arjun/OneDrive/Documents/Gap Year/Trauma Center Stanford Research Project/Creating manuscript figure/"

# Retrieving dataset containing county geography
county_geography <- get_acs("county", variable = "B01003_001E", output = "tidy", geometry = TRUE) %>% select(-moe)

# Removing Puerto Rico rows
county_geography <- county_geography[!grepl("Puerto Rico", county_geography$NAME),]

# Shifting and rescaling dataset for mapping of Alaska and Hawaii
county_geography <- shift_geometry(county_geography, position = "below")

# Changing variable column to "shortest_access_time_2019" 
county_geography$variable = "shortest_access_time_2019"

# Retrieving dataset containing shortest access times for all U.S. census block groups
block_group_data <- readRDS(paste(path,"census_block_group_final_dataset_with_shortest_access_times.rds", sep = ""))

# Average 2019 shortest access times to Level I/II and Level I-IV trauma centers by county
# Create two new datasets containing these average access times by county
shortest_access_time_L12_county <- aggregate(shortest_access_time_L12_2019~State_Name+County_Name, data=block_group_data, FUN="mean") 
shortest_access_time_L1234_county <- aggregate(shortest_access_time_L1234_2019~State_Name+County_Name, data=block_group_data, FUN="mean") 

# Create new column in both access time datasets which combines county and state
shortest_access_time_L12_county$County_State <- paste(shortest_access_time_L12_county$County_Name, 
                                                      shortest_access_time_L12_county$State_Name,
                                                      sep = ", ")

shortest_access_time_L1234_county$County_State <- paste(shortest_access_time_L1234_county$County_Name, 
                                                      shortest_access_time_L1234_county$State_Name,
                                                      sep = ", ")

# Make sure area names are the same between shortest access datasets and county geography dataset
length(intersect(shortest_access_time_L12_county$County_State, county_geography$NAME))
length(intersect(shortest_access_time_L1234_county$County_State, county_geography$NAME))
setdiff(shortest_access_time_L12_county$County_State, county_geography$NAME)

# Make change to one that is different due to special symbol
# Doña Ana County, New Mexico

shortest_access_time_L12_county$County_State[793] = "Doña Ana County, New Mexico"
shortest_access_time_L1234_county$County_State[793] = "Doña Ana County, New Mexico"
length(intersect(shortest_access_time_L12_county$County_State, county_geography$NAME))

# Removing state and county columns from shortest access datasets
shortest_access_time_L12_county <- shortest_access_time_L12_county[, -c(1:2)]
shortest_access_time_L1234_county <- shortest_access_time_L1234_county[, -c(1:2)]

# Renaming state and county columns in shortest access datasets to match county geography dataset
colnames(shortest_access_time_L12_county)[2] = "NAME"
colnames(shortest_access_time_L1234_county)[2] = "NAME"

# Merging shortest access time data with county geography data
merged <- merge(county_geography, shortest_access_time_L12_county, by = "NAME")
merged <- merge(merged, shortest_access_time_L1234_county, by = "NAME")

# Removing estimate column from merged dataset
merged <- merged[, -c(4)]

# Renaming shortest access time columns
colnames(merged)[4] <- "Level_I_II"
colnames(merged)[5] <- "Level_I_II_III_IV"

# Rearranging columns
merged <- merged[, c(2, 1, 3, 4, 5, 6)]

# Saving final data set for plotting
saveRDS(merged, paste(path,"manuscript_figures_dataset.rds", sep = ""))

#########################################################################################################################################

# CREATING MANUSCRIPT FIGURES

# loading required packages
library(ggplot2)      
library(tidycensus)  
library(dplyr)        
library(sf)        
library(tigris)
options(tigris_use_cache = TRUE)

# Setting path for loading and saving files 
path = "C:/Users/arjun/OneDrive/Documents/Gap Year/Trauma Center Stanford Research Project/Creating manuscript figure/"

# reading in dataset to plot
manuscript_figures_dataset <- readRDS(paste(path,"manuscript_figures_dataset.rds", sep = ""))

# Plotting Level I-II data
ggplot(manuscript_figures_dataset, aes(fill = cut(Level_I_II, breaks = c(0, 30, 60, Inf)))) + # fill based on value
  geom_sf() +
  scale_fill_manual(name = "Shortest access times (minutes)",    
                    values = c("darkseagreen", "burlywood1", "darkred"),      # colors matching other figure
                    limits = c('(0,30]', '(30,60]', '(60,Inf]'), 
                    labels = c("0-30", "30-60", ">60")) +
  labs(title = "Time to Level I/II Trauma Centers, 2019") +
  theme_void()

# Plotting Level I-IV data
ggplot(manuscript_figures_dataset, aes(fill = cut(Level_I_II_III_IV, breaks = c(0, 30, 60, Inf))), color = "black") + # fill based on value
  geom_sf() +
  scale_fill_manual(name = "Shortest access times (minutes)",    
                    values = c("darkseagreen", "burlywood1", "darkred"),      # colors matching other figure
                    limits = c('(0,30]', '(30,60]', '(60,Inf]'), 
                    labels = c("0-30", "30-60", ">60")) +
  labs(title = "Time to Level I-IV Trauma Centers, 2019") +
  theme_void()




