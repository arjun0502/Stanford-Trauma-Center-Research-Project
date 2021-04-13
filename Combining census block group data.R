# Loading demographic data

demographic_2013 <- read.csv("~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0005_csv/nhgis0005_ds201_20135_2013_blck_grp_E.csv")
demographic_2014 <- read.csv("~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0005_csv/nhgis0005_ds206_20145_2014_blck_grp_E.csv")
demographic_2015 <- read.csv("~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0005_csv/nhgis0005_ds215_20155_2015_blck_grp_E.csv")
demographic_2016 <- read.csv("~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0005_csv/nhgis0005_ds225_20165_2016_blck_grp_E.csv")
demographic_2017 <- read.csv("~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0005_csv/nhgis0005_ds233_20175_2017_blck_grp_E.csv")
demographic_2018 <- read.csv("~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0005_csv/nhgis0005_ds239_20185_2018_blck_grp_E.csv")
demographic_2019 <- read.csv("~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0005_csv/nhgis0005_ds244_20195_2019_blck_grp_E.csv")

# Removing unwanted columns

demographic_2013 <- subset(demographic_2013, select = -c(3,4,9,10,13:34, 36:37, 40:62, 64:86, 88:91, 97:100))
demographic_2014 <- subset(demographic_2014, select = -c(3,4,9,10,13:34, 36:37, 40:62, 64:86, 88:91, 97:100))
demographic_2015 <- subset(demographic_2015, select = -c(3,4,9,10,13:34, 36:37, 40:62, 64:86, 88:91, 97:100))
demographic_2016 <- subset(demographic_2016, select = -c(3,4,9,10,13:34, 36:37, 40:62, 64:86, 88:91, 97:100))
demographic_2017 <- subset(demographic_2017, select = -c(3,4,9,10,13:34, 36:37, 40:62, 64:86, 88:91, 97:100))
demographic_2018 <- subset(demographic_2018, select = -c(3,4,9,10,13:34, 36:37, 40:62, 64:86, 88:91, 97:100))
demographic_2019 <- subset(demographic_2019, select = -c(4,5,10,11, 14:39, 42, 43, 46:68, 70:92, 94:97, 103:106))

# Using 'Area.Name' as unique identifier 

nrow(demographic_2013) == length(unique(demographic_2013$Area.Name))
nrow(demographic_2014) == length(unique(demographic_2014$Area.Name))
nrow(demographic_2015) == length(unique(demographic_2015$Area.Name))
nrow(demographic_2016) == length(unique(demographic_2016$Area.Name))
nrow(demographic_2017) == length(unique(demographic_2017$Area.Name))
nrow(demographic_2018) == length(unique(demographic_2018$Area.Name))
nrow(demographic_2019) == length(unique(demographic_2019$Area.Name))

# Checking which unique identifiers don't match up and making necessary changes so matches
# Either codes have extra zero or county name changed

print(setdiff(demographic_2013$Area.Name, demographic_2014$Area.Name))

## Changing Petersburg Census Area, Alaska in demographic_2013 to Petersburg Borough, Alaska

demographic_2013[3912:3915, "Area.Name"] <- demographic_2014[3912:3915, "Area.Name"]

## Changing Bedford city, Virginia to Bedford County, Virginia

demographic_2013[204765:204769, "Area.Name"] <- demographic_2014[201571:201575, "Area.Name"]

print(setdiff(demographic_2013$Area.Name, demographic_2015$Area.Name))

## Changing Shannon County, South Dakota in demographic_2013 & demographic_2014 to Oglala Lakota County, South Dakota

demographic_2013[178910:178918, "Area.Name"] <- demographic_2019[178823:178831, "Area.Name"]
demographic_2014[178910:178918, "Area.Name"] <- demographic_2019[178823:178831, "Area.Name"]

## Changing Wade Hampton Census Area, Alaska in demographic_2013 & demographic_2014 to Kusilvak Census Area, Alaska

demographic_2013[3955:3958, "Area.Name"] <- demographic_2019[3836:3839, "Area.Name"]
demographic_2014[3955:3958, "Area.Name"] <- demographic_2019[3836:3839, "Area.Name"]

print(setdiff(demographic_2013$Area.Name, demographic_2016$Area.Name))
print(setdiff(demographic_2013$Area.Name, demographic_2017$Area.Name))
print(setdiff(demographic_2013$Area.Name, demographic_2018$Area.Name))

print(setdiff(demographic_2013$Area.Name, demographic_2019$Area.Name))

## Changing ..Census Tract 133.1, San Diego County, California to ..Census Tract 133.10, San Diego County, California in demographic_2019 so matches with other years

demographic_2019[27229:27230, "Area.Name"] <- demographic_2013[27229:27230, "Area.Name"]

## Changing ....Census Tract 156.00, Polk County, Florida to ....Census Tract 156, Polk County, Florida in demographic_2019

demographic_2019[50761:50763, "Area.Name"] <- demographic_2018[50761:50763, "Area.Name"]

## Changing ...Census Tract 11.00, Flathead County, Montana to ...Census Tract 11, Flathead County, Montana

demographic_2019[114903:114907, "Area.Name"] <- demographic_2018[114903:114907, "Area.Name"]

## Changing ....Census Tract 34.00, Allen County, Indiana to ...Census Tract 34, Allen County, Indiana

demographic_2019[69264:69268, "Area.Name"] <- demographic_2018[69264:69268, "Area.Name"]

## Changing ....Census Tract 807.00, Sevier County, Tennessee to ...Census Tract 807, Sevier County, Tennessee

demographic_2019[181862:181865, "Area.Name"] <- demographic_2018[181862:181865, "Area.Name"]

## Changing ....Census Tract 511.00, Williamson County, Tennessee to ...Census Tract 511, Williamson County, Tennessee

demographic_2019[183040:183042, "Area.Name"] <- demographic_2018[183040:183042, "Area.Name"]

## Validating that Area Names match up across years

print(setdiff(demographic_2013$Area.Name, demographic_2014$Area.Name))
print(setdiff(demographic_2013$Area.Name, demographic_2015$Area.Name))
print(setdiff(demographic_2013$Area.Name, demographic_2016$Area.Name))
print(setdiff(demographic_2013$Area.Name, demographic_2017$Area.Name))
print(setdiff(demographic_2013$Area.Name, demographic_2018$Area.Name))
print(setdiff(demographic_2013$Area.Name, demographic_2019$Area.Name))
print(setdiff(demographic_2014$Area.Name, demographic_2015$Area.Name))
print(setdiff(demographic_2014$Area.Name, demographic_2016$Area.Name))
print(setdiff(demographic_2014$Area.Name, demographic_2017$Area.Name))
print(setdiff(demographic_2014$Area.Name, demographic_2018$Area.Name))
print(setdiff(demographic_2014$Area.Name, demographic_2019$Area.Name))
print(setdiff(demographic_2015$Area.Name, demographic_2016$Area.Name))
print(setdiff(demographic_2015$Area.Name, demographic_2017$Area.Name))
print(setdiff(demographic_2015$Area.Name, demographic_2018$Area.Name))
print(setdiff(demographic_2015$Area.Name, demographic_2019$Area.Name))
print(setdiff(demographic_2016$Area.Name, demographic_2017$Area.Name))
print(setdiff(demographic_2016$Area.Name, demographic_2018$Area.Name))
print(setdiff(demographic_2016$Area.Name, demographic_2019$Area.Name))
print(setdiff(demographic_2017$Area.Name, demographic_2018$Area.Name))
print(setdiff(demographic_2017$Area.Name, demographic_2019$Area.Name))
print(setdiff(demographic_2018$Area.Name, demographic_2019$Area.Name))

# Creating dataframe for combined demographic data

combined_demographic <- demographic_2019[, 1:11]

