# R Implementation of Andrew Berls' Regularity: https://github.com/andrewberls/regularity
# This is pretty much a direct translation, including his original
# descriptions

re_new <- function() ""



# The line must start with the specified pattern
re_start_with <- function(x, ...)
{
  pattern <- interpret(...)
  paste0("^", x, pattern)
}



# Append a pattern to the end (Also aliased to then)
re_then <- function(x, ...) paste0(x, interpret(...))
re_append <- re_then



# The line must end with the specified pattern
re_end_with <- function(x, ...) paste0(x, interpret(...), "$")



# Zero or one of the specified pattern
re_maybe <- function(x, ...) paste0(x, paste0(interpret(...), "?"))



# Specify a negative lookahead, i.e. something not followed by the specified pattern
re_not <- function(x, ...) paste0(x, sprintf("(?!%s)", interpret(...)))



# Specify an alternation, e.g. one_of(['a', 'b', 'c'])
re_one_of <- function(x, ...) 
{
  l <- list(...)[[1L]]
  paste0(x, paste0("[", paste(l, collapse="|"), "]"))
}



# Specify a bounded repetition, e.g. between([2,4], :digits)
re_between <- function(x, range, pattern)
{
  if (length(range) != 2)
    stop("TODO")
  
  range <- paste(range)
  for (i in 1:2)
  {
    if (range[i] == "NA")
      range[i] <- ""
  }
  
  paste0(x, interpret(pattern), "{", range[1L], ",", range[2L], "}")
}



# Specify that the pattern or identifer should appear zero or many times
re_zero_or_more <- function(x, ...) paste0(interpret(...), "*")



# Specify that the pattern or identifer should appear one or many times
re_one_or_more <- function(x, ...) paste0(interpret(...), "+") 



# Specify that the pattern or identifer should appear n or more times
re_at_least <- function(x, times, pattern) re_between(x, range=c(times, NA), pattern=pattern)



#Specify that the pattern or identifer should appear n or less times
re_at_most <- function(x, times, pattern) re_between(x, range=c(NA, times), pattern=pattern)

