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

Due to the technical decisions described above, the following are the tools and their interactions we used to implement those decisions. Each tool serves a different purpose and each are described in the following steps.  

All code is contained in the Quarto Markdown Document called [WeatherMeasurements.qmd](R/WeatherMeasurements.qmd). In the following sections of thie "readme" I'll refer to sections by their "Chunk Name" located at the top of each code chunk.

![alt text](img/WeatherSiteArchitecture.png "Weather Site Architecture Diagram")  

Functions:  
[Getting Data](#getting-data)  
[Charting](#charting-with-observable-js)  
[Publishing](#publishing-to-google-firebase)

## Getting Data  

In this initial architecture, all measurement data is stored in a PostgreSQL database on my local home network. For that reason, in order to get to the data I'll need to connect to the database and extract all required data while on my home network. I'll use `R` to perform these operations.  

All code referenced in this section is contained in the code chunks: `{r functions}` and `{r getData}`. 

The `{r functions}` chunk defines two functions used in this part of the process: `agg_query` and `measure_gather`.  I will describe these functions as they are implemented.  

The `{r getData}` chunk is what is executed by `R` at "Render time." I'll walk through this check in order. First, a boolean variable called `update` is defined in chunk `{r setup}` at the top of the document. This determines if the script should get new data from the database or just perform the basic transformation functions of existing data in order to pass it on to the `{ojs}` chunks.  

### Preparing to Get Data

If `update` is defined as `TRUE`, we start by loading the connection information which is stored in an `.RData` file, not included in the source code. It simply defines the five variables required to connect to the database: `db` = the database name, `host` = the database IP address, `port` = the database port, `user` = the database user name, and `password` = the user's password.  

Next, we define a tibble named `measure_spec` that lists the PostgreSQL function we want to use to aggregate each of the measures we collect. This is important because as we combine the measurements for `Air Temperature` over an hour, day, or month, it makes sense to take an average of the measurements rather than the sum. Conversley, when aggregating the measurements for `Rain Guage` it makes more sense to take the sum than the average. We will use this table later to build measurement specific queries in the `agg_query` function.  

This table looks like:  

```
> measure_spec
# A tibble: 8 × 2
  fun   type                 
  <chr> <chr>                
1 avg   Air Humidity         
2 avg   Air Temperature      
3 avg   Barometric Pressure  
4 avg   Light Intensity      
5 sum   Rain Gauge           
6 avg   UV Index             
7 avg   Wind Direction Sensor
8 avg   Wind Speed 
```

Next I define the levels of aggregation I want to build data for. For now, those levels are: `As Measured`, `month`, `day`, and `hour`.  

Finally, we build a tibble with the proper column names and column data types for the `measure_tib` table. Later we will fill this table with data using the `measure_gather` function and then store that in an `RDS` file and pass the data to `{ojs}` for display and interactivity.  

This completes the preparations for data collection. In the next step we will connect to the database and pull in data.  

The 

### Extracting, Transforming, and Loading Data  



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

