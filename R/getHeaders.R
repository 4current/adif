#'  Read adif header lines until an opening "<" is found
#'
#'  This needs to be changes to character base but will probably work
#'  for the skcc logger for now
#'
#'  @param conn A file connection
#'  @export
#'  @return A character vector that is the line that caused the exit condition.
#'  @examples
#'  src <- file.path(getwd(),"inst","tests","sample.adi")
#'  conn <- file(src, open="r")
#'  res <- getHeaders(conn)
#'  close(conn)
#'  res
getHeaders <- function(conn) {
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
