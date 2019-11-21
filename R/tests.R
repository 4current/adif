### running library tests
fPath <- paste0(Sys.getenv("HOME"),"/Dropbox/ham/SKCCLogger/Logs/wes112019.adi")

con = file(fPath, "r", blocking=TRUE)

currentLine <- getHeaders(con)
print(isEOH(currentLine))

currentLine <- getRecord(con)
while ( length(currentLine > 0 ) )  {
  currentLine <- getRecord(con)
}

