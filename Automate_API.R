library(httr)
library(jsonlite)
library(mnsentinellakes)
library(tidyverse)
library(pbapply)
setwd("/Users/catherinepolik/Desktop/Desktop/Grad School/Year 1/Research/Katie Timeseries Files/Outputs")

####Inital MPCA Download to build Timeseries_v6 ######
##Extract DOWs from data set
Timeseries <- read.csv("Timeseries_v6.csv") %>%
  mutate(DOW = fixlakeid(DOW))

DOWs <- unique(Timeseries$DOW)
DOWs_dash <- paste0(substr(DOWs,1,2), "-", substr(DOWs,3,6), "-", substr(DOWs,7,8))

#append DOWs that were removed due to combining double basins but are needed to pull data from MPCA
DOWs_api <- append(DOWs_dash, c("27-0028-01","27-0028-02",
                                   "27-0191-01","27-0191-02",
                                   "27-0089-01","27-0089-02",
                                   "82-0090-00","82-0159-00"))

##loop through DOWs for api query (this can take ~30 min)
this_result <- pblapply(seq_along(1:308), function(i) {
  api.query<-httr::GET(paste0("https://services.pca.state.mn.us/api/v1/surfacewater/monitoring-stations/results?wid=",as.character(DOWs_api[i]),"&format=json"))
  
  api.content <- httr::content(api.query, as='text')
  
  api.JSON <- jsonlite::fromJSON(api.content)
  
  lake.data <- api.JSON[["data"]]
  data.frame(lake.data)
})

TEST <- do.call(rbind, this_result)

write.csv(TEST, file = "MPCA_MassDownload_20240521.csv")
write.csv(DOWs_api, file = "DOWs_for_API.csv")
