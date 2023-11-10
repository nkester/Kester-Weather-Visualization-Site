# Kester Weather Visualization Site

This is a companion project to my `The Kester Weather Station` project. While that project discribes and documents how my son and I configured our home weather station, this project documents how we are interacting with, visualizing, and distributing the data we collect through our weather station.  

Links to all projects are below:  

  * `The Kester Weather Station`  
    * Private: https://gitlab.com/nkester-projects/2023_kesterkids_weatherstation/the_kester_weather_station  
    * Public: https://github.com/nkester/Kester-Weather-Station  
  * `Kester Weather Visualization Site`  
    * Private: https://gitlab.com/nkester-projects/2023_kesterkids_weatherstation/kester-weather-visualization-site  
    * Public: https://github.com/nkester/Kester-Weather-Visualization-Site  

## Displaying Our Local Weather

This site is deployed to Google Cloud Platform's Firebase and is served at the following URL: https://www.kesterweather.nkester.com/ 

## Deploying to Google Firebase

At `https://console.firebase.google.com`  

Select "hosting"

Install Firebase CLI with: `sudo npm install -g firebase-tools`  

`firebase login --no-localhost`

Login and authenticate. The `--no-localhost` flag is needed when running from a container.

`firebase init`  

Choose the option fo Firebase Hosting and select the project. Then provide the project directory the files are in. For me this was: `/config/workspace/kesterWeatherSite/site`. 

Once you've made the changes you want, enter the command `firebase deploy` to update the website.