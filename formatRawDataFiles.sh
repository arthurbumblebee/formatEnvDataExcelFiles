#!/bin/bash

# Filename: formatRawDataFiles.sh
# Project: Teacher's Data
# Authors: Arthur Makumbi
# Description: calls the scripts in correct order so that the raw data files are curated to be compatible with the website

sh ./formatToCsv.sh
sh ./editHeaders.sh
sh ./formatDates.sh