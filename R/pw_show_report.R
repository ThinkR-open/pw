#' Show the Playwright report
#'
#' @param where The path to the package
#' @param ... Additional arguments to pass to `npx playwright show-report`
#' @importFrom withr with_dir
#' @export
pw_show_report <- function(
  where = golem::get_golem_wd(),
  ...
){
  stop_if_npx_not_available()
  stop_if_playwright_skeleton_not_present(
    where = where
  )
  with_dir(
    where,
    {
      with_dir(
        "tests",
        {
          with_dir(
            "playwright",
            {
              system2(
                "npx",
                c(
                  "playwright",
                  "show-report",
                  ...
                )
              )
            }
          )
        }
      )
    }
  )
}
