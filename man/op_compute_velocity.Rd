% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/op_compute_velocity.R
\name{op_compute_velocity}
\alias{op_compute_velocity}
\title{Compute Velocity}
\usage{
op_compute_velocity(
  data,
  fps = NULL,
  video_duration = NULL,
  overwrite = FALSE,
  merge_xy = FALSE
)
}
\arguments{
\item{data}{A data frame containing the columns to process.}

\item{fps}{Frames per second, used to compute velocity.}

\item{video_duration}{Video duration in seconds, used to compute fps.}

\item{overwrite}{Logical value indicating whether to remove original 'x' and 'y' columns.}

\item{merge_xy}{Logical value indicating whether to merge x and y columns using Euclidean distance.}
}
\value{
A data frame with velocity columns added and 'c' columns removed.
}
\description{
This function calculates the velocity for each column that begins with 'x' and 'y'
and removes all columns that start with 'c'. It takes either the fps or the video
duration as input to compute the velocity.
}
