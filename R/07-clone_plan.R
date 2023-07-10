#' Calculates actual duration of tasks accounting for holidays
#'
#' Produces an actual planning calendar with public holidays
#'
#' @param projectname project name
#'
#' @export
#'

clone_plan <- function(projectname) {
  n = as.numeric(gsub("\\D", "", getwd()))
  foldername = paste("version", n + 1, sep = "-")
  setwd("..")
  dir.create(foldername)
  R.utils::copyDirectory(paste("version", n, sep= "-"), foldername)
  setwd(foldername)
}
