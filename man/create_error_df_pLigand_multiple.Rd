% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{create_error_df_pLigand_multiple}
\alias{create_error_df_pLigand_multiple}
\title{Creates an error df at multiple inaccuracies, with multiple Rmin/Rmax/delta/pKd parameters}
\usage{
create_error_df_pLigand_multiple(
  inaccuracies,
  pLigand_min,
  pLigand_max,
  param_df,
  by = 0.01,
  ligand_name
)
}
\arguments{
\item{inaccuracies}{A vector of inaccuracies (e.g. 0.02 for 2\% error), always relative}

\item{pLigand_min}{The minimum pH for which to record error}

\item{pLigand_max}{The maximum pH for which to record error}

\item{param_df}{A dataframe containing a list of sensor parameters, with these columns:
'name': An identifier for this sensor
'Rmin': the minimum possible ratiometric fluorescence for this sensor
'Rmax': the maximum possible ratiometric fluorescence for this sensor
'delta': the ratiometric fluorescence in the first wavelength for this sensor
'pKd': this sensor's midpoint/pKd}

\item{by}{(optional, default: 0.01) The granularity of the error table--e.g., by = 0.01 would record 275 and 275.01, etc.}

\item{ligand_name}{the name of this ligand}
}
\value{
A dataframe of errors with columns:
'Name': this sensor name
'(ligand_name)': the pLigand
'Rmin': the minimum possible ratiometric fluorescence for this sensor
'Rmax': the maximum possible ratiometric fluorescence for this sensor
'Error': the error in this pLigand
'Inaccuracy': The inaccuracy of the measurements (relative to R).
}
\description{
Creates an error df at multiple inaccuracies, with multiple Rmin/Rmax/delta/pKd parameters
}
\examples{
create_error_df_pLigand_multiple(
  c(0.01, 0.02), 2, 10,
  data.frame(
    "Rmin" = c(1, 2),
    "Rmax" = c(5, 6),
    "delta" = c(0.2, 1.2),
    "name" = c("normal", "plusOne"),
    "pKd" = c(7, 8)
  ),
  ligand_name = "NADPH"
)
}
