#' Calculates actual duration of tasks accounting for holidays
#'
#' Produces an actual planning calendar with public holidays
#'
#' @param plan vector of dates of public holidays
#' @param weekend_days string of dates of public holidays
#'
#' @importFrom bizdays offset create.calendar remove_calendars
#' @importFrom lubridate today
#' @importFrom projmanr critical_path
#' @importFrom dplyr mutate select distinct rename
#' @importFrom ggplot2 ggsave
#' @importFrom ganttrify ganttrify
#'
#' @return Actual duration of tasks
#' @examples
#' #To include Christmas
#' create_calendar(plan, holiday_dates = as.Date("2023-12-25"),  weekend_days = c("saturday", "sunday"))
#' @export
#'

plot_plan <- function(plan, plan_start_date, holiday_dates = NULL) {
  tmp = calculate_plan(plan, plan_start_date, holiday_dates)
  p = ganttrify(project = tmp,
            by_date = T,
            exact_date = T,
            font_family = "Roboto Condensed",
            label_wrap = T)
  return(p)
}
