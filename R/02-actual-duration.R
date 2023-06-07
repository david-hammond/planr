#' Calculates actual duration of tasks accounting for holidays
#'
#' Produces an actual planning calendar with public holidays
#'
#' @param plan vector of dates of public holidays
#' @param weekend_days string of dates of public holidays
#'
#' @importFrom bizdays offset create.calendar remove_calendars
#' @importFrom lubridate today
#'
#' @return Actual duration of tasks
#' @examples
#' #To include Christmas
#' create_calendar(plan, holiday_dates = as.Date("2023-12-25"),  weekend_days = c("saturday", "sunday"))
#' @export
#'

calculate_actual_duration <- function(plan, holiday_dates = NULL, weekend_days = c("saturday", "sunday")) {
  create.calendar("actual",
                         holidays = holiday_dates,
                         weekdays = weekend_days)
  plan <- plan %>% mutate(duration = as.numeric(offset(today(), days, cal)-today()))
  remove_calendars("actual")
  return(plan)
}
