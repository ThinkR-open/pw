#' Add a data-testid attribute to a tag
#'
#' This function adds a data-testid attribute to a shiny tag. This is useful for testing with `getByTestId` in Playwright.
#' @param tag A shiny tag
#' @param test_id A string to use as the value of the data-testid attribute
#' @return A shiny tag with the data-testid attribute added
#' @export
with_test_id <- function(
  tag,
  test_id
) {
  htmltools::tagAppendAttributes(
    tag,
    `data-testid` = test_id
  )
}
