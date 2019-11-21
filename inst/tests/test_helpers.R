expect(
  isEOH( c("<EOH>") ),
  failure_message = "failed to detect <EOH>"
  )

#expect_false does not take a failure message, go figure
expect_false(
  isEOH( c("not right") )
)

expect(
  isEOR( c("<EOR>") ),
  failure_message = "failed to detect <EOR>"
)

