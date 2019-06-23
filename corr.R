corr <- function(directory, threshold = 0) {

  
  all.data <- vector(mode="numeric", length=0)
  for (i in list.files('specdata', '.*csv', full.names = TRUE)) {
    #print(filename)
    datum <- read.csv(i)
    datum.no.na <- datum[which(!is.na(datum$sulfate) & !is.na(datum$nitrate)), ]
    #print(c(i, nrow(datum), nrow(datum.no.na)))
    if (nrow(datum.no.na) >= threshold && nrow(datum.no.na) > 0) {
      all.data <- c(all.data, cor(datum.no.na$sulfate, datum.no.na$nitrate))
    }
    #print(length(all.data))
  }
  all.data  
}