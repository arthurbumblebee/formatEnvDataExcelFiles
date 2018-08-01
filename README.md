# formatEnvDataExcelFiles
In here, I massage, curate and format excel data files containing environmental data to be used for the website (https://env.bigelow.org/).
# Steps to follow
* Make sure you have gnumeric installed.
    * Do that by running this brew command:
    * brew install gnumeric
* Now change directory (cd) into data folder I.e. where the excel files and other scripts are.
* Put the raw excel data files in the data folder
* Do a few modifications to each excel file for formatting
    * for each file:
        * Add two rows to the top of the file
            * Columns of row 1 are: location, latitude, and longitude
            * And columns of row 2 are the respective location, latitude, and longitude values
￼
* Each file will now be renamed according to the place where its data was collected e.g Bigelow.csv
* Additionally, try and keep the time data format in the series to 24hour format (I later added support for 12hour format). The time will then be formatted into the format "YYYY-MM-DD HH:mm:ss"
* Now run the formatRawDataFiles.sh file by running this command:
    * sh formatRawDataFiles.sh  
* Go ahead and copy the generated csv files to the recordedData folder in the data folder of the environmental_data website.
* Then copy the locations.csv file in the locations folder to the locations folder in the data folder of the environmental_data website


