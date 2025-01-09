#' Initialize Playwright
#'
#' This function initializes a Playwright project in the tests folder.
#'
#' @param where The path to the package
#' @param ... Additional arguments to pass to `npx create-playwright@latest`
#'
#' @export
#' @examples
#' \dontrun{
#' pw_init()
#' }
#' @importFrom fs dir_exists file_delete file_copy dir_create
#' @importFrom withr with_dir
#' @importFrom cli cli_abort cat_line cli_alert_success
#' @importFrom crayon bold
#' @importFrom golem add_positconnect_file get_golem_wd
#' @importFrom here here

pw_init <- function(
  where = golem::get_golem_wd(),
  ...
) {
  if (unname(Sys.which("npx")) == "") {
    cli_abort(
      "npx is not installed. Please install Node.js to use Playwright."
    )
  }
  with_dir(
    where,
    {
      if (file.exists(here("app.R"))) {
        add_positconnect_file(open = FALSE)
      }
      if (!dir_exists("tests")) {
        cli_abort(
          "No tests folder found. Please run `usethis::use_testthat()` first."
        )
      }
      with_dir(
        "tests",
        {
          dir_create("playwright")
          with_dir(
            "playwright",
            {
              system2(
                "npx",
                c(
                  "create-playwright@latest",
                  "--",
                  "--yes",
                  "--no-examples",
                  "--quiet"
                )
              )
              file_delete("playwright.config.ts")
              file_copy(
                pw_sys_files("playwright.config.ts"),
                "playwright.config.ts"
              )
              dir_create("tests")
              file_copy(
                pw_sys_files("default.test.ts"),
                "tests/default.test.ts"
              )
            }
          )
          file_copy(
            pw_sys_files("test-playwright.R"),
            "testthat/test-playwright.R"
          )
        }
      )
    }
  )


  cli_alert_success(
    "Playwright project initialized successfully.\nTry running devtools::test() to see the tests in action."
  )
}
