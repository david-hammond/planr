#' Calculates actual duration of tasks accounting for holidays
#'
#' Produces an actual planning calendar with public holidays
#'
#' @param projectname project name
#'
#' @export
#'

create_plan <- function(projectname) {
  n = length(list.dirs("munge")) - 1
  foldername = paste(sprintf("%02d", n), projectname, sep = "-")
  dir.create(file.path("munge", foldername))
  file.copy("./data/template/budget-template.xlsx", file.path("munge", foldername, paste0(projectname, ".xlsx")))
  file.copy("./data/template/template-script.R", file.path("munge", foldername, paste0(projectname, ".R")))
  setwd(file.path("munge", foldername))
}