combined_demographic$Total_Pop_2013 <- 0
combined_demographic$Total_Pop_2014 <- 0
combined_demographic$Total_Pop_2015 <- 0
combined_demographic$Total_Pop_2016 <- 0
combined_demographic$Total_Pop_2017 <- 0
combined_demographic$Total_Pop_2018 <- 0
combined_demographic$Total_Pop_2019 <- 0

combined_demographic$Total_Male_2013 <- 0
combined_demographic$Total_Male_2014 <- 0
combined_demographic$Total_Male_2015 <- 0
combined_demographic$Total_Male_2016 <- 0
combined_demographic$Total_Male_2017 <- 0
combined_demographic$Total_Male_2018 <- 0
combined_demographic$Total_Male_2019 <- 0

combined_demographic$Total_Female_2013 <- 0
combined_demographic$Total_Female_2014 <- 0
combined_demographic$Total_Female_2015 <- 0
combined_demographic$Total_Female_2016 <- 0
combined_demographic$Total_Female_2017 <- 0
combined_demographic$Total_Female_2018 <- 0
combined_demographic$Total_Female_2019 <- 0

combined_demographic$Median_Age_2013 <- 0
combined_demographic$Median_Age_2014 <- 0
combined_demographic$Median_Age_2015 <- 0
combined_demographic$Median_Age_2016 <- 0
combined_demographic$Median_Age_2017 <- 0
combined_demographic$Median_Age_2018 <- 0
combined_demographic$Median_Age_2019 <- 0

combined_demographic$Total_White_2013 <- 0
combined_demographic$Total_White_2014 <- 0
combined_demographic$Total_White_2015 <- 0
combined_demographic$Total_White_2016 <- 0
combined_demographic$Total_White_2017 <- 0
combined_demographic$Total_White_2018 <- 0
combined_demographic$Total_White_2019 <- 0

combined_demographic$Total_African_American_2013 <- 0
combined_demographic$Total_African_American_2014 <- 0
combined_demographic$Total_African_American_2015 <- 0
combined_demographic$Total_African_American_2016 <- 0
combined_demographic$Total_African_American_2017 <- 0
combined_demographic$Total_African_American_2018 <- 0
combined_demographic$Total_African_American_2019 <- 0

combined_demographic$Total_American_Indian_Alaska_Native_2013 <- 0
combined_demographic$Total_American_Indian_Alaska_Native_2014 <- 0
combined_demographic$Total_American_Indian_Alaska_Native_2015 <- 0
combined_demographic$Total_American_Indian_Alaska_Native_2016 <- 0
combined_demographic$Total_American_Indian_Alaska_Native_2017 <- 0
combined_demographic$Total_American_Indian_Alaska_Native_2018 <- 0
combined_demographic$Total_American_Indian_Alaska_Native_2019 <- 0

combined_demographic$Total_Asian_2013 <- 0
combined_demographic$Total_Asian_2014 <- 0
combined_demographic$Total_Asian_2015 <- 0
combined_demographic$Total_Asian_2016 <- 0
combined_demographic$Total_Asian_2017 <- 0
combined_demographic$Total_Asian_2018 <- 0
combined_demographic$Total_Asian_2019 <- 0

combined_demographic$Total_Native_Hawaiian_Pacific_Islander_2013 <- 0
combined_demographic$Total_Native_Hawaiian_Pacific_Islander_2014 <- 0
combined_demographic$Total_Native_Hawaiian_Pacific_Islander_2015 <- 0
combined_demographic$Total_Native_Hawaiian_Pacific_Islander_2016 <- 0
combined_demographic$Total_Native_Hawaiian_Pacific_Islander_2017 <- 0
combined_demographic$Total_Native_Hawaiian_Pacific_Islander_2018 <- 0
combined_demographic$Total_Native_Hawaiian_Pacific_Islander_2019 <- 0

combined_demographic$Per_Capita_Income_in_past_year_2013 <- 0
combined_demographic$Per_Capita_Income_in_past_year_2014 <- 0
combined_demographic$Per_Capita_Income_in_past_year_2015 <- 0
combined_demographic$Per_Capita_Income_in_past_year_2016 <- 0
combined_demographic$Per_Capita_Income_in_past_year_2017 <- 0
combined_demographic$Per_Capita_Income_in_past_year_2018 <- 0
combined_demographic$Per_Capita_Income_in_past_year_2019 <- 0

# Combining demographic data based on Area Name 

for(area_name in combined_demographic$Area.Name) {
  if(area_name %in% demographic_2013$Area.Name == TRUE) {
    combined_index <- which(combined_demographic$Area.Name == area_name)
    index_2013 <- which(demographic_2013$Area.Name == area_name)
    combined_demographic[combined_index, c(12, 19, 26, 33, 40, 47, 54, 61, 68, 75)] <- demographic_2013[index_2013, c(10:19)]
  }
}

for(area_name in combined_demographic$Area.Name) {
  if(area_name %in% demographic_2014$Area.Name == TRUE) {
    combined_index <- which(combined_demographic$Area.Name == area_name)
    index_2014 <- which(demographic_2014$Area.Name == area_name)
    combined_demographic[combined_index, c(13, 20, 27, 34, 41, 48, 55, 62, 69, 76)] <- demographic_2014[index_2014, c(10:19)]
  }
}

for(area_name in combined_demographic$Area.Name) {
  if(area_name %in% demographic_2015$Area.Name == TRUE) {
    combined_index <- which(combined_demographic$Area.Name == area_name)
    index_2015 <- which(demographic_2015$Area.Name == area_name)
    combined_demographic[combined_index, c(14, 21, 28, 35, 42, 49, 56, 63, 70, 77)] <- demographic_2015[index_2015, c(10:19)]
  }
}

for(area_name in combined_demographic$Area.Name) {
  if(area_name %in% demographic_2016$Area.Name == TRUE) {
    combined_index <- which(combined_demographic$Area.Name == area_name)
    index_2016 <- which(demographic_2016$Area.Name == area_name)
    combined_demographic[combined_index, c(15, 22, 29, 36, 43, 50, 57, 64, 71, 78)] <- demographic_2016[index_2016, c(10:19)]
  }
}

for(area_name in combined_demographic$Area.Name) {
  if(area_name %in% demographic_2017$Area.Name == TRUE) {
    combined_index <- which(combined_demographic$Area.Name == area_name)
    index_2017 <- which(demographic_2017$Area.Name == area_name)
    combined_demographic[combined_index, c(16, 23, 30, 37, 44, 51, 58, 65, 72, 79)] <- demographic_2017[index_2017, c(10:19)]
  }
}

for(area_name in combined_demographic$Area.Name) {
  if(area_name %in% demographic_2018$Area.Name == TRUE) {
    combined_index <- which(combined_demographic$Area.Name == area_name)
    index_2018 <- which(demographic_2018$Area.Name == area_name)
    combined_demographic[combined_index, c(17, 24, 31, 38, 45, 52, 59, 66, 73, 80)] <- demographic_2018[index_2018, c(10:19)]
  }
}

for(area_name in combined_demographic$Area.Name) {
  if(area_name %in% demographic_2019$Area.Name == TRUE) {
    combined_index <- which(combined_demographic$Area.Name == area_name)
    index_2019 <- which(demographic_2019$Area.Name == area_name)
    combined_demographic[combined_index, c(18, 25, 32, 39, 46, 53, 60, 67, 74, 81)] <- demographic_2019[index_2019, c(12:21)]
  }
}


saveRDS(combined_demographic, file = "~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic.rds")

combined_demographic <- readRDS(file = "~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic.rds")

########################################################################################################################################################

# Getting long and lat coordinates with shape file of centers of population for all US census block groups

