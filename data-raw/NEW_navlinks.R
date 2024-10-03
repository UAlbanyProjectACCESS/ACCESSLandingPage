## code to prepare `NEW_navlinks` dataset goes here
NEW_navlinks<-read.csv("data-raw/navlinks.csv", header = T, sep=",", encoding = "UTF-8-ROM")
usethis::use_data(NEW_navlinks, overwrite = TRUE)
