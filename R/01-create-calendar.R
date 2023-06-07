#' Creates a calendar with public holidays
#'
#' Produces an actual planning calendar with public holidays
#'
#' @param holiday_dates vector of dates of public holidays
#' @param weekend_days string of dates of public holidays
#'
#' @importFrom bizdays create.calendar
#'
#' @return Planning calendar
#' @examples
#' #To include Christmas
#' create_calendar(holiday_dates = as.Date("2023-12-25"),  weekend_days = c("saturday", "sunday"))
#' @export
#'

create_calendar <- function(holiday_dates = NULL, weekend_days = c("saturday", "sunday")) {
  cal <- create.calendar("actual",
                         holidays = holiday_dates,
                         weekdays = weekend_days)
  return(cal)
}
