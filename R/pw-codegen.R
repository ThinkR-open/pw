#' Run the code generator
#'
#' This function runs the Playwright code generator.
#'
#' @param where The root directory of your golem project
#' @param R_path The path to the R executable
#' @param ... args passed to npx playwright codegen
#'
#' @importFrom withr with_dir
#'
#' @export
pw_codegen <- function(
  where = golem::get_golem_wd(),
  R_path = NULL,
  ...
) {
  stop_if_npx_not_available()
  # This is from golem::expect_running() but that's
  # my own code so that's fine
  if (Sys.getenv("CALLR_CHILD_R_LIBS_USER") == "") {
    pkg_name <- pkgload::pkg_name()
    go_for_pkgload <- TRUE
  } else {
    pkg_name <- Sys.getenv("TESTTHAT_PKG")
    go_for_pkgload <- FALSE
  }
  if (is.null(R_path)) {
    if (tolower(.Platform$OS.type) == "windows") {
      r_ <- normalizePath(file.path(
        Sys.getenv("R_HOME"),
        "bin",
        "R.exe"
      ))
    } else {
      r_ <- normalizePath(file.path(
        Sys.getenv("R_HOME"),
        "bin",
        "R"
      ))
    }
  } else {
    r_ <- R_path
  }
  if (go_for_pkgload) {
    shinyproc <- processx::process$new(
      command = r_,
      c(
        "-e",
        "options(shiny.port = 3000);pkgload::load_all(here::here());run_app()"
      )
    )
  } else {
    shinyproc <- processx::process$new(
      echo_cmd = TRUE,
      command = r_,
      c(
        "-e",
        sprintf(
          "options(shiny.port = 3000); library(%s, lib = '%s');run_app()",
          pkg_name,
          .libPaths()
        )
      ),
      stdout = "|",
      stderr = "|"
    )
  }

  if (!shinyproc$is_alive()) {
    cli::cli_alert_danger("Failed to start the app, please check the logs")
    cat(shinyproc$read_error())
    stop()
  }
  with_dir(
    where,
    {
      with_dir(
        "tests",
        {
          with_dir(
            "playwright",
            {
              output_file <- file.path(
                "tests",
                sprintf(
                  "%s.test.ts",
                  uuid::UUIDgenerate()
                )
              )
              fs::file_create(output_file)
              output_file <- fs::path_abs(output_file)
              on.exit({
                cat(
                  "Code generation done, the file is available at:",
                  output_file,
                  "\n"
                )
              })
              system2(
                "npx",
                c(
                  "playwright",
                  "codegen",
                  "http://localhost:3000",
                  "--output",
                  output_file,
                  ...
                )
              )
            }
          )
        }
      )
    }
  )
}