library(sf)
centers_of_pop <- st_read("~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0003_shape/US_blck_grp_cenpop_2010.shp", stringsAsFactors=FALSE)
centers_of_pop_ll <- st_transform(centers_of_pop, "+proj=longlat +ellps=WGS84 +datum=WGS84")
#head(st_coordinates(centers_of_pop_ll))

# Seeing whether GISJOIN codes match up between combined_demographic and centers_of_pop_ll dataframes

length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))

## 73 GISJOIN codes from centers_of_pop_ll dataframe are not found in combined_demographic dataframe
## These discrepancies are because GISJOIN, block group, county, and state codes and county name in centers_of_pop_ll dataframe based on 2010 Census 
## ... while GISJOIN, block group, county, and state codes and county name in combined_demographic dataframe based on 2019 Census

setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code)


# Looking at 73 records that do not match up and then making necessary changes to GISJOIN codes in centers_of_pop_ll dataframe

## For 4 of 73 records, county name and code changed from Wade Hampton Census Area (County code = 270) to Kuslivak Census Area (County code = 158)
## Link to Census webpage indicating changes: https://www.census.gov/programs-surveys/acs/technical-documentation/table-and-geography-changes.2015.html

centers_of_pop_ll$GISJOIN[3955:3958] <- combined_demographic[3836:3839, 1]
### Should be 69
length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))

## For 13 of 73 records, census tract codes in Pima County, AZ (county 19) changed between 2010 and 2019:
  ### Census Tract 27.01 is now 27.04, Census Tract 29.03 is now 29.06, Census Tract 4105.01 is now 41.18, Census Tract 4105.02 is now 41.21,   
  ### Census Tract 4105.03 is now 41.25, Census Tract 4704.00 is now 52.00, Census Tract 4705.00 is now 53.00
## Link to pdf containing changes in Geography for 2010 Census: https://www2.census.gov/geo/pdfs/reference/Geography_Notes.pdf

centers_of_pop_ll$GISJOIN[7161:7162] <- combined_demographic[7167:7168, 1]
centers_of_pop_ll$GISJOIN[7181] <- combined_demographic[7188, 1]
centers_of_pop_ll$GISJOIN[7643] <- combined_demographic[7410, 1]
centers_of_pop_ll$GISJOIN[7644] <- combined_demographic[7413, 1]
centers_of_pop_ll$GISJOIN[7645:7646] <- combined_demographic[7415:7416, 1]
centers_of_pop_ll$GISJOIN[7647:7652] <- combined_demographic[7647:7652, 1]
### Should be 56
length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))

## For one LA County (county 37) record, Census Tract 8002.04, Block Group 3 changed to Census Tract 1370, Block Group 2 
## Link to pdf of changes in Geography for 2010 Census: https://www2.census.gov/geo/pdfs/reference/Geography_Notes.pdf

centers_of_pop_ll$GISJOIN[19893] <- combined_demographic[14570, 1]

## For another LA County (county 37) record, Census Tract 9304.01, Block 1 changed to Census Tract 1370, Block Group 1 
## Link to pdf of changes in Geography for 2010 Census: https://www2.census.gov/geo/pdfs/reference/Geography_Notes.pdf

centers_of_pop_ll$GISJOIN[20239] <- combined_demographic[14569, 1]
#### Should be 54
length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))

## For 30 records, census tract codes in Madison County, NY (county 53) changed between 2010 and 2019:
  ### Census Tract 9401.01 (940101) code changed to 301.01 (030101) 
  ### Census Tract 9401.02 (940102) code changed to 301.02 (030102)
  ### Census Tract 9401.03 (940103) code changed to 301.03 (030103)
  ### Census Tract 9402 (940200) code changed to 302 (030200)
  ### Census Tract 9403 (940300) code changed to 303 (030300)
  ### Census Tract 9404.01 (940401) code changed to 304.01 (030401)
  ### Census Tract 9404.03 (940403) code changed to 304.03 (030403)
  ### Census Tract 9406 (940600) code changed to 306.00 (030600)
  ### Census Tract 9407 (940700) code changed to 304.02 (030402)
## Link to pdf of changes in Geography for 2010 Census: https://www2.census.gov/geo/pdfs/reference/Geography_Notes.pdf

centers_of_pop_ll$GISJOIN[133582:133583] <- combined_demographic[133565:133566, 1]
centers_of_pop_ll$GISJOIN[133584:133587] <- combined_demographic[133567:133570, 1]
centers_of_pop_ll$GISJOIN[133588:133590] <- combined_demographic[133571:133573, 1]
centers_of_pop_ll$GISJOIN[133591:133593] <- combined_demographic[133574:133576, 1]
centers_of_pop_ll$GISJOIN[133594:133597] <- combined_demographic[133577:133580, 1]
centers_of_pop_ll$GISJOIN[133598:133602] <- combined_demographic[133581:133585, 1]
centers_of_pop_ll$GISJOIN[133603:133605] <- combined_demographic[133588:133590, 1]
centers_of_pop_ll$GISJOIN[133606:133609] <- combined_demographic[133595:133598, 1]
centers_of_pop_ll$GISJOIN[133610:133611] <- combined_demographic[133586:133587, 1]
### Should be 24
length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))

## For 9 records, census tract codes in Oneida County, NY (county 65) changed between 2010 and 2019:
  ### Census Tract 9400 (940000) code changed to 248 (024800)
  ### Census Tract 9401 (940100) code changed to 247 (024700)
  ### Census Tract 9402 (940200) code changed to 249 (024900)
  
centers_of_pop_ll$GISJOIN[136927:136928] <- combined_demographic[136879:136880, 1]
centers_of_pop_ll$GISJOIN[136929:136932] <- combined_demographic[136875:136878, 1]
centers_of_pop_ll$GISJOIN[136933:136935] <- combined_demographic[136881:136883, 1]
### Should be 15
length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))

## For one record in Richmond County, NY (85), Census Tract 8900 (008900) Block Group 0 changed to Census Tract 97 (9700) Block Group 0
centers_of_pop_ll$GISJOIN[139864] <- combined_demographic[139869, 1]
### Should be 14
length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))

## For 9 records, county name (Shannon County, SD) and code (113) changed to Oglala Lakota County, SD (code 102)
## Link to Census webpage indicating changes: https://www.census.gov/programs-surveys/acs/technical-documentation/table-and-geography-changes.2015.html

centers_of_pop_ll$GISJOIN[178911:178919] <- combined_demographic[178823:178831, 1]
### Should be 5
length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))

## For 5 records, county name (Shannon County, SD) and code (113) changed to Oglala Lakota County, SD (code 102)
## Link to Census webpage indicating changes: https://www.census.gov/programs-surveys/acs/technical-documentation/table-and-geography-changes.2015.html

centers_of_pop_ll$GISJOIN[178911:178919] <- combined_demographic[178823:178831, 1]
### Should be 5
length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))

## For 5 records in Virginia, County 515 (Bedford City, VG) Tract 50100 changed to County 19 (Bedford County, VG) Tract 50100
## Link to Census webpage indicating changes: https://www.census.gov/programs-surveys/acs/technical-documentation/table-and-geography-changes.2014.html

centers_of_pop_ll$GISJOIN[204766:204770] <- combined_demographic[201571:201575, 1]
### Should be 0
length(setdiff(centers_of_pop_ll$GISJOIN, combined_demographic$GIS.Join.Match.Code))
length(setdiff(combined_demographic$GIS.Join.Match.Code, centers_of_pop_ll$GISJOIN))


# Checking if there are duplicate GISJOINs in either centers_of_pop_ll and combined_demographic

centers_of_pop_ll$GISJOIN[duplicated(centers_of_pop_ll$GISJOIN)]
combined_demographic$GIS.Join.Match.Code[duplicated(combined_demographic$GIS.Join.Match.Code)]

## centers_of_pop_ll has one duplicate GISJOIN (G36008500097000)
## Removing the duplicate from centers_of_pop_ll that has GEOID which does not match up with Census Geographic Identifier in combined_demographic

