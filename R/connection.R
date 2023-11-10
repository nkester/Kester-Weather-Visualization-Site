library(RPostgreSQL)
library(DBI)
library(readr)

# Load the connection credentials stored in a separate RData file.
load(file = "./charting/connectionInfo.RData")

con <- DBI::dbConnect(drv = RPostgreSQL::PostgreSQL(),
                      dbname = db,
                      host = host,
                      port = port,
                      user = user,
                      password = password)

# DBI::dbGetQuery(conn = con,
#                 statement = "SELECT * FROM sensor_data WHERE type = 'Air Humidity' LIMIT 10")

measures <- DBI::dbGetQuery(conn = con,
                            statement = "SELECT * FROM sensor_data")


DBI::dbDisconnect(conn = con)

readr::write_csv(x = measures, 
                 file = "./charting/weatherstation.csv",
                 col_names = TRUE,
                 eol = "\n")

rm(list = ls())



###  CREATE ROLE dataview WITH LOGIN PASSWORD 'Qb8Hc6aEUGFR';
### GRANT SELECT ON sensor_data TO dataview;