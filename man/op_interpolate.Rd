% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/op_interpolate.R
\name{op_interpolate}
\alias{op_interpolate}
\title{Interpolate missing or low-confidence values in a dataset}
\usage{
op_interpolate(data, confidence_threshold, missing = TRUE)
}
\arguments{
\item{data}{A data frame containing x, y, confidence columns, and grouping columns (\code{person}, \code{region}).}

\item{confidence_threshold}{A numeric value specifying the confidence threshold below which
values will be interpolated.}

\item{missing}{Logical. If TRUE, interpolate missing values (\code{NA}) in addition to low-confidence values.}
}
\value{
A modified data frame with interpolated x and y values for low-confidence or missing rows.
}
\description{
This function performs interpolation for x and y coordinate columns in a dataset
based on confidence thresholds. It groups the data by \code{person} and \code{region} and
uses spline interpolation to estimate missing or low-confidence values.
}
\examples{
# Example dataset
data <- data.frame(
  person = rep(1:2, each = 5),
  region = rep(1:2, each = 5),
  x1 = c(NA, 1, 2, 3, NA, 4, 5, 6, NA, 8),
  y1 = c(NA, 10, 20, 30, NA, 40, 50, 60, NA, 80),
  c1 = c(NA, 0.95, 0.8, 0.99, NA, 0.7, 0.6, 0.85, NA, 0.9)
)
op_interpolate(data, confidence_threshold = 0.9, missing = TRUE)

}
