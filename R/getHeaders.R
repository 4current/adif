#'  Read adif header lines until an opening "<" is found
#'
#'  This needs to be changes to character base but will probably work
#'  for the skcc logger for now
#'
#'  @param con A file connection
#'  @examples
#'  getHeaders(file("test.adi", "r"))
#'  @return character vector:
#'  If character(1) then it is the line that caused the exit condition.
#'  If character(0) then it is the end of file
getHeaders <- function(con) {
  headers <- c()
  line = readLines(con, n = 1)
  while (length(line) > 0 && !grepl("<", toupper(line))) {
    headers <- append(headers, line)
    line = readLines(con, n = 1)
  }
  print(headers)
  return(line)
}