centers_of_pop_ll <- centers_of_pop_ll[!(centers_of_pop_ll$GEOID == "360850089000"), ]
rownames(centers_of_pop_ll) <- NULL
centers_of_pop_ll$GISJOIN[duplicated(centers_of_pop_ll$GISJOIN)]


# Merging centers_of_pop_ll longitude and latitude data with combined_demographic data based on GISJOIN code

## Add latitude and longitude columns to combined_demographic dataframe

library(tibble)
combined_demographic_with_centers_of_pop <- combined_demographic %>% add_column(Centers_of_Pop_Latitude = NA, .after = "Area.Name")
combined_demographic_with_centers_of_pop <- combined_demographic_with_centers_of_pop %>% add_column(Centers_of_Pop_Longitude = NA, .after = "Centers_of_Pop_Latitude")

## Actual merging below

for(GISJOIN in combined_demographic_with_centers_of_pop$GIS.Join.Match.Code) {
  if(GISJOIN %in% centers_of_pop_ll$GISJOIN == TRUE) {
    combined_index <- which(combined_demographic_with_centers_of_pop$GIS.Join.Match.Code == GISJOIN)
    centers_of_pop_index <- which(centers_of_pop_ll$GISJOIN == GISJOIN)
    combined_demographic_with_centers_of_pop[combined_index, 12] <- centers_of_pop_ll$LATITUDE[centers_of_pop_index]
    combined_demographic_with_centers_of_pop[combined_index, 13] <- centers_of_pop_ll$LONGITUDE[centers_of_pop_index]
  }
}

saveRDS(combined_demographic_with_centers_of_pop, file = "~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic_with_centers_of_pop.rds")

## Creating Excel file from combined dataframe

combined_demographic_with_centers_of_pop <- readRDS(file = "~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic_with_centers_of_pop.rds")

library(openxlsx)
openxlsx::write.xlsx(combined_demographic_with_centers_of_pop, file = "~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/Combined demographic data with centers of population.xlsx", col.names = T, row.names = F, showNA = F)

###########################################################################################################################################

# Loading Hispanic data

hispanic_2013 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0010_csv/nhgis0010_ds201_20135_2013_blck_grp_E.csv")
hispanic_2014 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0010_csv/nhgis0010_ds206_20145_2014_blck_grp_E.csv")
hispanic_2015 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0010_csv/nhgis0010_ds215_20155_2015_blck_grp_E.csv")
hispanic_2016 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0010_csv/nhgis0010_ds225_20165_2016_blck_grp_E.csv")
hispanic_2017 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0010_csv/nhgis0010_ds233_20175_2017_blck_grp_E.csv")
hispanic_2018 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0010_csv/nhgis0010_ds239_20185_2018_blck_grp_E.csv")
hispanic_2019 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0010_csv/nhgis0010_ds244_20195_2019_blck_grp_E.csv")

# Making descriptive header row the header and removing current header

colnames(hispanic_2013) <- hispanic_2013[1, ]
hispanic_2013 <- hispanic_2013[-1, ]
colnames(hispanic_2014) <- hispanic_2014[1, ]
hispanic_2014 <- hispanic_2014[-1, ]
colnames(hispanic_2015) <- hispanic_2015[1, ]
hispanic_2015 <- hispanic_2015[-1, ]
colnames(hispanic_2016) <- hispanic_2016[1, ]
hispanic_2016 <- hispanic_2016[-1, ]
colnames(hispanic_2017) <- hispanic_2017[1, ]
hispanic_2017 <- hispanic_2017[-1, ]
colnames(hispanic_2018) <- hispanic_2018[1, ]
hispanic_2018 <- hispanic_2018[-1, ]
colnames(hispanic_2019) <- hispanic_2019[1, ]
hispanic_2019 <- hispanic_2019[-1, ]

## Set rownames to NULL so that row numbers are not messed up after deleting rows

rownames(hispanic_2013) <- NULL
rownames(hispanic_2014) <- NULL
rownames(hispanic_2015) <- NULL
rownames(hispanic_2016) <- NULL
rownames(hispanic_2017) <- NULL
rownames(hispanic_2018) <- NULL
rownames(hispanic_2019) <- NULL

# Remove Puerto Rico rows

hispanic_2013 <- hispanic_2013[!(hispanic_2013$`State Name` == "Puerto Rico"), ]
rownames(hispanic_2013) <- NULL
hispanic_2014 <- hispanic_2014[!(hispanic_2014$`State Name` == "Puerto Rico"), ]
rownames(hispanic_2014) <- NULL
hispanic_2015 <- hispanic_2015[!(hispanic_2015$`State Name` == "Puerto Rico"), ]
rownames(hispanic_2015) <- NULL
hispanic_2016 <- hispanic_2016[!(hispanic_2016$`State Name` == "Puerto Rico"), ]
rownames(hispanic_2016) <- NULL
hispanic_2017 <- hispanic_2017[!(hispanic_2017$`State Name` == "Puerto Rico"), ]
rownames(hispanic_2017) <- NULL
hispanic_2018 <- hispanic_2018[!(hispanic_2018$`State Name` == "Puerto Rico"), ]
rownames(hispanic_2018) <- NULL
hispanic_2019 <- hispanic_2019[!(hispanic_2019$`State Name`== "Puerto Rico"), ]
rownames(hispanic_2019) <- NULL

# Subsetting for columns we want

hispanic_2013 <- subset(hispanic_2013, select = c(1,2, 5:8, 11:12, 35, 40, 50))
hispanic_2014 <- subset(hispanic_2014, select = c(1,2, 5:8, 11:12, 35, 40, 50))
hispanic_2015 <- subset(hispanic_2015, select = c(1,2, 5:8, 11:12, 35, 40, 50))
hispanic_2016 <- subset(hispanic_2016, select = c(1,2, 5:8, 11:12, 35, 40, 50))
hispanic_2017 <- subset(hispanic_2017, select = c(1,2, 5:8, 11:12, 35, 40, 50))
hispanic_2018 <- subset(hispanic_2018, select = c(1,2, 5:8, 11:12, 35, 40, 50))
hispanic_2019 <- subset(hispanic_2019, select = c(1,2, 5:8, 11:12, 35, 46, 56))

# Read in 'combined_demographic_with_centers_of_pop' dataframe and remove Puerto Rico rows 

combined_demographic_with_centers_of_pop <- readRDS(file = "~/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic_with_centers_of_pop.rds")
combined_demographic_with_centers_of_pop <- combined_demographic_with_centers_of_pop[!(combined_demographic_with_centers_of_pop$State.Name == "Puerto Rico"), ]
rownames(combined_demographic_with_centers_of_pop) <- NULL

# See whether its GIS Join Match Codes all match up with GIS Join Match Codes in health insurance dataframes
# GIS Join Match Codes might not match up because of changes in geography and geographic boundaries 
# If GIS Join Match Codes not match up, make necessary changes so they do

setdiff(hispanic_2013$`GIS Join Match Code`, combined_demographic_with_centers_of_pop$GIS.Join.Match.Code)

## hispanic_2013

### For four records, GIS Join Match Codes do not match up because Wade Hampton Census Area (02-270) changed to Kusilvak Census Area (02-158)

hispanic_2013$`GIS Join Match Code`[3955:3958] <- c("G02015800001001", "G02015800001002", "G02015800001003", "G02015800001004")

### For nine records, GIS Join Match Codes do not match up because Shannon County, South Dakota (46-113) changed to Oglala Lakota County, South Dakota (46-102)

hispanic_2013$`GIS Join Match Code`[178910:178918] <- c("G46010209405001","G46010209405002","G46010209405003","G46010209408001","G46010209408002","G46010209408003","G46010209409001","G46010209409002","G46010209409003")

