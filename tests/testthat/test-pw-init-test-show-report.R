test_that("multiplication works", {
  skip_if_not(
    npx_is_available()
  )
  temp_golem <- file.path(
    tempdir(),
    "golem"
  )
  unlink(
    temp_golem,
    recursive = TRUE,
    force = TRUE
  )
  on.exit({
    unlink(
      temp_golem,
      recursive = TRUE
    )
  })
  options("usethis.quiet" = TRUE)
  ftr_report <- golem::create_golem(
    path = temp_golem,
    package_name = "pwtest",
    open = FALSE,
    overwrite = TRUE,
    check_name = FALSE
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
  pw_init(
    temp_golem,
    "--quiet"
  )
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
  withr::with_dir(
    temp_golem,
    {
      port <- httpuv::randomPort()
      pw_show_report_ <- force(
        pw_show_report
      )
      r <- callr::r_bg(
        package = TRUE,
        function(
          pw_show_report = pw_show_report_,
          port_ = port
        ) {
          pw_show_report(
            where = ".",
            sprintf(
              "--port=%s",
              port_
            )
          )
        }
      )

      on.exit({
        r$kill()
      })
      Sys.sleep(2)
      expect_true(
        attr(
          curlGetHeaders(
            sprintf("http://localhost:%s", port)
          ),
          "status"
        ) ==
          200
      )
    }
  )
})
