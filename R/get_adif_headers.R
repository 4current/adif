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
  line = readLines(conn, n = 1)
  while (length(line) > 0 && !grepl("<", toupper(line))) {
    headers <- append(headers, line)
    line = readLines(conn, n = 1)
  }

  result <- list(headers,line)
  names(result) <- c("headers", "end_marker")

  return(result)
}
