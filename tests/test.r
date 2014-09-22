library(RRegularity)


shouldbe <- "^[0-9]{3}-[A-Za-z]{2}#?[a|b]a{2,4}\\$$"

test <- re_new() %>% 
  re_start_with(3, "digit") %>%
  re_then("-")  %>%
  re_then(2, "letter") %>%
  re_maybe("#") %>%
  re_one_of(c("a", "b")) %>%
  re_between(c(2, 4), "a") %>%
  re_end_with("$")

all.equal(shouldbe, test)
