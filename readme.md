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

## Plotting with observable

### Resources  
  * https://observablehq.com/plot/features/plots  
  * https://d3js.org/  
  * Data manipulation with Arquero [Quarto](https://quarto.org/docs/interactive/ojs/examples/arquero.html) 
  
  
How to conditionally show marks in a chart. I want to use this to turn on or off certain measures that make sense to be plotted together.  
`https://observablehq.com/@observablehq/plot-optional-marks?intent=fork`  

Passing date data from `R` to `OJS` converts it back to strings. This explains how to parse the data in `OJS`: https://stackoverflow.com/questions/76499928/passing-dates-from-r-chunk-to-ojs-chunk-using-ojs-define-in-quarto 

