# pw (development version)

- `pw_install()` run both `npm install` & `npx playwright install` in the test directory. This is mainly to be used when a package has been inited somewhere else.

- `with_test_id()` adds a `data-testid` attribute to a shiny tag. This is useful for testing with `getByTestId` in Playwright.

- `pw_show_report()` can be called to open the test report

- `pw_codegen()` can be called to launch the code generator

- `pw_test()` stops if the playwright skeleton is missing

- Functions to test if npx is in the PATH

- Initial version with `pw_init()` & `pw_test()`