### For five records, GIS Join Match Codes do not match up because Bedford city, Virginia  (51-515) changed to Bedford County, Virginia (51-019)

hispanic_2013$`GIS Join Match Code`[204765:204769] <- c("G51001900501001","G51001900501002","G51001900501003","G51001900501004","G51001900501005")

## hispanic_2014

setdiff(hispanic_2014$`GIS Join Match Code`, combined_demographic_with_centers_of_pop$GIS.Join.Match.Code)

### For four records, GIS Join Match Codes do not match up because Wade Hampton Census Area (02-270) changed to Kusilvak Census Area (02-158)

hispanic_2014$`GIS Join Match Code`[3955:3958] <- c("G02015800001001", "G02015800001002", "G02015800001003", "G02015800001004")

### For nine records, GIS Join Match Codes do not match up because Shannon County, South Dakota (46-113) changed to Oglala Lakota County, South Dakota (46-102)

hispanic_2014$`GIS Join Match Code`[178910:178918] <- c("G46010209405001","G46010209405002","G46010209405003","G46010209408001","G46010209408002","G46010209408003","G46010209409001","G46010209409002","G46010209409003")

# See whether its GIS Join Match Codes all match up with GIS Join Match Codes in health insurance dataframes
setdiff(hispanic_2013$`GIS Join Match Code`, combined_demographic_with_centers_of_pop$GIS.Join.Match.Code)
setdiff(hispanic_2014$`GIS Join Match Code`, combined_demographic_with_centers_of_pop$GIS.Join.Match.Code)
setdiff(hispanic_2015$`GIS Join Match Code`, combined_demographic_with_centers_of_pop$GIS.Join.Match.Code)
setdiff(hispanic_2016$`GIS Join Match Code`, combined_demographic_with_centers_of_pop$GIS.Join.Match.Code)
setdiff(hispanic_2017$`GIS Join Match Code`, combined_demographic_with_centers_of_pop$GIS.Join.Match.Code)
setdiff(hispanic_2018$`GIS Join Match Code`, combined_demographic_with_centers_of_pop$GIS.Join.Match.Code)
setdiff(hispanic_2019$`GIS Join Match Code`, combined_demographic_with_centers_of_pop$GIS.Join.Match.Code)

# Adding hispanic columns to combined_demographic dataframe

## Creating vector containing columns with year appended 

hispanic_columns <- rep(colnames(hispanic_2013)[c(10, 11)], each = 7)
library(stringr)
hispanic_columns[c(1, 8)] <- paste0(hispanic_columns[c(1, 8)], "_2013")
hispanic_columns[c(2, 9)] <- paste0(hispanic_columns[c(2, 9)], "_2014")
hispanic_columns[c(3, 10)] <- paste0(hispanic_columns[c(3, 10)], "_2015")
hispanic_columns[c(4, 11)] <- paste0(hispanic_columns[c(4, 11)], "_2016")
hispanic_columns[c(5, 12)] <- paste0(hispanic_columns[c(5, 12)], "_2017")
hispanic_columns[c(6, 13)] <- paste0(hispanic_columns[c(6, 13)], "_2018")
hispanic_columns[c(7, 14)] <- paste0(hispanic_columns[c(7, 14)], "_2019")

hispanic_columns

## Inserting empty columns into 'combined_demographic_with_centers_of_pop' dataframe
nums <- c(14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)

library(tibble)
for(i in nums) {
  combined_demographic_with_centers_of_pop <- add_column(combined_demographic_with_centers_of_pop, !!(hispanic_columns[i]) := NA, .after = "Total_White_2019")
}

# Inserting data from hispanic datasets into 'combined_demographic' dataframe

for(GISJOIN in combined_demographic_with_centers_of_pop$GIS.Join.Match.Code) {
  if(GISJOIN %in% hispanic_2013$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic_with_centers_of_pop$GIS.Join.Match.Code == GISJOIN)
    hispanic_index <- which(hispanic_2013$`GIS Join Match Code` == GISJOIN)
    combined_demographic_with_centers_of_pop[combined_index, c(49, 56)] <- hispanic_2013[hispanic_index, c(10, 11)]
  }
}

rm(hispanic_2013)

for(GISJOIN in combined_demographic_with_centers_of_pop$GIS.Join.Match.Code) {
  if(GISJOIN %in% hispanic_2014$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic_with_centers_of_pop$GIS.Join.Match.Code == GISJOIN)
    hispanic_index <- which(hispanic_2014$`GIS Join Match Code` == GISJOIN)
    combined_demographic_with_centers_of_pop[combined_index, c(50, 57)] <- hispanic_2014[hispanic_index, c(10, 11)]
  }
}

rm(hispanic_2014)


for(GISJOIN in combined_demographic_with_centers_of_pop$GIS.Join.Match.Code) {
  if(GISJOIN %in% hispanic_2015$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic_with_centers_of_pop$GIS.Join.Match.Code == GISJOIN)
    hispanic_index <- which(hispanic_2015$`GIS Join Match Code` == GISJOIN)
    combined_demographic_with_centers_of_pop[combined_index, c(51, 58)] <- hispanic_2015[hispanic_index, c(10, 11)]
  }
}

rm(hispanic_2015)


for(GISJOIN in combined_demographic_with_centers_of_pop$GIS.Join.Match.Code) {
  if(GISJOIN %in% hispanic_2016$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic_with_centers_of_pop$GIS.Join.Match.Code == GISJOIN)
    hispanic_index <- which(hispanic_2016$`GIS Join Match Code` == GISJOIN)
    combined_demographic_with_centers_of_pop[combined_index, c(52, 59)] <- hispanic_2016[hispanic_index, c(10, 11)]
  }
}

rm(hispanic_2016)



for(GISJOIN in combined_demographic_with_centers_of_pop$GIS.Join.Match.Code) {
  if(GISJOIN %in% hispanic_2017$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic_with_centers_of_pop$GIS.Join.Match.Code == GISJOIN)
    hispanic_index <- which(hispanic_2017$`GIS Join Match Code` == GISJOIN)
    combined_demographic_with_centers_of_pop[combined_index, c(53, 60)] <- hispanic_2017[hispanic_index, c(10, 11)]
  }
}

rm(hispanic_2017)



for(GISJOIN in combined_demographic_with_centers_of_pop$GIS.Join.Match.Code) {
  if(GISJOIN %in% hispanic_2018$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic_with_centers_of_pop$GIS.Join.Match.Code == GISJOIN)
    hispanic_index <- which(hispanic_2018$`GIS Join Match Code` == GISJOIN)
    combined_demographic_with_centers_of_pop[combined_index, c(54, 61)] <- hispanic_2018[hispanic_index, c(10, 11)]
  }
}

rm(hispanic_2018)


for(GISJOIN in combined_demographic_with_centers_of_pop$GIS.Join.Match.Code) {
  if(GISJOIN %in% hispanic_2019$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic_with_centers_of_pop$GIS.Join.Match.Code == GISJOIN)
    hispanic_index <- which(hispanic_2019$`GIS Join Match Code` == GISJOIN)
    combined_demographic_with_centers_of_pop[combined_index, c(55, 62)] <- hispanic_2019[hispanic_index, c(10, 11)]
  }
}

rm(hispanic_2019)

saveRDS(combined_demographic_with_centers_of_pop, "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic_with_centers_of_pop_hispanic.rds")

#############################################################################################################################################

# Load in combined demographic dataframe 

combined_demographic <- readRDS("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic_with_centers_of_pop_hispanic.rds")

# Loading health insurance data 

