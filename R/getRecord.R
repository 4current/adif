#'  Read adif record lines until an  "<eor>" is found
#'
#'  This needs to be changed to character base but will probably work
#'  for the skcc logger for now
#'
#'  @param conn A file connection
#'  @keywords adif, headers
#'  @return a character vector:
#'      If character(1) then it is the line that caused the exit condition.
#'      If character(0) then it is the end of file
#'  @export
#'  @examples
#'      con = file(fPath, "r")
#'      currentLine <- getRecord(con)
#'      while ( length(currentLine > 0 ) )  {
#'         currentLine <- getRecord(con)
#'         }

getRecord <- function(conn) {
  fields <- c()
  line = readLines(conn, n = 1)
  while (length(line) > 0 && !isEOR(line))  {
    fields <- append(fields, line)
    line = readLines(conn, n = 1)
  }

  data <- list(fields,line)
  names(data) <- c("fields", "record_terminator")

  return(data)
}
