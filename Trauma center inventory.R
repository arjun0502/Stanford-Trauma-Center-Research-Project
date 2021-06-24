library(xlsx)
TIEP_combined <- read.xlsx(file = "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_combined_revised.xlsx", sheetName = "Sheet1", header = T)
TIEP_combined <- TIEP_combined[, -43]
library(USAboundaries)
state_name_abbr <- state_codes[, c(1:2)]
state_name_abbr <- state_name_abbr[c(1:51), ]
state_name_abbr <- state_name_abbr[-9, ]

library(tibble)
library(dplyr)
TIEP_combined <- TIEP_combined %>% add_column(State_Name = NA, .after = "State")

for (state_abbr in state_name_abbr$state_abbr) {
  row <- which(state_name_abbr$state_abbr == state_abbr)
  TIEP_combined["State_Name"][TIEP_combined["State"] == state_abbr] <- state_name_abbr$state_name[row]
}

TIEP_combined_2013 <- TIEP_combined[which(TIEP_combined$In_2013_Sheet == "yes"), ]
TIEP_combined_2013_ACS_1_2 <- TIEP_combined_2013[which(TIEP_combined_2013$ACS_Ver_2013 == "1" | TIEP_combined_2013$ACS_Ver_2013 == "2"), ]
TIEP_combined_2013_State_1_2 <- TIEP_combined_2013[which(TIEP_combined_2013$State_Des_2013 == "1" | TIEP_combined_2013$State_Des_2013 == "2"), ]

TIEP_combined_2019 <- TIEP_combined[which(TIEP_combined$In_2019_Sheet == "yes"), ]
TIEP_combined_2019_ACS_1_2 <- TIEP_combined_2019[which(TIEP_combined_2019$ACS_Ver_2019 == "1" | TIEP_combined_2019$ACS_Ver_2019 == "2"), ]
TIEP_combined_2019_State_1_2 <- TIEP_combined_2019[which(TIEP_combined_2019$State_Des_2019 == "1" | TIEP_combined_2019$State_Des_2019 == "2"), ]

trauma_center_inventory_table <- data.frame(matrix(ncol = 4, nrow = 54))
colnames(trauma_center_inventory_table) <- c("Total ACS-verified Level I and II centers - 2013", "Total State-verified Level I and II centers - 2013", "Total ACS-verified Level I and II centers - 2019", "Total State-verified Level I and II centers - 2019")

rownames(trauma_center_inventory_table) <- c("Northeast", "Connecticut", "Maine", "Massachusetts", "New Hampshire", "New Jersey", "New York", "Pennsylvania", "Rhode Island", "Vermont", 
                                             "Midwest", "Illinois", "Indiana", "Iowa", "Kansas", "Michigan", "Minnesota", "Missouri", "Nebraska", "North Dakota", "Ohio", "South Dakota", "Wisconsin", 
                                             "South", "Alabama", "Arkansas", "Delaware", "Florida", "Georgia", "Kentucky", "Louisiana", "Maryland", "Mississippi", "North Carolina", "Oklahoma", "South Carolina", "Tennessee", "Texas", "Virginia", "West Virginia",
                                             "West", "Alaska", "Arizona", "California", "Colorado", "Hawaii", "Idaho", "Montana", "Nevada", "New Mexico", "Oregon", "Utah", "Washington", "Wyoming")


for (state in state_name_abbr$state_name) {
  total_ACS_2013 <- length(which(TIEP_combined_2013_ACS_1_2$State_Name == state))
  total_ACS_2019 <- length(which(TIEP_combined_2019_ACS_1_2$State_Name == state))
  total_State_2013 <- length(which(TIEP_combined_2013_State_1_2$State_Name == state))
  total_State_2019 <- length(which(TIEP_combined_2019_State_1_2$State_Name == state))
  trauma_center_inventory_table[state, 1] <- total_ACS_2013
  trauma_center_inventory_table[state, 2] <- total_State_2013
  trauma_center_inventory_table[state, 3] <- total_ACS_2019
  trauma_center_inventory_table[state, 4] <- total_State_2019
}

