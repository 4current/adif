#' Read adif record lines until an  "<eor>" is found
#'
#' This needs to be changed to character base but will probably work
#' for the skcc logger for now
#'
#' @param conn A file connection
#' @keywords adif, headers
#' @return a character vector:
#'     If character(1) then it is the line that caused the exit condition.
#'     If character(0) then it is the end of file
#' @export
#' @examples
#' src <- file.path(getwd(),"adif","tests","sample.adi")
#' conn <- file(src, open="r")
#' get_adif_headers(conn)
#' res <- get_adif_record(conn)
#' close(conn)
#' res
get_adif_record <- function(conn) {
  fields <- c()
  line = readLines(conn, n = 1)
  while (length(line) > 0 && !is_adif_eor(line))  {
    fields <- append(fields, line)
    line = readLines(conn, n = 1)
  }

  fore <- gsub("^(.*)<eor>(.*)$","\\1",line,ignore.case = TRUE)
  aft <- gsub("^(.*)<eor>(.*)$","\\2",line,ignore.case = TRUE)

  if ( nchar(fore) > 0 ) {
    fields <- append(fields, fore)
  }
  if ( nchar(aft) > 0 ) {
    line <- aft
  }

  data <- list(fields,line)
  names(data) <- c("fields", "record_terminator")

  return(data)
}
