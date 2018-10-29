# Audio-Searching-Tool
An audio searching tool that will accept any user input audio segments with more than 3 seconds and search across our database to return the song’s information and will also return the full length song back to user. Moreover, the audio searching tool will also create a playlist that sort all the searched songs based on the beat per minute. 

## Introduction
The program done mainly using bash script to carry out the tasks. The file structure of the program lays out such that all the original full song will be stored in a specific folder called original, the original song will then be trim into 30, 1 second portions and run a sound analyzing software that will provide meaningful data about the song and that information will be stored in another folder called portion as a text file. Then, the name, locations and track number will be stored in another text file called name.txt. Our scripts will also update label.txt so that every time a new song is added, the script will add 30 on the label. 
	After that, user will run the condor script to submit a fragment of audio and the script shall copy the original full song into a playlist folder in the condition that the song exist in our data folder. Then, the condor script will also sort the playlist folder according to the beats per minute and return a suggested playlist in a text file format. 

## Tools
*SoX - SoX is used to process and retrieve meaningful data for each audio file to make further comparison.
*bpm-tools - Bpm-tools serves as a tool to calculate the tempo of audio files in beats-per-minutes. 

## Data Folder
In order to use sox to get the audio information, the audio file must be in wav format. 
### Portion.sh
This script will be handling new songs that are added to the original folder and needed to be trim into portions so that it will appear in the search results. The script will first trim the songs into 1 sec portions and then run sox to get the meaningful information for each portion and stored it in a text file. The scripts will then put the track number, track location and the track name in name.txt. Lastly, the script will remove all the trim audio .wav files, so that it doesn’t build up the cluster. 

## Script 
### Split.sh
Split.sh will trim the user input’s audio into 1 second portion and use run sox to fetch the useful information and cat it to the playlist folder for searching.

### Search.sh
Search.sh will first cut all the values from the text file, so it only contains all the floating value and using bc and sed, the script will calculate the absolute value of the percentage difference. Then, the program will check if the difference is less than 2%, if it’s, the script will put the track number into temp folder in playlist that stated the track number. 

### Copy.sh
Copy.sh will find the highest matching portion number from the search.sh and find the location of the song in references to the track number in /portion/name.txt. Then it will check if it’s greater than 3, then the script will copy the original song to the playlist folder. 

### Bpm_sorting.sh
This script will take in all the audio files in the directory returned from portion.sh and starts to convert all the audio files to .mp3 format. After that, the audio files will be analyzed in term of beats-per-minute and save it back to the directory. The detailed song names will be printed to a text file, then the script will start to sort the playlist. 

## Instruction
1.Run bash portion.sh <filename> and the script should return 30 1 sec portions of the song and stored it in the portion folder with name and track number in name.txt. label.txt will also increment by 30, every time a new track is added. Make sure you input the full directory of the song and update filelist.txt in the portion folder.

2.Input an audio to run the tracking and modify split.submit and change the argument name to the input audio. Then, run the command condor_submit_dag audiotrack.dag, the original song shall now copy to the playlist folder and you can check the output on copy.out to check whether the song is found or not. After the DAG ran completely, it should generate a suggested playlist called bpmsorted.txt that sort according to the beats per minute.

## Acknowledgement 
### JiaYeh Beh 
