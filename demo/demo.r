library(RRegularity)

re_new() %>% 
  re_start_with(3, "digit") %>%
  re_then("-")  %>%
  re_then(2, "letter") %>%
  re_maybe("#") %>%
  re_one_of(c("a", "b")) %>%
  re_between(c(2, 4), "a") %>%
  re_end_with("$")

