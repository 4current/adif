#'  Check adif lines for <eoh>
#'
#'  This needs to be changes to character base but will probably work
#'  for the skcc logger for now
#'
#'  @param line
#'  @keywords adif, tag
#'  @return a boolean:
#'  @export
isEOH <- function(line) {
  grepl("<EOH>", toupper(line))
}


#'  Check adif lines for <eor>
#'
#'  This needs to be changes to character base but will probably work
#'  for the skcc logger for now
#'  @param line
#'  @keywords adif, tag
#'  @return a boolean:
#'  @export
isEOR <- function(line) {
    grepl("<EOR>", toupper(line))
}

test_file("./test_helpers.R", reporter="check")









