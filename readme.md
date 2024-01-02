# Kester Weather Visualization Site

This is a companion project to my `The Kester Weather Station` project. While that project describes and documents how my son and I configured our home weather station, this project documents how we are interacting with, visualizing, and distributing the data the station collects.  

Links to all projects are below:  

  * `The Kester Weather Station`  
    * Private: https://gitlab.com/nkester-projects/2023_kesterkids_weatherstation/the_kester_weather_station  
    * Public: https://github.com/nkester/Kester-Weather-Station  
    
  * `Kester Weather Visualization Site`  
    * Private: https://gitlab.com/nkester-projects/2023_kesterkids_weatherstation/kester-weather-visualization-site  
    * Public: https://github.com/nkester/Kester-Weather-Visualization-Site  

> Visit the webpage at: https://www.kesterweather.nkester.com/

## This Project's Structure  

Through this project I will document and demonstrate the technical steps we took and the design decisions we made to create and deploy the site. Reference the table of contents below to jump to specific sections.  

  1. [Technical Decisions](#technical-decisions)  
  2. [Architecture](#architecture)  
  3. [Getting Data](#getting-data)  
  4. [Charting with Observable JS](#charting-with-observable-js)  
  5. [Publishing to Google Firebase](#publishing-to-google-firebase)

This site is deployed to Google Cloud Platform's Firebase hosting and is served at the following URL: https://www.kesterweather.nkester.com/ 

## Techical Decisions  

As an initial proof of concept, we decided to build a simple website locally using Quarto (https://quarto.org/), the next evolution of RMarkdown (https://rmarkdown.rstudio.com/), and host it on Google Cloud Platform's (GCP) Firebase Hosting platform. We took this approach for several reasons.  

**First**, Quarto notebooks now support using `R`, `python`, `Julia`, and `Observable JS` interchangeably. This allows us to use languages we are familiar with while extending that knowledge into new capabilities better suited for interactive charting on our webpage. To minimize cost, I don't want to build a full application that requires a server like an `R Shiny` (https://shiny.posit.co/) or a `Python Flask` (https://flask.palletsprojects.com/en/3.0.x/) application. `Observable JS` (https://observablehq.com/) or `ojs` provides that in-browser interactive functionality in a static HTML document. This allows us to write all of the database querying functions and data manipulation in `R`, which I'm most familiar with, and then pass that to `ojs` for user reactive data manipulation and charting.  

**Second**, we decided to build the website locally to start so we would not need to solve the complexities of providing near real time data from our home weather station to our deployed webpage. That will come in the future, but not yet.  

**Third**, we decided to use Google's Firebase Hosting platform to host the webpage because it is familiar to us and because we intend to use GCP services to support future builds of the project.  

## Architecture

## Getting Data

## Charting with Observable JS  

## Publishing to Google Firebase

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

