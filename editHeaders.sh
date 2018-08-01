#!/bin/bash

# Filename: editHeaders.sh
# Project: Teacher's Data
# Authors: Arthur Makumbi
# Description: digests the csv files, extracting the geo information, and renaming them accordingly

# https://www.gnu.org/software/sed/manual/html_node/index.html#SEC_Contents

echo "editing locations and headers"
for file in *.csv
    do
    # remove quotes everywhere
    # awk '{gsub(/\"/,"")};1' $file;
    sed -i '' 's/"//g' $file;
    
    # only keep cols 1-4
    cp $file temp.csv &&
    cut -d ',' -f 1-4 <temp.csv >$file &&
    rm temp.csv;

    # save the location in locations file (location data is stored in the second row)
    location=$(sed -n '2p' $file) &&
    location=$(echo "$location" | tr '/ ' '_');
    echo "$location" >> "locations/locations.csv";

    # only keep cols 1-3 in locations file
    cp locations/locations.csv temp.csv &&
    cut -d ',' -f 1-3 <temp.csv > locations/locations.csv &&
    rm temp.csv;

    # remove first four lines
    sed -i '' 1,4d $file;

    # # format dates the old school brute force way...i moved this to use r instead
    # cp $file temp.csv &&
    # while read line
    #     do echo "$(echo $line | cut -d',' -f1),$(date -d "$(echo $line | cut -d',' -f2)" +"%m/%d/%Y %T"),$(echo $line | cut -d',' -f3,4)";
    # done < temp.csv > $file &&
    # rm temp.csv;

    # format headers
    sed -i '' '1s/^/#,date_time,temperature,light_intensity\'$'\n/' $file;

    # rename the file according to location
    new_name=$(cut -d ',' -f 1  <<< "$location");
    # echo "new name is "$new_name;
    new_name=$(echo "$new_name" | tr '/ ,-' '_');
    # echo "new name is "$new_name;

    mv -v "$file" $new_name.csv ;
    # echo "Renamed file to $(cut -d ',' -f 1 <<< "$location"), $file"
done
echo "Done formatting headers and locations"