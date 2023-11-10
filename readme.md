# Presenting Our Results

## Deploying to Google Firebase

At `https://console.firebase.google.com`  

Select "hosting"

Install Firebase CLI with: `sudo npm install -g firebase-tools`  

`firebase login --no-localhost`

Login and authenticate. The `--no-localhost` flag is needed when running from a container.

`firebase init`  

Choose the option fo Firebase Hosting and select the project. Then provide the project directory the files are in. For me this was: `/config/workspace/the_kester_weather_station/charting`. Set it up as a single page app