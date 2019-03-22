
#!/usr/bin/env R

library(tidyverse)
library(sparklyr)
library(rsparkling)
library(h2o)
library(arrow)
library(recipes)
library(jsonlite)
library(plumber)

r <- plumb("/home/stefan/non_packrat/Analytics_template/src/models/predict.R ")
r(host = "0.0.0.0", port=8000)

