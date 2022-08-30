
# download the daily GPCP files -------------------------------------------


library("httr")
library("stringr")


file_list <-  read.delim('./data/raw/gpcp/subset_GPCPDAY_3.2_20220830_085513.txt')

file_list <- as.list(read.csv(file = "./data/raw/gpcp/subset_GPCPDAY_3.2_20220830_085513.txt", header = F))


url <- scan(file_list, what = list(""), flush = TRUE)
urls <- unlist(file_list)
#urls <- urls[1:6]

names = substr(urls, 69, 96) #subset the character for naming the files


destination <-  "./data/raw/gpcp/"

for (i in 1:length(urls)){
  #fname <- str_c(destination, urls[i])
  #if (!file.exists(fname)) {
  GET(as.character(urls[i]),
      authenticate("rkpradhan462@gmail.com", "Rkpradhan462"),
      write_disk(path = str_c(destination, names[i]), overwrite = TRUE))
}


##################################################################




for (i in seq_along(urls)) {
  fname <- str_c(destination, urls[i]) 
  if (!file.exists(fname)) {
    GET(as.character(urls[i]),
    authenticate("rkpradhan462@gmail.com", "Rkpradhan462"),
    write_disk(path = str_c(destination, names[i]), overwrite = FALSE))
  }
}
