#!/bin/bash

# Filename: formatRawDataFiles.sh
# Project: Teacher's Data
# Authors: Arthur Makumbi
# Description: 
# format raw excel files to csv format
# remember to install gnumeric first. Do that by running this brew command
# brew install gnumeric

echo "Running the formating script"
# ssconvert Ann_Speth_2015.xlsx Ann_Speth_2015.csv

# remove special characters in file name
for file in *.xls{,x}  # for files ending in .xls or .xlsx
    do mv -v "$file" $(echo "$file" | tr '/ ,-' '_');
done
    
# convert all files to csv
for file in *.xls{,x}  # for files ending in .xls or .xlsx
    do ssconvert "$file" "${file%.*}.csv"; 
done
echo "Done converting to csv"
