#' Normalized Function
#'
#' The normalized function takes the minimum and maximum values from each column and normalized
#' the dataset, then takes the mean of each particular wavelength, nm.
#' @param x x = raw dataset, must be a dataframe
#' @return
#' @keywords absorbance
#' @export

normalize_add_rowmeans <- function(x) {
  # For each column, values were normalized."
  for (i in 1:ncol(x)) {
    x[,i] <- (x[,i]- min(x[,i], na.rm = TRUE)) / (max(x[,i],na.rm = TRUE)-min(x[,i], na.rm = TRUE))
    if(is.data.frame(x)!= TRUE)
      warning("not a data frame")
  }

  # the cbind statement creates a new object/column of row means
  # "x" is the input matrix
  # row.means = rowMeans(x)" uses the rowMeans function to the matrix and names the new column "row.means"
  # so now we can make our new object with a column of row means.

  x <- cbind(x,row.means = rowMeans(x))
  x <-  add_column(x, Wavelength = 4000:600)
}


