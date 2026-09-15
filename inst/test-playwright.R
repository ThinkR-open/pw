test_that("playwright tests are working", {
  skip_on_cran()
  # In a non interactive context,
  # we don't want to run this test
  # as we will run them independently
  skip_if_not(
    interactive()
  )
  skip_if_not(
    pw::npx_is_available()
  )
  withr::with_dir("../playwright", {
    res <- system2(
      "npx",
      c(
        "playwright",
        "test"
      )
    )
  })
  # Exit with code 0 means that the tests passed
  expect(
    res == 0,
    "The playwright tests did not pass"
  )
})
