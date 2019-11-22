context("is_adif_eoh")
expect(
  is_adif_eoh( c("<EOH>") ),
  failure_message = "failed to detect <EOH>"
  )

expect(
  is_adif_eoh( c("front matter <EOH> back matter") ),
  failure_message = "failed to detect <EOH>"
)


#expect_false does not take a failure message, go figure
expect_false(
  is_adif_eoh( c("not right") )
)

context("is_adif_eor")
expect(
  is_adif_eor( c("<EOR>") ),
  failure_message = "failed to detect <EOR>"
)

context("tag_scan")
result <- tag_scan( c("xyz <CALL_SIGN:4>W1AW qst") )
expect_length(result,1)
expect_equal(result, c("CALL_SIGN"))


