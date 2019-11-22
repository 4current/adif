#'  Read adif header lines until an opening "<" is found
#'
#' This needs to be changes to character base but will probably work
#' for the skcc logger for now
#'
#' @param conn A file connection
#' @export
#' @return A character vector that is the line that caused the exit condition.
#' @examples
#'
#' src <- file.path(getwd(),"adif","tests","sample.adi")
#' conn <- file(src, open="r")
#' res <- get_adif_headers(conn)
#' close(conn)
#' res
get_adif_headers <- function(conn) {

  headers <- c()
  line <- readLines(conn, n = 1)
  # Any line that does not contain the eoh tag can be
  # considered a header
  while ( length(line) > 0 && ! is_adif_eoh(line) ) {
    headers <- append(headers, line)
    line <- readLines(conn, n = 1)
  }

  # At this point, there may be material before the <EOH>
  # we can consider this part of the header

  fore <- gsub("^(.*)<eoh>(.*)$","\\1",line,ignore.case = TRUE)
  aft <- gsub("^(.*)<eoh>(.*)$","\\2",line,ignore.case = TRUE)

  if ( nchar(fore) > 0 ) {
    headers <- append(headers, fore)
  }
  if ( nchar(aft) > 0 ) {
    line <- aft
  }

  result <- list( headers, line )
  names(result) <- c("headers", "records")

  return(result)
}
