---
title: "NIH Progress Report"
author: "Yasmine .G"
date: "Febuary 11, 2020"
output:
  html_document:
  highlight: tango
theme: spacelab
toc: yes
toc_float: yes
---
  
  ```{r setup, include=FALSE, warning = FALSE}
library(knitr, warn.conflicts = F, quietly = T)
library(tidyr, warn.conflicts = F, quietly = T)
library(dplyr, warn.conflicts = F, quietly = T)
library(ggplot2, warn.conflicts = F, quietly = T)
library(keyringr, warn.conflicts = F, quietly = T)
library(redcapAPI, warn.conflicts = F, quietly = T)
library(REDCapR, warn.conflicts = F, quietly = T)
library(lubridate, warn.conflicts = F, quietly = T)
#Create path to and api link to RedCaps
credential_label <- "beach_api"
credential_path <- paste(Sys.getenv("USERPROFILE"), '\\DPAPI\\passwords\\', Sys.info()["nodename"], '\\', credential_label, '.txt', sep="")
uri <- "https://redcap.ctsi.ufl.edu/redcap/api/"
beach_token<-decrypt_dpapi_pw(credential_path)
```

```{r variable selection, include=FALSE}
# Create connections
rcon <- redcapConnection(url=uri, token=beach_token)
# variables
desired_fields=c("test_id","mom3t_hispanic",
                 "mom3t_race_1",
                 "mom3t_race_2",
                 "mom3t_race_3",
                 "mom3t_race_4",
                 "mom3t_race_5",
                 "mom3t_baby_sex",
                 "mom3t_baby_hispanic".
                 "mom3t_baby_race_1",
                 "mom3t_baby_race_2".
                 "mom3t_baby_race_3",
                 "mom3t_baby_race_4",
                 "mom3t_baby_race_5")
# participants
participants.records.v1=c("BLS001A",
                     "BLS033A",
                     "BLS044A",
                     "BLS054A",
                     "BLS058A",
                     "BLS002A",
                     "BLS003A",
                     "BLS008A",
                     "BLS011A",
                     "BLS012A".
                     "BLS014A",
                     "BLS025A",
                     "BLS026A",
                     "BLS027A",
                     "BLS028A",
                     "BLS029A",
                     "BLS030A",
                     "BLS032A",
                     "BLS034A",
                     "BLS035A",
                     "BLS036A",
                     "BLS037A",
                     "BLS038A",
                     "BLS039A",
                     "BLS040A",
                     "BLS041A",
                     "BLS043A",
                     "BLS045A",
                     "BLS048A",
                     "BLS049A",
                     "BLS050A",
                     "BLS051A",
                     "BLS052A",
                     "BLS053A",
                     "BLS055A",
                     "BLS056A",
                     "BLS059A",
                     "BLS060A",
                     "BLS062A",
                     "BLS064A",
                     "BLS065A",
                     "BLS066A",
                     "BLS070A",
                     "BLS073A",
                     "BLS074A",
                     "BLS075A",
                     "BLS078A",
                     "BLS079A",
                     "BLS081A",
                     "BLS083A",
                     "BLS084A",
                     "BLS086A")
# pull data
ds <- data.frame(desired_fields)
dat<- redcap_read(
  batch_size=300,
  records= participants.records.v1,
  redcap_uri = uri, 
  token      = beach_token, 
  fields     = desired_fields
)$data
head(dat)