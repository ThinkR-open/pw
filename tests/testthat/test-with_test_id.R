test_that("with_test_id works", {
  tag <- htmltools::div()
  test_id <- "test-id"
  tag_with_test_id <- with_test_id(tag, test_id)
  expect_equal(
    tag_with_test_id$attribs$`data-testid`,
    test_id
  )
})
