# Arjun Jain
# 5/26/2021
# Adding urban-rural designations to demo.csv file


# Loading demo.csv and urban_rural_designations files as dataframes

demo <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/Adding urban-rural designations to demo.csv file/demo.csv")
demo <- demo[, -1]
urban_rural_designations_original <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/Adding urban-rural designations to demo.csv file/census-block-group-urban-rural-designations.csv")

# Making descriptive header the column names and removing current column names in 'urban_rural_designations_original' dataframe

colnames(urban_rural_designations_original) <- urban_rural_designations_original[1, ]
urban_rural_designations_original <- urban_rural_designations_original[-1, ]
rownames(urban_rural_designations_original) <- NULL

# Making copy of 'urban_rural_designations' dataframe for altering

urban_rural_designations_altered <- urban_rural_designations_original

# Reformatting Census Tract codes in 'urban_rural_designations_altered' dataframe so that matches Census Tract codes in 'demo' dataframe 
  ## Adding two trailing zeroes to all Census Tract codes that do not have a decimal
  ## If have decimal, check how many digits after decimal
      ### If one digit after decimal, then remove decimal and add trailing zero otherwise just remove decimal 

for (row in 1:nrow(urban_rural_designations_altered)) {
  census_tract_original <- urban_rural_designations_altered$Tract[row]
  if (grepl("\\.", census_tract_original) == FALSE) {
    census_tract_with_zeroes <- paste(census_tract_original, "00", sep = "")
    urban_rural_designations_altered$Tract[row] <- census_tract_with_zeroes
  } else {
    num_digits_after_decimal <- nchar(strsplit(census_tract_original, "\\.")[[1]][2])
    census_tract_no_decimal <- gsub("\\.", "", census_tract_original)
    if (num_digits_after_decimal == 1) {
      census_tract_no_decimal_with_zero <- paste(census_tract_no_decimal, "0", sep = "")
      urban_rural_designations_altered$Tract[row] <- census_tract_no_decimal_with_zero
    } else {
      urban_rural_designations_altered$Tract[row] <- census_tract_no_decimal
    }
  }
}

# Checking if Census Tract codes match up between 'urban_rural_designations_altered' dataframe and 'demo' dataframe

## Doing this by combing Census Tract code and State Abbreviation in both dataframes and then comparing these unique IDs
## Comparing Census Tract and State together because the same Census Tract codes exists for multiple states

library(tibble)

urban_rural_designations_altered <- add_column(urban_rural_designations_altered, State = NA, .after = "County name")

for (row in 1:nrow(urban_rural_designations_altered)) {
  state <- tail(strsplit(urban_rural_designations_altered$`County name`[row], split = " ")[[1]], 1)
  urban_rural_designations_altered$State[row] <- state
}

urban_rural_designations_altered$State[c(4750:4753, 4872:4875, 4977:4990)] <- "AK"
urban_rural_designations_altered$State[c(208338:208349)] <- "SD"
urban_rural_designations_altered$State[c(239337:239346)] <- "VA"
urban_rural_designations_altered$State[c(235442:235499)] <- "VA"
urban_rural_designations_altered$State[5008] <- "AK"
urban_rural_designations_altered$State[c(5026:5030)] <- "AK"

states <- unique(urban_rural_designations_altered$State)

library(tidyr)
urban_rural_designations_altered <- unite(urban_rural_designations_altered, Tract_State_before_corrections, c(Tract, State), remove=FALSE)
demo <- unite(demo, Tract_State, c(Census.Tract.Code, State.Postal.Abbreviation), remove=FALSE)

not_matching_codes <- urban_rural_designations_altered$Tract_State_before_corrections[!urban_rural_designations_altered$Tract_State_before_corrections %in% demo$Tract_State]

# Making corrections to incorrect Census Tract codes based on 2010 Census Geography Notes

## Census Tract 27.01 (002701) name and code should be 27.04 (002704)

urban_rural_designations_altered[c(8556, 8557), "Tract"] <- "2704"

## Census Tract 29.03 (002903) name and code should be 29.06 (002906)

urban_rural_designations_altered[c(8576), "Tract"] <- "2906"

## Census Tract 4105.01 (410501) name and code should be 41.18 (004118)

urban_rural_designations_altered[c(9095, 9096), "Tract"] <- "4118"

## Census Tract 4105.02 (410502) name and code should be 41.21 (004121)

urban_rural_designations_altered[c(9097, 9098), "Tract"] <- "4121"

## Census Tract 4105.03 (410503) name and code should be 41.25 (004125)

urban_rural_designations_altered[c(9099, 9100), "Tract"] <- "4125"

## Census Tract 4704 (470400) name and code should be 52 (005200)

urban_rural_designations_altered[c(9101:9106), "Tract"] <- "5200"

## Census Tract 4705 (470500) name and code should be 53 (005300)

urban_rural_designations_altered[c(9107:9110), "Tract"] <- "5300"

