#'  Read adif record lines until an  "<eor>" is found
#'
#'  This needs to be changed to character base but will probably work
#'  for the skcc logger for now
#'
#'  @param con A file connection
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

getRecord <- function(con) {
  fields <- c()
  line = readLines(con, n = 1)
  while (length(line) > 0 && !isEOR(line))  {
    fields <- append(fields, line)
    line = readLines(con, n = 1)
  }
  print(fields)
  return(line)
}
