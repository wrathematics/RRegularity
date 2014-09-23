# FIXME
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

.__RRegularity_ESCAPED_CHARS <- c("*", ".", "?", "^", "+", "$", "|", "(", ")", "[", "]", "{", "}")



prune_s <- function(str) sub(x=str, pattern="s$", replacement="")



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
  for (char in .__RRegularity_ESCAPED_CHARS)
    pattern <- gsub(x=pattern, pattern=char, fixed=TRUE, replacement=paste0("\\", char))
  
  pattern
}



translate <- function(pattern, literal=FALSE)
{
  if (literal)
    return(pattern)
  
  ret <- .__PATTERNS[prune_s(pattern)]
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



# TODO
#write <- function(str, args=NULL)
#{
#  paste0(str, interpret(args))
#}

