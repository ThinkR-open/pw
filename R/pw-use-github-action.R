#' Add the Gihub Action YAML for Playwright
#'
#' @return Used for side effect
#' @examples
#' if (FALSE){
#'   pw_use_github_action()
#' }
#' @export
#' @importFrom rlang check_installed
pw_use_github_action <- function() {
  check_installed(
    "usethis",
    "to add GitHub Actions to your project"
  )
  usethis::use_github_action(
    url = "https://github.com/ThinkR-open/pw/blob/main/inst/playwright.yml"
  )
}
