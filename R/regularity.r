# R Implementation of Andrew Berls' Regularity: https://github.com/andrewberls/regularity
# Also MIT licensed because why not

.__PATTERNS = c(
  digit = '[0-9]',
  lowercase = '[a-z]',
  uppercase = '[A-Z]',
  letter = '[A-Za-z]',
  alphanumeric = '[A-Za-z0-9]',
  whitespace = '\\s',
  space = ' ',
  tab = '\\t'
)

ESCAPED_CHARS <- c("*", ".", "?", "^", "+", "$", "|", "(", ")", "[", "]", "{", "}")

#concat <- function(...) paste0(list(...), collapse="")

numbered_constraint <- function(count, type)
{
  pattern <- patterned_constraint(type)
  paste0(pattern, "{", count, "}")
}

patterned_constraint <- function(pattern)
{
  escape(pattern) %>% translate
}

escape <- function(pattern)
{
  for (char in ESCAPED_CHARS)
    pattern <- gsub(x=pattern, pattern=char, fixed=TRUE, replacement=paste0("\\", char))
  
  pattern
}

translate <- function(pattern)
{
  ret <- .__PATTERNS[pattern]
  if (!is.na(ret))
    names(ret) <- NULL
  else
    ret <- pattern
  
  ret
}

interpret <- function(...)
{
  l <- list(...)
  
  if (length(l) == 2)
    ret <- numbered_constraint(l[[1L]], l[[2L]])
  else if (length(l) == 1)
    ret <- patterned_constraint(l[[1L]])
  else stop("TODO")
  
  ret
}

write <- function(str, args=NULL)
{
  paste0(str, interpret(args))
}

.start_with <- function(x, ...)
{
  pattern <- interpret(...)
  paste0("^", x, pattern)
}

.then <- function(x, ...) paste0(x, interpret(...))

.maybe <- function(x, ...) paste0(x, paste0(interpret(...), "?"))

.one_of <- function(x, ...) 
{
  l <- list(...)[[1L]]
  paste0(x, paste0("[", paste(l, collapse="|"), "]"))
}

.between <- function(x, range, pattern)
{
  if (length(range) != 2)
    stop("TODO")
  
  paste0(x, interpret(pattern), "{", range[1L], ",", range[2L], "}")
}

.end_with <- function(x, ...) paste0(x, interpret(...), "$")

re_new <- function() ""

