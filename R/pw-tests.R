#' Run Playwright tests
#'
#' @param where The path to the package
#' @param ... Additional arguments to pass to `npx playwright test`
#' @importFrom golem get_golem_wd
#' @importFrom withr with_dir
#' @export

pw_test <- function(
  where = golem::get_golem_wd(),
  ...
) {
  stop_if_npx_not_available()
  stop_if_playwright_skeleton_not_present(
    where = where
  )
  with_dir(
    where,
    {
      with_dir("tests", {
        with_dir("playwright", {
          system2(
            "npx",
            c(
              "playwright",
              "test",
              "--config=playwright.config.ts",
              ...
            )
          )
        })
      })
    }
  )
}
