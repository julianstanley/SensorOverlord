% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Sensor_Methods.R
\name{error_df,pHSensor-method}
\alias{error_df,pHSensor-method}
\title{Finds the error df of this pH sensor at given inaccuracies}
\usage{
\S4method{error_df}{pHSensor}(
  object,
  inaccuracies = c(0.01),
  pHmin = 1,
  pHmax = 14,
  by = 0.001,
  name = "Sensor"
)
}
\arguments{
\item{object}{A pHSensor object}

\item{inaccuracies}{(optional, default: c(0.01)) A vector of inaccuracies
(e.g. 0.02 for 2\% error), always relative}

\item{pHmin}{(optional, default: 1)  The minimum pH
for which to record error}

\item{pHmax}{(optional, default: 14) The maximum pH
for which to record error}

\item{by}{(optional, default: 0.001) The granularity of the error table--e.g.,
by = 0.01 would record 7 and 7.01, etc.}

\item{name}{(optional, default: "Sensor") A name for this sensor}
}
\value{
A dataframe of errors with columns:
'Name': this sensor name
'pH': the pH,
'Rmin': the minimum possible ratiometric fluorescence for this sensor
'Rmax': the maximum possible ratiometric fluorescence for this sensor
'Error': the error in this pH
'Inaccuracy': The inaccuracy of the measurements (relative to R).
}
\description{
Adding this method on 31 May 2020, hoping this style will depreciate
getErrorTable in the future.
}
\examples{
my_sensor <- new("pHSensor", new("Sensor", Rmin = 1, Rmax = 5, delta = 0.2), pKa = 7)
error_df(my_sensor,
  inaccuracies = c(0.01, 0.02), pHmin = 1, pHmax = 14,
)
}
