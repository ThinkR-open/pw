test_that("pw_use_test works", {
  temp_dir <- fs::path_temp(
    "pwtest"
  )
  unlink(
    temp_dir,
    recursive = TRUE
  )
  dir.create(
    file.path(
      temp_dir,
      "tests",
      "playwright",
      "tests"
    ),
    recursive = TRUE
  )
  testthat::with_mocked_bindings(
    stop_if_npx_not_available = function(...) NULL,
    stop_if_playwright_skeleton_not_present = function(...) NULL,
    {
      pw_use_test(
        name = "my_test",
        where = temp_dir
      )
    }
  )
  expect_true(
    file.exists(
      fs::path(
        temp_dir,
        "tests",
        "playwright",
        "tests",
        "my_test.test.ts"
      )
    )
  )
  unlink(
    temp_dir,
    recursive = TRUE
  )
})
