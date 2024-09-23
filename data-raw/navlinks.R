## code to prepare `navlinks` dataset goes here
navlinks<-readxl::read_excel("data-raw/Copy of navlinks.xlsx")
usethis::use_data(navlinks, overwrite = TRUE)