## Census Tract 9304.01 and Block Group 1 should not be shown for the 2010 Census; the entire area should be coded to Census Tract 1370 (137000)
## ...with Blocks 1006, 1013, 1014, 1015, and 1018 assigned to Census Tract 1370, Block Group 2 and the remaining blocks assigned to Block Group 1.

urban_rural_designations_altered[23054, "Tract"] <- "137000"

## Census Tract 9401.01 (940101) name and code should be 301.01 (030101)

urban_rural_designations_altered[c(154463, 154464), "Tract"] <- "30101"

## Census Tract 9401.02 (940102) name and code should be 301.02 (030102)

urban_rural_designations_altered[c(154465:154468), "Tract"] <- "30102"

## Census Tract 9401.03 (940103) name and code should be 301.03 (030103)

urban_rural_designations_altered[c(154469:154474), "Tract"] <- "30103"

## Census Tract 9404.01 (940401) name and code should be 304.01 (030401)

urban_rural_designations_altered[c(154489:154497), "Tract"] <- "30401"

## Census Tract 9404.03 (940403) name and code should be 304.03 (030403)

urban_rural_designations_altered[c(154498:154503), "Tract"] <- "30403"

## Census Tract 9406 (940600) name and code should be 306.00 (030600).

urban_rural_designations_altered[c(154504:154509), "Tract"] <- "30600"

## Census Tract 9407 (940700) name and code should be 304.02 (030402).

urban_rural_designations_altered[c(154510:154512), "Tract"] <- "30402"

urban_rural_designations_altered <- unite(urban_rural_designations_altered, Tract_State_after_corrections, c(Tract, State), remove=FALSE)

## Checking again to make sure Census Tract codes all match up 
not_matching_codes <- urban_rural_designations_altered$Tract_State_after_corrections[!urban_rural_designations_altered$Tract_State_after_corrections %in% demo$Tract_State]

## Remove the Tract_State columns
urban_rural_designations_altered <- urban_rural_designations_altered[, -c(2,3)] 
demo <- demo[, -4] 


# Changing column names in 'urban_rural_designations_altered' dataframe to be more descriptive and saving as RDS object

colnames(urban_rural_designations_altered) <- c("State_County_code", "Census_Tract_code", "Block_Group_code", "Urban/Rural", "County_name_State_abbreviation", "State", "Population_2010", "bg to ur allocation factor")
saveRDS(urban_rural_designations_altered, "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/Adding urban-rural designations to demo.csv file/urban_rural_designations_altered.rds")

# Checking if Census Geographic ID is unique for each block group in demo.csv

nrow(demo) == length(unique(demo$Census.Geographic.Identifier))

# Replicating Census Geographic IDs for each block group in 'urban_rural_designations_altered' dataframe

library(stringr)
library(tibble)
library(stringi)

urban_rural_designations_altered <- add_column(urban_rural_designations_altered, Census.Geographic.Identifier = NA, .after = "County_name_State_abbreviation")

for (row in 1:nrow(urban_rural_designations_altered)) {
  state_county_code <- as.character(urban_rural_designations_altered$State_County_code[row])
  state_county_code_revised <- str_pad(state_county_code, 5, pad = "0")
  census_tract_code <- as.character(urban_rural_designations_altered$Census_Tract_code[row])
  block_group_code <- as.character(urban_rural_designations_altered$Block_Group_code[row])
  num_zeroes_to_add <- 7 - nchar(census_tract_code) - nchar(block_group_code)
  census_geographic_identifier <- paste("15000US", state_county_code_revised, stri_dup("0", num_zeroes_to_add), census_tract_code, block_group_code, sep = "")
  urban_rural_designations_altered[row, "Census.Geographic.Identifier"] <- census_geographic_identifier
}


## Checking which Census Geographic IDs are wrong in 'urban_rural_designations_altered' dataframe

not_matching_IDs <- urban_rural_designations_altered$Census.Geographic.Identifier[!urban_rural_designations_altered$Census.Geographic.Identifier %in% demo$Census.Geographic.Identifier]


# Making corrections to not matching Census Geographic IDs in 'urban_rural_designations_altered' dataframe based on 2010 Census Geography Notes

## Census Tract 1370, Block Group 2 should include: Census Tract 8002.04, Blocks 3000-3029 (all of Block Group 3).

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US060378002043"), 2] <- "137000"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US060378002043"), 3] <- "2"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US060378002043"), 6] <- "15000US060371370002"

## Census Tract 9402 (940200) name and code should be 302 (030200)

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539402001"), 2] <- "30200"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539402002"), 2] <- "30200"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539402003"), 2] <- "30200"

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539402001"), 6] <- "15000US360530302001"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539402002"), 6] <- "15000US360530302002"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539402003"), 6] <- "15000US360530302003"

## Census Tract 9403 (940300) name and code should be 303 (030300)

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539403001"), 2] <- "30300"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539403002"), 2] <- "30300"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539403003"), 2] <- "30300"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539403004"), 2] <- "30300"

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539403001"), 6] <- "15000US360530303001"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539403002"), 6] <- "15000US360530303002"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539403003"), 6] <- "15000US360530303003"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360539403004"), 6] <- "15000US360530303004"

