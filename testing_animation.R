library(plotly)

accumulate_by <- function(dat, var) {
  var <- lazyeval::f_eval(var, dat)
  lvls <- plotly:::getLevels(var)
  dats <- lapply(seq_along(lvls), function(x) {
    cbind(dat[var %in% lvls[seq(1, x)], ], frame = lvls[[x]])
  })
  dplyr::bind_rows(dats)
}

df <- readRDS("C:/Users/limkimhoong/Desktop/New folder/Testing separate/tourism_yearly.rds")

fig1 <- df %>%
  filter(Country %in% c("Denmark"))
