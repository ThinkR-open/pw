#' Add the Gihub Action YAML for Playwright
#'
#' @return Used for side effect
#' @examples
#' if (FALSE){
#'   pw_use_github_action()
#' }
#' @export
#' @importFrom usethis use_github_action
pw_use_github_action <- function() {
  use_github_action(
    url = "https://github.com/ThinkR-open/pw/blob/main/inst/playwright.yml"
  )
}
