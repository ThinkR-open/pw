#' Add a new Playwright test
#'
#' This function adds a new Playwright test file to the `tests/playwright/tests` directory.
#'
#' @param name The name of the test to add (without .test.ts extension)
#' @param where The path to the package
#' @importFrom fs file_copy
#' @importFrom withr with_dir
#' @export
pw_use_test <- function(
  name,
  where = golem::get_golem_wd()
) {
  if (missing(name) || !is.character(name) || length(name) != 1) {
    stop("Please provide a single test name as a string.")
  }
  stop_if_npx_not_available()
  stop_if_playwright_skeleton_not_present(
    where = where
  )
  with_dir(
    where,
    {
      with_dir("tests", {
        with_dir("playwright", {
          with_dir("tests", {
            file_copy(
              pw_sys_files(
                "default.test.ts"
              ),
              sprintf(
                "%s.test.ts",
                name
              )
            )
          })
        })
      })
    }
  )
}
