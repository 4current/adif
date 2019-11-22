expect(
  is_adif_eoh( c("<EOH>") ),
  failure_message = "failed to detect <EOH>"
  )

#expect_false does not take a failure message, go figure
expect_false(
  is_adif_eoh( c("not right") )
)

expect(
  is_adif_eor( c("<EOR>") ),
  failure_message = "failed to detect <EOR>"
)

