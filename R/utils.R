pw_sys_files <- function(...) {
  system.file(..., package = "pw")
}

#' @importFrom cli cli_abort
stop_if_playwright_skeleton_not_present <- function(
  where = golem::get_golem_wd()
) {
  error_msg <- "Playwright skeleton not found. Please run `pw::pw_init()` first."
  if (!fs::dir_exists(fs::path(where, "tests", "playwright"))) {
    cli_abort(
      error_msg
    )
  }
  if (!file.exists(fs::path(where, "tests", "playwright", "playwright.config.ts"))) {
    cli_abort(
      error_msg
    )
  }
}