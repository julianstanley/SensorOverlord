# Sensor classes

#' An S4 class to represent a 2-state sensor
#'
#' @slot Rmin To represent the ratio emission value R in the minimum state
#' @slot Rmax to represent the ratio emission value R in the maximum state
#' @slot delta To represent the ratio between emission in the maximum and
#' minimum states in the second wavelength of the ratio.
#'
#' @export
#' @import methods
setClass("Sensor",
         slots =
             list(Rmin = "numeric", Rmax = "numeric", delta = "numeric"))

setValidity("Sensor",
            function(object) {
                if (object@Rmin >= object@Rmax)
                    "Rmin must be smaller than Rmax"
                if ((object@Rmin < 0) |
                    (object@Rmax < 0) | (object@delta) < 0)
                    "All parameters must be positive"
                else
                    TRUE
            })

#' An S4 class to represent a 2-state redox sensor
#'
#' @slot e0 The midpoint potential of the redox sensor
#' @examples
#' testSensor <- new("redoxSensor",
#'                     new("Sensor", Rmin = 1, Rmax = 5, delta = 0.2), e0 = -275)
#' @export
setClass("redoxSensor",
         slots =
             list(e0 = "numeric"),
         contains = "Sensor")

#' An S4 class to represent a 2-state pH sensor
#'
#' @slot Rmin To represent the ratio emission value R in the protenated state
#' @slot Rmax to represent the ratio emission value R in the deprotenated state
#' @slot delta To represent the ratio between emission in the
#' deprotenated and protenated states in the second wavelength of the ratio.
#' @slot pKa The midpoint/pKa of the pH sensor
#' @export
setClass("pHSensor",
         slots =
             list(pKa = "numeric"),
         contains = "Sensor")

#' An S4 class to represent a 2-state ligand sensor
#'
#' @slot Rmin To represent the ratio emission value R in the bound state
#' @slot Rmax to represent the ratio emission value R in the unbound state
#' @slot delta To represent the ratio between emission in the
#' unbound and bound states in the second wavelength of the ratio.
#' @slot pKd The midpoint/pKd of the ligand sensor
#' @export
setClass("ligandSensor",
         slots =
             list(pKd = "numeric",
                  ligand_name = "character"),
         contains = "Sensor")
