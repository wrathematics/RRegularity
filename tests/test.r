### Tests translated from the Ruby version
library(RRegularity)


t1 <- re_new() %>% re_start_with('f')
t2 <- "^f"
all.equal(t1, t2)


t1 <- re_new() %>% re_start_with(".")
t2 <- "^\\."
all.equal(t1, t2)


t1 <- re_new() %>% re_start_with(3, "x")
t2 <- "^x{3}"
all.equal(t1, t2)


t1 <- re_new() %>% re_append("x") %>% re_append("y") %>% re_append("z")
t2 <- "xyz"
all.equal(t1, t2)


t1 <- re_new() %>% re_start_with("x") %>% re_maybe("y") %>% re_then("z")
t2 <- "^xy?z"
all.equal(t1, t2)


t1 <- re_new() %>% re_between(c(0, 2), "digit") %>% re_then(".") %>% re_end_with("$")
t2 <- "[0-9]{0,2}\\.\\$$"
all.equal(t1, t2)


t1 <- re_new() %>% re_append("x") %>% re_maybe("y") %>% re_append("z")
t2 <- "xy?z"
all.equal(t1, t2)


t1 <- re_new() %>% re_append("x") %>% re_not("y") %>% re_append("z")
t2 <- "x(?!y)z"
all.equal(t1, t2)


t1 <- re_new() %>% re_append("w") %>% re_one_of(c("x", "y")) %>% re_append("z")
t2 <- "w[x|y]z"
all.equal(t1, t2)


t1 <- re_new() %>% re_between(c(2, 4), "x")
t2 <- "x{2,4}"
all.equal(t1, t2)


t1 <- re_new() %>% re_at_least(3, "x")
t2 <- "x{3,}"
all.equal(t1, t2)


t1 <- re_new() %>% re_zero_or_more("a") %>% re_then("b")
t2 <- "a*b"
all.equal(t1, t2)


t1 <- re_new() %>% re_zero_or_more("digit")
t2 <- "[0-9]*"
all.equal(t1, t2)


t1 <- re_new() %>% re_one_or_more("a") %>% re_then("b")
t2 <- "a+b"
all.equal(t1, t2)


t1 <- re_new() %>% re_one_or_more("letter")
t2 <- "[A-Za-z]+"
all.equal(t1, t2)


t1 <- re_new() %>% re_append("x") %>% re_end_with("y")
t2 <- "xy$"
all.equal(t1, t2)


t1 <- re_new() %>% re_append("x") %>% re_end_with("$")
t2 <- "x\\$$"
all.equal(t1, t2)


t1 <- re_new() %>% re_start_with("w") %>% re_one_of(c("x", "y")) %>% re_end_with("z")
t2 <- "^w[x|y]z$"
all.equal(t1, t2)


t1 <- re_new() %>% re_append(2, "digit")
t2 <- "[0-9]{2}"
all.equal(t1, t2)


t1 <- re_new() %>% re_append(3, "uppercase")
t2 <- "[A-Z]{3}"
all.equal(t1, t2)


t1 <- re_new() %>% re_append(3, "alphanumeric")
t2 <- "[A-Za-z0-9]{3}"
all.equal(t1, t2)


t1 <- re_new() %>% re_append(4, "space")
t2 <- " {4}"
all.equal(t1, t2)


t1 <- re_new() %>% re_append(2, "whitespace")
t2 <- "\\s{2}"
all.equal(t1, t2)


t1 <- re_new() %>% re_append(1, "tab")
t2 <- "\\t{1}"
all.equal(t1, t2)



t1 <- "^[0-9]{3}-[A-Za-z]{2}#?[a|b]a{2,4}\\$$"
t2 <- re_new() %>% 
  re_start_with(3, "digit") %>%
  re_then("-")  %>%
  re_then(2, "letter") %>%
  re_maybe("#") %>%
  re_one_of(c("a", "b")) %>%
  re_between(c(2, 4), "a") %>%
  re_end_with("$")
all.equal(t1, t2)


