# write some data
conn<-file("test.adi", open="w")
writeLines(c("Abra: Cadabra", "Open: sesame",
             "dada <eoh> let the records begin"), conn)
close(conn)

conn<-file("test.adi", open="r")
results <- get_adif_headers( conn )
close(conn)

context("get_adif_headers")
expect_length(results, 2)
expect_named(results)

headers <- results[["headers"]]
expect_vector(headers)
expect_length(headers, 3)

records <- results[["records"]]
expect_vector(records)
expect_length(records, 1)


