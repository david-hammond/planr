#' Calculates actual duration of tasks accounting for holidays
#'
#' Produces an actual planning calendar with public holidays
#'
#' @param projectname project name
#'
#' @export
#'

create_plan <- function(projectname) {
  n = length(list.dirs("./munge/"))-1
  fildername = paste(sprintf("%03d", n), projectname, sep = "-")
  foldername = file.path("munge", projectname)
  dir.create(foldername)
  foldername = file.path(foldername, "version-1")
  dir.create(foldername)
  file.copy("./data/template/budget-template.xlsx", file.path(foldername, paste0(projectname, ".xlsx")))
  file.copy("./data/template/template-script.R", file.path(foldername, paste0(projectname, ".R")))
  setwd(foldername)
}