health_ins_2013 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0008_csv/nhgis0008_ds201_20135_2013_blck_grp_E.csv")
health_ins_2014 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0008_csv/nhgis0008_ds206_20145_2014_blck_grp_E.csv")
health_ins_2015 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0008_csv/nhgis0008_ds215_20155_2015_blck_grp_E.csv")
health_ins_2016 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0008_csv/nhgis0008_ds225_20165_2016_blck_grp_E.csv")
health_ins_2017 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0008_csv/nhgis0008_ds233_20175_2017_blck_grp_E.csv")
health_ins_2018 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0008_csv/nhgis0008_ds239_20185_2018_blck_grp_E.csv")
health_ins_2019 <- read.csv("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/nhgis0008_csv/nhgis0008_ds244_20195_2019_blck_grp_E.csv")

# Making descriptive header row the header and removing current header

colnames(health_ins_2013) <- health_ins_2013[1, ]
health_ins_2013 <- health_ins_2013[-1, ]
colnames(health_ins_2014) <- health_ins_2014[1, ]
health_ins_2014 <- health_ins_2014[-1, ]
colnames(health_ins_2015) <- health_ins_2015[1, ]
health_ins_2015 <- health_ins_2015[-1, ]
colnames(health_ins_2016) <- health_ins_2016[1, ]
health_ins_2016 <- health_ins_2016[-1, ]
colnames(health_ins_2017) <- health_ins_2017[1, ]
health_ins_2017 <- health_ins_2017[-1, ]
colnames(health_ins_2018) <- health_ins_2018[1, ]
health_ins_2018 <- health_ins_2018[-1, ]
colnames(health_ins_2019) <- health_ins_2019[1, ]
health_ins_2019 <- health_ins_2019[-1, ]

## Set rownames to NULL so that row numbers are not messed up after deleting rows
rownames(health_ins_2013) <- NULL
rownames(health_ins_2014) <- NULL
rownames(health_ins_2015) <- NULL
rownames(health_ins_2016) <- NULL
rownames(health_ins_2017) <- NULL
rownames(health_ins_2018) <- NULL
rownames(health_ins_2019) <- NULL

# Removing unwanted columns

health_ins_2013 <- subset(health_ins_2013, select = -c(3,4,9,10,13:34, 36:37))
health_ins_2014 <- subset(health_ins_2014, select = -c(3,4,9,10,13:34, 36:37))
health_ins_2015 <- subset(health_ins_2015, select = -c(3,4,9,10,13:34, 36:37))
health_ins_2016 <- subset(health_ins_2016, select = -c(3,4,9,10,13:34, 36:37))
health_ins_2017 <- subset(health_ins_2017, select = -c(3,4,9,10,13:34, 36:37))
health_ins_2018 <- subset(health_ins_2018, select = -c(3,4,9,10,13:34, 36:37))
health_ins_2019 <- subset(health_ins_2019, select = -c(4,5,10,11,14:39, 42:43))

# The health insurance data only covers civilian noninstitutionalized population
# Civilian noninstitutional population: 16 years of age and older who are not inmates of institutions (e.g. penal and mental facilities, old age homes) and not on active duty in the Armed Forces
# So renaming columns to reflect that 

colnames(health_ins_2013)[c(10, 11, 27, 43, 60)] <- c("Total_civilian_noninstitional_pop", "Civilian_noninstitutional_pop_Under_18_years", "Civilian_noninstitutionalized_pop_18_to_34_years", "Civilian_noninstitutionalized_pop_35_to_64_years", "Civilian_noninstitutionalized_pop_65_years_and_over")
colnames(health_ins_2014)[c(10, 11, 27, 43, 60)] <- c("Total_civilian_noninstitional_pop", "Civilian_noninstitutional_pop_Under_18_years", "Civilian_noninstitutionalized_pop_18_to_34_years", "Civilian_noninstitutionalized_pop_35_to_64_years", "Civilian_noninstitutionalized_pop_65_years_and_over")
colnames(health_ins_2015)[c(10, 11, 27, 43, 60)] <- c("Total_civilian_noninstitional_pop", "Civilian_noninstitutional_pop_Under_18_years", "Civilian_noninstitutionalized_pop_18_to_34_years", "Civilian_noninstitutionalized_pop_35_to_64_years", "Civilian_noninstitutionalized_pop_65_years_and_over")
colnames(health_ins_2016)[c(10, 11, 27, 43, 60)] <- c("Total_civilian_noninstitional_pop", "Civilian_noninstitutional_pop_Under_18_years", "Civilian_noninstitutionalized_pop_18_to_34_years", "Civilian_noninstitutionalized_pop_35_to_64_years", "Civilian_noninstitutionalized_pop_65_years_and_over")
colnames(health_ins_2017)[c(10, 11, 27, 43, 60)] <- c("Total_civilian_noninstitional_pop", "Civilian_noninstitutional_pop_Under_19_years", "Civilian_noninstitutionalized_pop_19_to_34_years", "Civilian_noninstitutionalized_pop_35_to_64_years", "Civilian_noninstitutionalized_pop_65_years_and_over")
colnames(health_ins_2018)[c(10, 11, 27, 43, 60)] <- c("Total_civilian_noninstitional_pop", "Civilian_noninstitutional_pop_Under_19_years", "Civilian_noninstitutionalized_pop_19_to_34_years", "Civilian_noninstitutionalized_pop_35_to_64_years", "Civilian_noninstitutionalized_pop_65_years_and_over")
colnames(health_ins_2019)[c(12, 13, 29, 45, 62)] <- c("Total_civilian_noninstitional_pop", "Civilian_noninstitutional_pop_Under_19_years", "Civilian_noninstitutionalized_pop_19_to_34_years", "Civilian_noninstitutionalized_pop_35_to_64_years", "Civilian_noninstitutionalized_pop_65_years_and_over")

# See whether its GIS Join Match Codes all match up with GIS Join Match Codes in health insurance dataframes
# GIS Join Match Codes might not match up because of changes in geography and geographic boundaries 
# If GIS Join Match Codes not match up, make necessary changes so they do

setdiff(health_ins_2013$`GIS Join Match Code`, combined_demographic$GIS.Join.Match.Code)

## health_ins_2013

### For four records, GIS Join Match Codes do not match up because Wade Hampton Census Area (02-270) changed to Kusilvak Census Area (02-158)

health_ins_2013$`GIS Join Match Code`[3955:3958] <- c("G02015800001001", "G02015800001002", "G02015800001003", "G02015800001004")

### For nine records, GIS Join Match Codes do not match up because Shannon County, South Dakota (46-113) changed to Oglala Lakota County, South Dakota (46-102)

health_ins_2013$`GIS Join Match Code`[178910:178918] <- c("G46010209405001","G46010209405002","G46010209405003","G46010209408001","G46010209408002","G46010209408003","G46010209409001","G46010209409002","G46010209409003")

### For five records, GIS Join Match Codes do not match up because Bedford city, Virginia  (51-515) changed to Bedford County, Virginia (51-019)

health_ins_2013$`GIS Join Match Code`[204765:204769] <- c("G51001900501001","G51001900501002","G51001900501003","G51001900501004","G51001900501005")

## health_ins_2014

setdiff(health_ins_2014$`GIS Join Match Code`, combined_demographic$GIS.Join.Match.Code)

### For four records, GIS Join Match Codes do not match up because Wade Hampton Census Area (02-270) changed to Kusilvak Census Area (02-158)

health_ins_2014$`GIS Join Match Code`[3955:3958] <- c("G02015800001001", "G02015800001002", "G02015800001003", "G02015800001004")

### For nine records, GIS Join Match Codes do not match up because Shannon County, South Dakota (46-113) changed to Oglala Lakota County, South Dakota (46-102)

health_ins_2014$`GIS Join Match Code`[178910:178918] <- c("G46010209405001","G46010209405002","G46010209405003","G46010209408001","G46010209408002","G46010209408003","G46010209409001","G46010209409002","G46010209409003")

