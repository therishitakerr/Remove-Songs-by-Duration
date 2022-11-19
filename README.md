# Remove-Songs-by-Duration
bash script to remomve songs which are less than 2 minutes

# Requirements
1. Mediainfo

# How to run

1. copy LessThanTwoMinutes.sh to the folder containing video files

2. add executable permission to the script file
```
chmod +x LessThanTwoMinutes.sh
```
 
3. run script,
```
./LessThanTwoMinutes.sh
```
 
songs with duration less than two minutes will be moved to folder named "toberemoved"
