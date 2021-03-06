library("httr")
library("R.cache")

GetData <- function(x){
  key <- list(x)

  response <- loadCache(key) # If target http data available in cache it'll load immedietly.

  if(exists("response")) {
    cat("reaching out to ", x)
    response <- GET(x, add_headers(customeheader = "CS")) # response object, add customheader
    saveCache(response, key=key, comment="response")
  }
  webpage_data <- ""
  if (http_type(response) == "application/json"){
    webpage_data <- content(response, as="parsed") # if response type is JSON, parsed it to a list
  }else{
    webpage_data <- content(response, as="text") # return text representation of the response body
  }

  return(webpage_data)
}
