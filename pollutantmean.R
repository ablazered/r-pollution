pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## ‘directory’ is a character vector of length 1 indicating
  ## the location of the CSV files
  ## ‘pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either “sulfate” or “nitrate”.
  ## ‘id’ is an integer vector indicating the monitor ID numbers
  ## to be used
  ## Return the mean of the pollutant across all monitors list
  ## in the ‘id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

  all.data <- vector(mode="numeric", length=0)
  for (i in id) {
    filename <- paste(directory, "/", formatC(i, width = 3, format = "d", flag = "0"), ".csv", sep = "")
    #print(filename)
    datum <- read.csv(filename)
    datum.no.na <- datum[,pollutant][!is.na(datum[,pollutant])]
    all.data <- c(all.data, datum.no.na)
    #print(length(all.data))
  }
  mean(all.data)
}