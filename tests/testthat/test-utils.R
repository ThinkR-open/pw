test_that("pw_sys_files returns the correct paths", {
  result <- pw_sys_files("DESCRIPTION")
  expect_true(file.exists(result), info = "The DESCRIPTION file should exist in the package directory.")

  result <- pw_sys_files("non_existent_file.txt")
  expect_equal(result, "", info = "A non-existent file should return an empty string.")

  result <- pw_sys_files()
  expect_true(dir.exists(result), info = "Calling without arguments should return the root of the package.")
})

test_that("stop_if_playwright_skeleton_not_present works as expected", {
  mock_golem_wd <- tempdir()
  on.exit({
    unlink(file.path(mock_golem_wd, "tests", "playwright"), recursive = TRUE)
  })
  dir.create(file.path(mock_golem_wd, "tests", "playwright"), recursive = TRUE)
  file.create(file.path(mock_golem_wd, "tests", "playwright", "playwright.config.ts"))

  # Test when the Playwright skeleton is present
  expect_silent(stop_if_playwright_skeleton_not_present(where = mock_golem_wd))

  # Test when the Playwright skeleton directory is missing
  unlink(file.path(mock_golem_wd, "tests", "playwright"), recursive = TRUE)
  expect_error(
    stop_if_playwright_skeleton_not_present(where = mock_golem_wd),
    "Playwright skeleton not found. Please run `pw::pw_init()` first.",
    fixed = TRUE
  )

  # Test when the Playwright configuration file is missing
  dir.create(file.path(mock_golem_wd, "tests", "playwright"), recursive = TRUE)
  unlink(file.path(mock_golem_wd, "tests", "playwright", "playwright.config.ts"))
  expect_error(
    stop_if_playwright_skeleton_not_present(where = mock_golem_wd),
    "Playwright skeleton not found. Please run `pw::pw_init()` first.",
    fixed = TRUE
  )
})

