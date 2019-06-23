complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating ## the location of the CSV files
  ## 'id' is an integer vector indicating the monitor ID numbers ## to be used
  ## Return a data frame of the form:
  ## id nobs ## 1	117
  ## 2	1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the ## number of complete cases
  
  all.data <- data.frame(id=numeric(), nobs=numeric()) 
  for (i in id) {
    filename <- paste(directory, "/", formatC(i, width = 3, format = "d", flag = "0"), ".csv", sep = "")
    #print(filename)
    datum <- read.csv(filename)
    datum.no.na <- sum(!is.na(datum$sulfate) & !is.na(datum$nitrate))
    all.data[nrow(all.data) + 1,] <- list(i,datum.no.na)
    #print(length(all.data))
  }
  all.data  
}