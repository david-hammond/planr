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
#' @importFrom ganttrify ganttrify
#' @importFrom kableExtra kbl collapse_rows row_spec save_kable
#'
#' @return Actual duration of tasks
#' @examples
#' #To include Christmas
#' create_calendar(plan, holiday_dates = as.Date("2023-12-25"),  weekend_days = c("saturday", "sunday"))
#' @export
#'

cost_plan <- function(plan, currency, filename) {
  budget = plan %>% select(wp, activity, staff, staff_cost, num_staff, days, total_days, total_cost) %>%
    mutate(iso_code = currency) %>% left_join(currency_info %>% select(iso_code, symbol)) %>%
    mutate(staff_cost = scales::dollar(staff_cost, prefix = symbol),
           total_cost = scales::dollar(total_cost, prefix = symbol)) %>%
    filter(!(num_staff == 0 & !is.na(days))) %>%
    select(-symbol, -iso_code)
  options(knitr.kable.NA = '')
   budget %>%
    kbl(format="latex", booktabs=TRUE,col.names = c("Work Package",
                                                    "Activity",
                                                    "Staff Level",
                                                    "Daily Rate",
                                                    "Number of Staff",
                                                    "Days Per Staff",
                                                    "Total Days",
                                                    "Total Cost")) %>%
    collapse_rows(columns = 1,
                  valign = "middle") %>%
    row_spec(c(0,(nrow(budget)-2):nrow(budget)), bold = TRUE) %>%
    save_kable(filename)
  return(budget)
}
