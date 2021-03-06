% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{R_of_E}
\alias{R_of_E}
\title{What was the recorded fluorescence ratio at a certain redox potential?}
\usage{
R_of_E(E, Rmin, Rmax, delta, e0, temp = 295.15)
}
\arguments{
\item{E}{the redox potential}

\item{Rmin}{the minimum possible ratiometric fluorescence}

\item{Rmax}{the maximum possible ratiometric fluorescence}

\item{delta}{the ratiometric fluorescence in the first wavelength}

\item{e0}{the sensor's midpoint potential}

\item{temp}{the temperature at which measurements were made}
}
\value{
the ratiometric fluorescence associated with the given parameters
}
\description{
What was the recorded fluorescence ratio at a certain redox potential?
}
\examples{
R_of_E(E = -254.5305, Rmin = 1, Rmax = 5, delta = 0.2, e0 = -275)

# This is self-consistent with the E() function.
R_of_E(
  E = E(R = 3, Rmin = 1, Rmax = 5, delta = 0.2, e0 = -275),
  Rmin = 1, Rmax = 5, delta = 0.2, e0 = -275
)
}