saveRDS(trauma_center_inventory_table, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Trauma Center Inventory/trauma_center_inventory_table.rds")

write.xlsx(trauma_center_inventory_table, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Trauma Center Inventory/trauma_center_inventory_table.xlsx", col.names = T, row.names = T, showNA = F)
################################################################################################################################
library(xlsx)
TIEP_combined <- read.xlsx(file = "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/TIEP_Address_Data/TIEP_combined_revised.xlsx", sheetName = "Sheet1", header = T)
TIEP_combined <- TIEP_combined[, -43]
library(USAboundaries)
state_name_abbr <- state_codes[, c(1:2)]
state_name_abbr <- state_name_abbr[c(1:51), ]
state_name_abbr <- state_name_abbr[-9, ]

library(tibble)
library(dplyr)
TIEP_combined <- TIEP_combined %>% add_column(State_Name = NA, .after = "State")

for (state_abbr in state_name_abbr$state_abbr) {
  row <- which(state_name_abbr$state_abbr == state_abbr)
  TIEP_combined["State_Name"][TIEP_combined["State"] == state_abbr] <- state_name_abbr$state_name[row]
}

TIEP_combined_2013 <- TIEP_combined[which(TIEP_combined$In_2013_Sheet == "yes"), ]
TIEP_combined_2013_ACS_3_4 <- TIEP_combined_2013[which(TIEP_combined_2013$ACS_Ver_2013 == "3" | TIEP_combined_2013$ACS_Ver_2013 == "4"), ]

TIEP_combined_2019 <- TIEP_combined[which(TIEP_combined$In_2019_Sheet == "yes"), ]
TIEP_combined_2019_ACS_3_4 <- TIEP_combined_2019[which(TIEP_combined_2019$ACS_Ver_2019 == "3" | TIEP_combined_2019$ACS_Ver_2019 == "4"), ]

trauma_center_inventory_table <- data.frame(matrix(ncol = 2, nrow = 54))
colnames(trauma_center_inventory_table) <- c("Total ACS-verified Level III and IV centers - 2013", "Total ACS-verified Level III and IV centers - 2019")

rownames(trauma_center_inventory_table) <- c("Northeast", "Connecticut", "Maine", "Massachusetts", "New Hampshire", "New Jersey", "New York", "Pennsylvania", "Rhode Island", "Vermont", 
                                             "Midwest", "Illinois", "Indiana", "Iowa", "Kansas", "Michigan", "Minnesota", "Missouri", "Nebraska", "North Dakota", "Ohio", "South Dakota", "Wisconsin", 
                                             "South", "Alabama", "Arkansas", "Delaware", "Florida", "Georgia", "Kentucky", "Louisiana", "Maryland", "Mississippi", "North Carolina", "Oklahoma", "South Carolina", "Tennessee", "Texas", "Virginia", "West Virginia",
                                             "West", "Alaska", "Arizona", "California", "Colorado", "Hawaii", "Idaho", "Montana", "Nevada", "New Mexico", "Oregon", "Utah", "Washington", "Wyoming")


for (state in state_name_abbr$state_name) {
  total_ACS_2013 <- length(which(TIEP_combined_2013_ACS_3_4$State_Name == state))
  total_ACS_2019 <- length(which(TIEP_combined_2019_ACS_3_4$State_Name == state))
  trauma_center_inventory_table[state, 1] <- total_ACS_2013
  trauma_center_inventory_table[state, 2] <- total_ACS_2019
}

saveRDS(trauma_center_inventory_table, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Trauma Center Inventory/trauma_center_inventory_table_ACS_III_IV.rds")

write.xlsx(trauma_center_inventory_table, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Trauma Center Inventory/trauma_center_inventory_table_ACS_III_IV.xlsx", col.names = T, row.names = T, showNA = F)

