# Sensor constructors ------

#' A function to convert a sensorSpectra to a Sensor
#'
#' Converts a sensorSpectra object to a Sensor object.
#' A sensor object exists alongside a wavelength ratio (e.g. 410/470),
#' so this function must be supplied those (in the form lambda_1/lambda_2)
#'
#' @param sensorSpectra A sensorSpectra object
#' @param lambda_1 the first wavelength in the
#' excitation ratio lambda_1/lambda_2
#' @param lambda_2 the second wavelength in the
#' excitation ratio lambda_1/lambda_2

#' @return A Sensor object
#'
#' @export
#' @rdname newSensorFromSpectra-function
newSensorFromSpectra <-
    function(sensorSpectra, lambda_1, lambda_2) {
        values_maximum = sensorSpectra@values_maximum
        values_minimum = sensorSpectra@values_minimum
        lambdas = sensorSpectra@lambdas

        if(length(lambda_1) < 2 | length(lambda_2) < 2) {
            stop("Lambda 1 and lambda 2 should be vectors, not scalars.
                 Please enter two values describing the range of possible lambda values.")
        }

        # Make boolean vectors describing which of the lambdas are relevant
        relevant_lambda_1 <-
            (lambdas >= lambda_1[1] & lambdas <= lambda_1[2])
        relevant_lambda_2 <-
            (lambdas >= lambda_2[1] & lambdas <= lambda_2[2])

        # Set the parameters required for a sensor
        delta <- mean(values_maximum[relevant_lambda_2]) /
            mean(values_minimum[relevant_lambda_2])

        Rmin <- mean(values_minimum[relevant_lambda_1]) /
            mean(values_minimum[relevant_lambda_2])

        Rmax <- mean(values_maximum[relevant_lambda_1]) /
            mean(values_maximum[relevant_lambda_2])

        # If Rmin is bigger than Rmax, switch them
        if(Rmin > Rmax) {
            Rmin_new <- Rmax
            Rmax_new <- Rmin
            Rmin <- Rmin_new
            Rmax <- Rmax_new
        }
        # Make a new sensor
        return(new(
            "Sensor",
            Rmax = Rmax,
            Rmin = Rmin,
            delta = delta
        ))
    }
