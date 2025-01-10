test_that("multiplication works", {
  skip_if_not(
    npx_is_available()
  )
  temp_golem <- file.path(tempdir(), "golem")
  on.exit({
    unlink(temp_golem, recursive = TRUE)
  })
  options("usethis.quiet" = TRUE)
  res <- golem::create_golem(
    path = temp_golem,
    package_name = "pwtest",
    open = FALSE,
    overwrite = TRUE
  )

  testthat::with_mocked_bindings(
    cli__abort = function(...) {
      stop()
    },
    {
      expect_error(
        pw_init(where = temp_golem)
      )
    }
  )
  dir.create(
    file.path(
      temp_golem,
      "tests/testthat"
    ),
    recursive = TRUE
  )
  pw_init(temp_golem, "--quiet")
  expect_true(
    file.exists(
      file.path(
        temp_golem,
        "tests/playwright"
      )
    )
  )
  expect_true(
    file.exists(
      file.path(
        temp_golem,
        "tests/playwright/playwright.config.ts"
      )
    )
  )
  expect_true(
    file.exists(
      file.path(
        temp_golem,
        "tests/playwright/tests/default.test.ts"
      )
    )
  )
  expect_true(
    file.exists(
      file.path(
        temp_golem,
        "tests/testthat/test-playwright.R"
      )
    )
  )
  withr::with_dir(
    temp_golem,
    {
      expect_silent(
        pw_test(where = ".")
      )
    }
  )
})
