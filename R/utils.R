pw_sys_files <- function(...) {
  system.file(
    ...,
    package = "pw"
  )
}

#' @importFrom cli cli_abort
stop_if_playwright_skeleton_not_present <- function(
  where = golem::get_golem_wd()
) {
  playwright_test <- !fs::dir_exists(
    fs::path(
      where,
      "tests",
      "playwright"
    )
  )
  playwright_config <- !file.exists(
    fs::path(
      where,
      "tests",
      "playwright",
      "playwright.config.ts"
    )
  )
  node_modules <- !fs::dir_exists(
    fs::path(
      where,
      "tests",
      "playwright",
      "node_modules"
    )
  )

  if (
    any(
      playwright_test,
      playwright_config,
      node_modules
    )
  ) {
    cli_abort(
      "Playwright skeleton not found. Please run `pw::pw_init()` first."
    )
  }
}
