#' Check adif lines for <eoh>
#'
#' This needs to be changes to character base but will probably work
#' for the skcc logger for now
#'
#' @param line a line from an adif file
#' @keywords adif, tag
#' @return a boolean:
#' @export
is_adif_eoh <- function(line) {
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
is_adif_eor <- function(line) {
    grepl("<EOR>", toupper(line))
}

#' Check for any tag
#'
#' This needs to be changes to character base but will probably work
#' for the skcc logger for now
#' @param line a line from an adif file
#' @keywords adif, tag
#' @return tag and data
#' @export
tag_scan <- function(line) {
  fore <- gsub("^(.*)<(.*):(.*)>(.*)$","\\1",line,ignore.case = TRUE)
  tag <- gsub("^(.*)<(.*):(.*)>(.*)$","\\2",line,ignore.case = TRUE)
  span <- gsub("^(.*)<(.*):(.*)>(.*)$","\\3",line,ignore.case = TRUE)
  aft <- gsub("^(.*)<(.*):(.*)>(.*)$","\\4",line,ignore.case = TRUE)

  return(tag)
}



