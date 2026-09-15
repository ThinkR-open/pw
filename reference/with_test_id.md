# Add a data-testid attribute to a tag

This function adds a data-testid attribute to a shiny tag. This is
useful for testing with `getByTestId` in Playwright.

## Usage

``` r
with_test_id(tag, test_id)
```

## Arguments

- tag:

  A shiny tag

- test_id:

  A string to use as the value of the data-testid attribute

## Value

A shiny tag with the data-testid attribute added
