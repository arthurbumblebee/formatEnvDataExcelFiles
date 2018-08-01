# Filename: dates.r
# Project: Teacher's Data
# Authors: Arthur Makumbi
# Description: formats the date column in the given csv files to a uniform format : "YYYY-MM-DD HH:mm:ss"

library(lubridate)
# https://www.rdocumentation.org/packages/lubridate/versions/1.7.4/topics/parse_date_time

print ("Formatting dates")

# loop through the data files
filenames = dir(pattern="*.csv")
for (file in filenames) {
   print(file)
    # read in the data file
    data <- read.csv(file, 
                    sep=",",
                    stringsAsFactors=FALSE,
                    check.names=FALSE)
    # data

    # data$date_time <- as.Date(data$date_time, "%m/%d/%Y %h:%m:%s")
    # reformat the data
    data$date_time <- parse_date_time(data$date_time,
                    orders = c("mdy HMSp", "mdy", "Ymd HMSp", "Ymd",
                    "mdy", "mdy HMSp" ), 
                    # "dmy HMS", "dmy", 
                    truncated = 3,
                    train = FALSE
                    )

    # write data back to the csvs
    write.csv(data, 
            file = file,
            quote = FALSE,
            row.names=FALSE)
}