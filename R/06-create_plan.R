#' Calculates actual duration of tasks accounting for holidays
#'
#' Produces an actual planning calendar with public holidays
#'
#' @param projectname project name
#'
#' @export
#'

create_plan <- function(projectname) {
  dir.create(file.path("munge", projectname))
  file.copy("./data/template/budget-template.xlsx", file.path("munge", projectname, paste0(projectname, ".xlsx")))
  file.copy("./data/template/template-script.R", file.path("munge", projectname, paste0(projectname, ".R")))
}
