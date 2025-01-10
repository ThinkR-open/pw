test_that("npx_is_available works as expected", {
  testthat::with_mocked_bindings(
    sys_which = function(...) {
      return("npx")
    },
    expect_true(npx_is_available())
  )
  testthat::with_mocked_bindings(
    npx_is_available = function(...) {
      return(FALSE)
    },
    cli__abort = function(...){
      stop()
    },
    {
      expect_false(npx_is_available())
      expect_error(stop_if_npx_not_available())
    }
  )
})
