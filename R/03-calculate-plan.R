#' Calculates actual duration of tasks accounting for holidays
#'
#' Produces an actual planning calendar with public holidays
#'
#' @param plan vector of dates of public holidays
#' @param weekend_days string of dates of public holidays
#'
#' @importFrom lubridate today
#' @importFrom projmanr critical_path
#' @importFrom dplyr mutate select distinct rename filter
#'
#' @return Actual duration of tasks
#' @examples
#' #To include Christmas
#' create_calendar(plan, holiday_dates = as.Date("2023-12-25"),  weekend_days = c("saturday", "sunday"))
#' @export
#'

calculate_plan <- function(plan, plan_start_date, holiday_dates = NULL, weekend_days = c("saturday", "sunday")) {
  plan <- plan %>% filter(include_in_gantt == 1) %>%
    mutate(duration = days)
  df = plan %>% select(id, activity, duration, pred) %>%
    rename(name = activity) %>% distinct() %>% mutate(pred = replace_na(pred, "")) %>%
    mutate(pred = factor(pred), name = factor(name)) %>%
    critical_path(start_date = plan_start_date, holiday_dates = holiday_dates)
  crit = crit$results
  crit = crit %>% select(id, start_date, end_date) %>% mutate(id = as.numeric(id)) %>%
    distinct()
  tmp = plan %>% left_join(crit) %>% distinct() %>%
    select(-id) %>% select(wp, activity, start_date, end_date) %>%
    distinct()
  return(tmp)
}
