% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{create_error_df_pH}
\alias{create_error_df_pH}
\title{Creates a dataframe of errors in pH potential at given inaccuracies}
\usage{
create_error_df_pH(
  inaccuracies,
  pHmin,
  pHmax,
  Rmin,
  Rmax,
  delta,
  pKa,
  by = 0.01
)
}
\arguments{
\item{inaccuracies}{A vector of inaccuracies (e.g. 0.02 for 2\% error), always relative}

\item{pHmin}{The minimum pH for which to record error}

\item{pHmax}{The maximum pH for which to record error}

\item{Rmin}{the minimum possible ratiometric fluorescence}

\item{Rmax}{the maximum possible ratiometric fluorescence}

\item{delta}{the ratiometric fluorescence in the first wavelength}

\item{pKa}{the sensor's midpoint/pKa}

\item{by}{(optional, default: 0.01) The granularity of the error table--e.g., by = 0.01 would record 275 and 275.01, etc.}

\item{temp}{(optional, default: 295.15) the temperature (in Kelvin) at which measurements were made}
}
\value{
A dataframe of errors with columns:
'pH': the pH,
'Error': the error in this pH
'Inaccuracy': The inaccuracy of the measurements (relative to R).
}
\description{
Creates a dataframe of errors in pH potential at given inaccuracies
}
\examples{
create_error_df_pH(c(0.01, 0.02), 2, 10, 1, 5, 0.2, 7)
}