## Census Tract 9400 (940000) name and code should be 248 (024800)

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659400001"), 2] <- "24800"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659400002"), 2] <- "24800"

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659400001"), 6] <- "15000US360650248001"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659400002"), 6] <- "15000US360650248002"

## Census Tract 9401 (940100) name and code should be 247 (024700)

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659401001"), 2] <- "24700"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659401002"), 2] <- "24700"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659401003"), 2] <- "24700"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659401004"), 2] <- "24700"

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659401001"), 6] <- "15000US360650247001"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659401002"), 6] <- "15000US360650247002"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659401003"), 6] <- "15000US360650247003"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659401004"), 6] <- "15000US360650247004"

## Census Tract 9402 name and code should be 249 (024900)

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659402001"), 2] <- "24900"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659402002"), 2] <- "24900"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659402003"), 2] <- "24900"

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659402001"), 6] <- "15000US360650249001"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659402002"), 6] <- "15000US360650249002"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US360659402003"), 6] <- "15000US360650249003"

## Bedford City became incorporated into Bedford County

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501001"), 1] <- "51019"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501002"), 1] <- "51019"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501003"), 1] <- "51019"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501004"), 1] <- "51019"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501005"), 1] <- "51019"

urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501001"), 6] <- "15000US510190501001"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501002"), 6] <- "15000US510190501002"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501003"), 6] <- "15000US510190501003"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501004"), 6] <- "15000US510190501004"
urban_rural_designations_altered[which(urban_rural_designations_altered$Census.Geographic.Identifier == "15000US515150501005"), 6] <- "15000US510190501005"

## not_matching_IDs should now be empty 
not_matching_IDs <- urban_rural_designations_altered$Census.Geographic.Identifier[!urban_rural_designations_altered$Census.Geographic.Identifier %in% demo$Census.Geographic.Identifier]

## saving 'urban_rural_designations_altered' dataframe as RDS object now that it has IDs
saveRDS(urban_rural_designations_altered, "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/Adding urban-rural designations to demo.csv file/urban_rural_designations_with_IDs.rds")


# Adding empty urbanicity and urban_percent columns to demo dataframe 

library(tibble)
demo <- add_column(demo, urbanicity = NA, .after = "Area.Name")
demo <- add_column(demo, urban_percent = NA, .after = "urbanicity")

# Splitting urban_rural_designations dataframe into two dataframes
## One dataframe has block groups that are fully urban or fully rural
## Second dataframe has block groups that are mixed urban and rural

urban_rural_designations_altered <- readRDS("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/Adding urban-rural designations to demo.csv file/urban_rural_designations_with_IDs.rds")
fully_urban_or_rural_bgs <- urban_rural_designations_altered[which(urban_rural_designations_altered$`bg to ur allocation factor` == 1), ]
mixed_urban_rural_bgs <- urban_rural_designations_altered[which(urban_rural_designations_altered$`bg to ur allocation factor` != 1), ]

# Filling in 'urbanicity' and urban_percent columns for block groups that are fully urban and rural 
## Matching census block groups based on Census.Geographic.Identifier

for (row in 1:nrow(fully_urban_or_rural_bgs)) {
  if (fully_urban_or_rural_bgs[row, "Urban/Rural"] == "R") {
    urbanicity <- "rural"
    urban_percent <- 0
  } else {
    urbanicity <- "urban"
    urban_percent <- 1
  }
  census_geographic_id <- fully_urban_or_rural_bgs[row, "Census.Geographic.Identifier"]
  demo_row <- which(demo$Census.Geographic.Identifier == census_geographic_id)
  demo[demo_row, "urbanicity"] <- urbanicity
  demo[demo_row, "urban_percent"] <- urban_percent
}

# Filling in 'urbanicity' and urban_percent columns for block groups that are mixed urban and rural 
## Matching census block groups based on Census.Geographic.Identifier

rm(row)

for (census_geographic_ID in unique(mixed_urban_rural_bgs$Census.Geographic.Identifier)) {
  matching_rows <- which(mixed_urban_rural_bgs$Census.Geographic.Identifier == census_geographic_ID)
  for (row in matching_rows) {
    if (mixed_urban_rural_bgs[row, "Urban/Rural"] == "U") {
      urban_percent <- mixed_urban_rural_bgs[row, "bg to ur allocation factor"]
    }
  }
  demo_row <- which(demo$Census.Geographic.Identifier == census_geographic_ID)
  demo[demo_row, "urbanicity"] <- "rural_urban_mix"
  demo[demo_row, "urban_percent"] <- urban_percent
}

saveRDS(demo, "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/Adding urban-rural designations to demo.csv file/demo_with_urbanicity_and_urban_percent.rds")

# Writing 'demo' dataframe to csv file 

write.csv(demo, "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/Adding urban-rural designations to demo.csv file/demo_with_urbanicity_and_urban_percent.csv", row.names = F)
