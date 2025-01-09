
# pw

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The purpose of `{pw}` is to streamline the use of [Playwright](https://playwright.dev/) for testing your `{golem}` applications.

## Installation

You can install the development version of `{pw}` like so:

``` r
pak::pak("thinkr-open/pw")
```

## Workflow

### Requirements

- Ensure that **npm** (with **npx**) is installed on your computer.
- You must be working within a `{golem}` project.
- The default test structure should be present (if not, run `usethis::use_testthat()` to set it up).

### Initializing Playwright Testing

To set up Playwright testing in your `{golem}` project, execute the following command:

```r
pw::pw_init()
```

This function will:

1. Run `npx create-playwright@latest` in the `tests/playwright` folder.
2. Add the following files to your project:
   - `tests/playwright/playwright.config.ts` (updated)
   - `tests/playwright/tests/default.test.ts` (created)
   - `tests/testthat/test-playwright.R` (created)

After setup, run `devtools::test()` to confirm that everything is functioning correctly.

## Run the tests

If you want to run the Playwright tests, call:

```r
pw::pw_test()
```

## Writing Your Own Tests

Customize the file `tests/playwright/tests/default.test.ts`, or create new test files in the same directory to develop your own Playwright tests.

## Roadmap

- [ ] Integrate support for the Playwright codegen toolkit.
