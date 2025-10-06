#' Install playwright in an already inited project
#'
#' This function runs playwright init in a project
#' that has been previously initiated with `{pw}`
#'
#' @inheritParams pw_init
#'
#' @export

pw_install <- function(
  where = golem::get_golem_wd()
) {
  stop_if_npx_not_available()
  playwright_test_folder <- file.path(
    where,
    "tests",
    "playwright"
  )
  if (
    Negate(dir.exists)(
      playwright_test_folder
    )
  ) {
    stop(
      "The playwright test folder doesn't exist, please run pw_init() first."
    )
  }
  withr::with_dir(
    playwright_test_folder,
    {
      system2(
        "npm",
        c(
          "install"
        )
      )
      system2(
        "npx",
        c(
          "playwright",
          "install",
          "--with-deps"
        )
      )
    }
  )
}
