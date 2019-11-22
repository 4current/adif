# set up
conn <- file("sample.adi", open="r")
get_adif_headers( conn )
results <- get_adif_record(conn)
close(conn)

context("get_adif_record")
expect_length(results, 2)
expect_named(results)

fields <- results[["fields"]]
expect_vector(fields)
expect_length(fields, 21)


