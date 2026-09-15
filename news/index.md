# Changelog

## pw (development version)

- [`pw_install()`](https://github.com/ThinkR-open/golemversetemplate/reference/pw_install.md)
  run both `npm install` & `npx playwright install` in the test
  directory. This is mainly to be used when a package has been inited
  somewhere else.

- [`with_test_id()`](https://github.com/ThinkR-open/golemversetemplate/reference/with_test_id.md)
  adds a `data-testid` attribute to a shiny tag. This is useful for
  testing with `getByTestId` in Playwright.

- [`pw_show_report()`](https://github.com/ThinkR-open/golemversetemplate/reference/pw_show_report.md)
  can be called to open the test report

- [`pw_codegen()`](https://github.com/ThinkR-open/golemversetemplate/reference/pw_codegen.md)
  can be called to launch the code generator

- [`pw_test()`](https://github.com/ThinkR-open/golemversetemplate/reference/pw_test.md)
  stops if the playwright skeleton is missing

- Functions to test if npx is in the PATH

- Initial version with
  [`pw_init()`](https://github.com/ThinkR-open/golemversetemplate/reference/pw_init.md)
  &
  [`pw_test()`](https://github.com/ThinkR-open/golemversetemplate/reference/pw_test.md)
