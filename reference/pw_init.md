# Initialize Playwright

This function initializes a Playwright project in the tests folder.

## Usage

``` r
pw_init(
  where = golem::get_golem_wd(),
  create_playwright_version = "1.17.138",
  create_playwright_args = c("--no-examples", "--quiet")
)
```

## Arguments

- where:

  The path to the package

- create_playwright_version:

  Version of create-playwright to use

- create_playwright_args:

  Additional arguments to pass to npx create-playwright

## Examples

``` r
if (FALSE) { # \dontrun{
pw_init()
} # }
```
