# For mocking purpose
sys_which <- function(...) {
  Sys.which(...)
}
cli__abort <- function(...) {
  cli::cli_abort(...)
}
#' Check if 'npx' is available in the system PATH
#'
#' @return TRUE if 'npx' is available, FALSE otherwise
#' @export
#' @examples
#' npx_is_available()
#' @rdname npx-is-available
npx_is_available <- function() {
  # Check if 'npx' is available in the system PATH
  return(unname(Sys.which("npx")) != "")
}

#' @export
#' @rdname npx-is-available
stop_if_npx_not_available <- function() {
  if (!npx_is_available()) {
    cli__abort(
      "npx is not installed. Please install Node.js to use Playwright."
    )
  }
}
