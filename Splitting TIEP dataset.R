library(xlsx)
TIEP_combined <- read.csv(file = "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_combined_latest_cleaned.csv", header = T)
TIEP_combined[c(7:34)] <- sapply(TIEP_combined[c(7:34)],as.numeric)

TIEP_2013_Level_I_II <- TIEP_combined[which(TIEP_combined$ACS_Ver_2013 == "1" | TIEP_combined$ACS_Ver_2013 == "2"), ]
TIEP_2014_Level_I_II <- TIEP_combined[which(TIEP_combined$ACS_Ver_2014 == "1" | TIEP_combined$ACS_Ver_2014 == "2"), ]
TIEP_2015_Level_I_II <- TIEP_combined[which(TIEP_combined$ACS_Ver_2015 == "1" | TIEP_combined$ACS_Ver_2015 == "2"), ]
TIEP_2016_Level_I_II <- TIEP_combined[which(TIEP_combined$ACS_Ver_2016 == "1" | TIEP_combined$ACS_Ver_2016 == "2"), ]
TIEP_2017_Level_I_II <- TIEP_combined[which(TIEP_combined$ACS_Ver_2017 == "1" | TIEP_combined$ACS_Ver_2017 == "2"), ]
TIEP_2018_Level_I_II <- TIEP_combined[which(TIEP_combined$ACS_Ver_2018 == "1" | TIEP_combined$ACS_Ver_2018 == "2"), ]
TIEP_2019_Level_I_II <- TIEP_combined[which(TIEP_combined$ACS_Ver_2019 == "1" | TIEP_combined$ACS_Ver_2019 == "2"), ]

TIEP_2013_Level_I_II_III_IV <- TIEP_combined[which(TIEP_combined$ACS_Ver_2013 == "1" | TIEP_combined$ACS_Ver_2013 == "2" | TIEP_combined$ACS_Ver_2013 == "3" | TIEP_combined$ACS_Ver_2013 == "4"), ]
TIEP_2014_Level_I_II_III_IV <- TIEP_combined[which(TIEP_combined$ACS_Ver_2014 == "1" | TIEP_combined$ACS_Ver_2014 == "2" | TIEP_combined$ACS_Ver_2014 == "3" | TIEP_combined$ACS_Ver_2014 == "4"), ]
TIEP_2015_Level_I_II_III_IV <- TIEP_combined[which(TIEP_combined$ACS_Ver_2015 == "1" | TIEP_combined$ACS_Ver_2015 == "2" | TIEP_combined$ACS_Ver_2015 == "3" | TIEP_combined$ACS_Ver_2015 == "4"), ]
TIEP_2016_Level_I_II_III_IV <- TIEP_combined[which(TIEP_combined$ACS_Ver_2016 == "1" | TIEP_combined$ACS_Ver_2016 == "2" | TIEP_combined$ACS_Ver_2016 == "3" | TIEP_combined$ACS_Ver_2016 == "4"), ]
TIEP_2017_Level_I_II_III_IV <- TIEP_combined[which(TIEP_combined$ACS_Ver_2017 == "1" | TIEP_combined$ACS_Ver_2017 == "2" | TIEP_combined$ACS_Ver_2017 == "3" | TIEP_combined$ACS_Ver_2017 == "4"), ]
TIEP_2018_Level_I_II_III_IV <- TIEP_combined[which(TIEP_combined$ACS_Ver_2018 == "1" | TIEP_combined$ACS_Ver_2018 == "2" | TIEP_combined$ACS_Ver_2018 == "3" | TIEP_combined$ACS_Ver_2018 == "4"), ]
TIEP_2019_Level_I_II_III_IV <- TIEP_combined[which(TIEP_combined$ACS_Ver_2019 == "1" | TIEP_combined$ACS_Ver_2019 == "2" | TIEP_combined$ACS_Ver_2019 == "3" | TIEP_combined$ACS_Ver_2019 == "4"), ]

write.xlsx(TIEP_2013_Level_I_II, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2013_Level_I_II.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2014_Level_I_II, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2014_Level_I_II.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2015_Level_I_II, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2015_Level_I_II.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2016_Level_I_II, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2016_Level_I_II.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2017_Level_I_II, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2017_Level_I_II.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2018_Level_I_II, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2018_Level_I_II.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2019_Level_I_II, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2019_Level_I_II.xlsx", col.names = T, row.names = F, showNA = F)

write.xlsx(TIEP_2013_Level_I_II_III_IV, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2013_Level_I_II_III_IV.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2014_Level_I_II_III_IV, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2014_Level_I_II_III_IV.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2015_Level_I_II_III_IV, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2015_Level_I_II_III_IV.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2016_Level_I_II_III_IV, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2016_Level_I_II_III_IV.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2017_Level_I_II_III_IV, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2017_Level_I_II_III_IV.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2018_Level_I_II_III_IV, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2018_Level_I_II_III_IV.xlsx", col.names = T, row.names = F, showNA = F)
write.xlsx(TIEP_2019_Level_I_II_III_IV, "C:/Users/Arjun/Documents/Gap Year/Trauma Center Stanford Research Project/Splitting TIEP dataset/TIEP_2019_Level_I_II_III_IV.xlsx", col.names = T, row.names = F, showNA = F)
