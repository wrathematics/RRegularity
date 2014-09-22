library(RRegularity)

re_new() %>% 
  .start_with(3, "digit") %>%
  .then("-")  %>%
  .then(2, "letter") %>%
  .maybe("#") %>%
  .one_of(c("a", "b")) %>%
  .between(c(2, 4), "a") %>%
  .end_with("$")


