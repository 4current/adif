#' Check adif lines for <eoh>
#'
#' This needs to be changes to character base but will probably work
#' for the skcc logger for now
#'
#' @param line a line from an adif file
#' @keywords adif, tag
#' @return a boolean:
#' @export
isEOH <- function(line) {
  grepl("<EOH>", toupper(line))
}


#' Check adif lines for <eor>
#'
#' This needs to be changes to character base but will probably work
#' for the skcc logger for now
#' @param line a line from an adif file
#' @keywords adif, tag
#' @return a boolean:
#' @export
isEOR <- function(line) {
    grepl("<EOR>", toupper(line))
}

