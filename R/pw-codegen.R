pw_codegen <- function(
  where = golem::get_golem_wd()
) {
  with_dir(
    where,
    {
      with_dir(
        "tests",
        {
          with_dir(
            "playwright",
            {
              system2(
                "npx",
                c(
                  "playwright",
                  "codegen"
                )
              )
            }
          )
        }
      )
    }
  )
}