## health_ins_2015, health_ins_2016, health_ins_2017, health_ins_2018, health_ins_2019

setdiff(health_ins_2015$`GIS Join Match Code`, combined_demographic$GIS.Join.Match.Code)
setdiff(health_ins_2016$`GIS Join Match Code`, combined_demographic$GIS.Join.Match.Code)
setdiff(health_ins_2017$`GIS Join Match Code`, combined_demographic$GIS.Join.Match.Code)
setdiff(health_ins_2018$`GIS Join Match Code`, combined_demographic$GIS.Join.Match.Code)
setdiff(health_ins_2019$`GIS Join Match Code`, combined_demographic$GIS.Join.Match.Code)

# Adding health insurance columns to combined_demographic dataframe

## Creating vector containing columns with year appended 

health_ins_columns <- rep(colnames(health_ins_2013)[c(10, 11, 15, 16, 24, 26, 27, 31, 32, 40, 42, 43, 47, 48, 57, 59, 60, 64, 73, 75)], each = 7)
library(stringr)
health_ins_columns <- paste0(health_ins_columns, c("_2013", "_2014", "_2015", "_2016", "_2017", "_2018", "_2019"))
health_ins_columns[c(12:14, 19:21, 26:28, 33:35, 40:42)] <- str_replace(health_ins_columns[c(12:14, 19:21, 26:28, 33:35, 40:42)], "Under 18 years", "Under 19 years")
health_ins_columns[c(47:49, 54:56, 61:63, 68:70, 75:77)] <- str_replace(health_ins_columns[c(47:49, 54:56, 61:63, 68:70, 75:77)], "18 to 34 years", "19 to 34 years")

health_ins_columns

## Inserting empty columns into 'combined_demographic' dataframe

for(i in health_ins_columns) {
  combined_demographic[,i] <- NA
}

# Inserting data from health insurance datasets into 'combined_demographic' dataframe

combined_cols = c(98)
for(i in 1:19) {
  combined_cols[i+1] <- combined_cols[i] + 7
}


for(GISJOIN in combined_demographic$GIS.Join.Match.Code) {
  if(GISJOIN %in% health_ins_2013$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic$GIS.Join.Match.Code == GISJOIN)
    health_ins_index <- which(health_ins_2013$`GIS Join Match Code` == GISJOIN)
    combined_demographic[combined_index, combined_cols] <- health_ins_2013[health_ins_index, c(10, 11, 15, 16, 24, 26, 27, 31, 32, 40, 42, 43, 47, 48, 57, 59, 60, 64, 73, 75)]
  }
}

rm(health_ins_2013)

combined_cols = c(99)
for(i in 1:19) {
  combined_cols[i+1] <- combined_cols[i] + 7
}


for(GISJOIN in combined_demographic$GIS.Join.Match.Code) {
  if(GISJOIN %in% health_ins_2014$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic$GIS.Join.Match.Code == GISJOIN)
    health_ins_index <- which(health_ins_2014$`GIS Join Match Code` == GISJOIN)
    combined_demographic[combined_index, combined_cols] <- health_ins_2014[health_ins_index, c(10, 11, 15, 16, 24, 26, 27, 31, 32, 40, 42, 43, 47, 48, 57, 59, 60, 64, 73, 75)]
  }
}

rm(health_ins_2014)

combined_cols = c(100)
for(i in 1:19) {
  combined_cols[i+1] <- combined_cols[i] + 7
}


for(GISJOIN in combined_demographic$GIS.Join.Match.Code) {
  if(GISJOIN %in% health_ins_2015$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic$GIS.Join.Match.Code == GISJOIN)
    health_ins_index <- which(health_ins_2015$`GIS Join Match Code` == GISJOIN)
    combined_demographic[combined_index, combined_cols] <- health_ins_2015[health_ins_index, c(10, 11, 15, 16, 24, 26, 27, 31, 32, 40, 42, 43, 47, 48, 57, 59, 60, 64, 73, 75)]
  }
}

rm(health_ins_2015)


combined_cols = c(101)
for(i in 1:19) {
  combined_cols[i+1] <- combined_cols[i] + 7
}


for(GISJOIN in combined_demographic$GIS.Join.Match.Code) {
  if(GISJOIN %in% health_ins_2016$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic$GIS.Join.Match.Code == GISJOIN)
    health_ins_index <- which(health_ins_2016$`GIS Join Match Code` == GISJOIN)
    combined_demographic[combined_index, combined_cols] <- health_ins_2016[health_ins_index, c(10, 11, 15, 16, 24, 26, 27, 31, 32, 40, 42, 43, 47, 48, 57, 59, 60, 64, 73, 75)]
  }
}

rm(health_ins_2016)


combined_cols = c(102)
for(i in 1:19) {
  combined_cols[i+1] <- combined_cols[i] + 7
}

for(GISJOIN in combined_demographic$GIS.Join.Match.Code) {
  if(GISJOIN %in% health_ins_2017$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic$GIS.Join.Match.Code == GISJOIN)
    health_ins_index <- which(health_ins_2017$`GIS Join Match Code` == GISJOIN)
    combined_demographic[combined_index, combined_cols] <- health_ins_2017[health_ins_index, c(10, 11, 15, 16, 24, 26, 27, 31, 32, 40, 42, 43, 47, 48, 57, 59, 60, 64, 73, 75)]
  }
}

rm(health_ins_2017)


combined_cols = c(103)
for(i in 1:19) {
  combined_cols[i+1] <- combined_cols[i] + 7
}

for(GISJOIN in combined_demographic$GIS.Join.Match.Code) {
  if(GISJOIN %in% health_ins_2018$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic$GIS.Join.Match.Code == GISJOIN)
    health_ins_index <- which(health_ins_2018$`GIS Join Match Code` == GISJOIN)
    combined_demographic[combined_index, combined_cols] <- health_ins_2018[health_ins_index, c(10, 11, 15, 16, 24, 26, 27, 31, 32, 40, 42, 43, 47, 48, 57, 59, 60, 64, 73, 75)]
  }
}

rm(health_ins_2018)


combined_cols = c(104)
for(i in 1:19) {
  combined_cols[i+1] <- combined_cols[i] + 7
}

for(GISJOIN in combined_demographic$GIS.Join.Match.Code) {
  if(GISJOIN %in% health_ins_2019$`GIS Join Match Code` == TRUE) {
    combined_index <- which(combined_demographic$GIS.Join.Match.Code == GISJOIN)
    health_ins_index <- which(health_ins_2019$`GIS Join Match Code` == GISJOIN)
    combined_demographic[combined_index, combined_cols] <- health_ins_2019[health_ins_index, c(12, 13, 17, 18, 26, 28, 29, 33, 34, 42, 44, 45, 49, 50, 59, 61, 62, 66, 75, 77)]
  }
}

rm(health_ins_2019)

saveRDS(combined_demographic, "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic_with_centers_of_pop_hispanic_health_ins.rds")

library(openxlsx)
openxlsx::write.xlsx(combined_demographic, file = "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/Combined_demographic_data_centers_of_pop_hispanic_health_ins.xlsx", col.names = T, row.names = F, showNA = F)

##########################################################################################################################################################################################################################################################################

# Read in fatal motor vehicle crash data 
library(openxlsx)
fatal_crash_data <- read.xlsx("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/Fatal Motor Vehicle Crash Data.xlsx", sheet = "Data", colNames = T, rowNames = F)

# Remove last row 
fatal_crash_data <- fatal_crash_data[-c(nrow(fatal_crash_data)), ]

# Parse county and state and create separate column for each
County <- sub(".*-(.*)", "\\1", fatal_crash_data$`State-County`)
State <- sub("(.*)-.*", "\\1", fatal_crash_data$`State-County`)
library(tibble)
fatal_crash_data <- add_column(fatal_crash_data, County, .before = "Total")
fatal_crash_data <- add_column(fatal_crash_data, State, .after = "County")

## Fix up errors in parsing county and state
fatal_crash_data[80, c(2,3)] <- c("Matanuska-Susitna", "Alaska")
fatal_crash_data[85, c(2,3)] <- c("Valdez-Cordova", "Alaska")
fatal_crash_data[87, c(2,3)] <- c("Yukon-Koyukuk", "Alaska")
fatal_crash_data[314, c(2,3)] <- c("District of Columbia", "District of Columbia")
fatal_crash_data[357, c(2,3)] <- c("Miami-Dade", "Florida")

## Remove whitespace in County and State columns
fatal_crash_data$County <- trimws(fatal_crash_data$County)
fatal_crash_data$State <- trimws(fatal_crash_data$State)

## Remove "Unknown County" records
fatal_crash_data <- fatal_crash_data[!(fatal_crash_data$County == "Unknown County"), ]
rownames(fatal_crash_data) <- NULL

## Adding 'County' to every element in County column
fatal_crash_data$County <- paste(fatal_crash_data$County, "County")

## Edit elements in County column that have 'County County' or 'County City'
 
for(i in c(1185, 1206, 1568, 1587, 1746, 2809, 2818, 2828, 2832, 2846, 2875, 2876, 2903, 2904, 2921, 2922)) {
  fatal_crash_data$County[i] <- substr(fatal_crash_data$County[i], 1, nchar(fatal_crash_data$County[i]) - 7)
}

# See which counties do not match up between fatal_crash_data and combined_demographic dataframe

## Read in combined dataframe
combined_demographic <- readRDS("C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic_with_centers_of_pop_hispanic_health_ins.rds")

diff <- setdiff(combined_demographic$County.Name, fatal_crash_data$County)
diff
# Make changes to fatal_crash_data 'County' column to account for differences 
## Many of the counties in combined_demographic dataframe are not there in fatal_crash_data:
    ### Aleutians East Borough
    ### Hoonah-Angoon Census Area
    ### Lake and Peninsula Borough
    ### Petersburg Borough
    ### Prince of Wales-Hyder Census Area
    ### Sitka City and Borough
    ### Skagway Municipality
    ### Wrangell City and Borough
    ### Yakutat City and Borough
    ### Kalawao County
    ### Fallon County
    ### Banner County
    ### Tyrrell County
    ### Foster County
    ### Buena vista city
    ### Falls Church city
    ### Manassas Park city

fatal_crash_data$County[68] <- "Aleutians West Census Area"
fatal_crash_data$County[69] <-  "Anchorage Municipality"
fatal_crash_data$County[70] <-  "Bethel Census Area"
fatal_crash_data$County[71] <-  "Bristol Bay Borough"
fatal_crash_data$County[72] <-  "Denali Borough"
fatal_crash_data$County[73] <-  "Dillingham Census Area" 
fatal_crash_data$County[74] <-  "Fairbanks North Star Borough"
fatal_crash_data$County[75] <-  "Haines Borough"
fatal_crash_data$County[76] <-  "Juneau City and Borough"
fatal_crash_data$County[77] <-  "Kenai Peninsula Borough"
fatal_crash_data$County[78] <-  "Ketchikan Gateway Borough"
fatal_crash_data$County[79] <-  "Kodiak Island Borough"
fatal_crash_data$County[80] <-  "Matanuska-Susitna Borough"
fatal_crash_data$County[81] <-  "Nome Census Area"
fatal_crash_data$County[82] <-  "North Slope Borough"
fatal_crash_data$County[83] <-  "Northwest Arctic Borough"
fatal_crash_data$County[84] <-  "Southeast Fairbanks Census Area" 
fatal_crash_data$County[85] <-  "Valdez-Cordova Census Area"
fatal_crash_data$County[86] <-  "Kusilvak Census Area"
fatal_crash_data$County[87] <-  "Yukon-Koyukuk Census Area"
fatal_crash_data$County[311] <-  "District of Columbia"

fatal_crash_data_Louisiana <- fatal_crash_data[fatal_crash_data$State == "Louisiana", ]
rows_Louisiana <- as.numeric(rownames(fatal_crash_data_Louisiana))
for(i in rows_Louisiana) {
  fatal_crash_data$County[i] <- substr(fatal_crash_data$County[i], 1, nchar(fatal_crash_data$County[i]) - 7)
  fatal_crash_data$County[i] <- paste(fatal_crash_data$County[i], "Parish")
}

diff <- setdiff(combined_demographic$County.Name, fatal_crash_data$County)
to_remove <- c("Aleutians East Borough", "Hoonah-Angoon Census Area", "Lake and Peninsula Borough", "Petersburg Borough", "Prince of Wales-Hyder Census Area", "Sitka City and Borough", "Skagway Municipality", "Wrangell City and Borough", "Yakutat City and Borough", "Kalawao County")
diff <- diff[! diff %in% to_remove]
diff

fatal_crash_data$County[1132] <-  "LaSalle Parish"
fatal_crash_data$County[1206] <-  "Baltimore city"
fatal_crash_data$County[1785] <- "Doña Ana County"
fatal_crash_data$County[2397] <- "Oglala Lakota County"
fatal_crash_data$County[2818] <- "Charles City County"
fatal_crash_data$County[2846] <- "James City County"
fatal_crash_data$County[2903] <- "Fairfax city"
fatal_crash_data$County[2904] <- "Franklin city"
fatal_crash_data$County[2921] <- "Richmond city"
fatal_crash_data$County[2922] <- "Roanoke city"



library(stringr)
for(i in c(2895:2929)) {
  fatal_crash_data$County[i] <- str_replace(fatal_crash_data$County[i], "County", "city")
}

diff <- setdiff(combined_demographic$County.Name, fatal_crash_data$County)
to_remove_2 <- c("Fallon County", "Banner County", "Tyrrell County", "Foster County", "Buena Vista city", "Falls Church city", "Manassas Park city")
diff <- diff[! diff %in% to_remove]
diff <- diff[! diff %in% to_remove_2]
## Should be empty
diff


# Add fatal crash data columns to combined demographic dataframe 

combined_demographic$'Total_Fatal_Crashes_2013' <- NA
combined_demographic$'Total_Fatal_Crashes_2014' <- NA
combined_demographic$'Total_Fatal_Crashes_2015' <- NA
combined_demographic$'Total_Fatal_Crashes_2016' <- NA
combined_demographic$'Total_Fatal_Crashes_2017' <- NA
combined_demographic$'Total_Fatal_Crashes_2018' <- NA
combined_demographic$'Total_Fatal_Crashes_2019' <- NA


# Merging fatal crash data with combined demographic dataframe

fatal_crash_columns <- c('Total_Fatal_Crashes_2013', 'Total_Fatal_Crashes_2014', 'Total_Fatal_Crashes_2015', 'Total_Fatal_Crashes_2016', 'Total_Fatal_Crashes_2017', 'Total_Fatal_Crashes_2018', 'Total_Fatal_Crashes_2019')

for(row in 1:nrow(fatal_crash_data)) {
  county <- fatal_crash_data$County[row]
  state <- fatal_crash_data$State[row]
  combined_indeces <- as.numeric(rownames(combined_demographic[combined_demographic$County.Name == county & combined_demographic$State.Name == state, ]))
  combined_demographic[combined_indeces, fatal_crash_columns] <- fatal_crash_data[row, c(5:11)]
}

saveRDS(combined_demographic, "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/combined_demographic_with_centers_of_pop_hispanic_health_ins_fatal_crash.rds")

install.packages("writexl")
library(writexl)
write_xlsx(combined_demographic, "C:/Users/jainar/Documents/Gap Year/Trauma Center Stanford Research Project/NHGIS Census Block Group Data/Combined demographic - final.xlsx")
