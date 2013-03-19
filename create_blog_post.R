library(knitr)
library(markdown)

args <- commandArgs(TRUE)

rmd_name <- args[[1]]
base_name <- strsplit(rmd_name, '\\.')[[1]][[1]]
md_name <- paste(base_name, ".md", sep="")
html_name <- paste(base_name, ".html", sep = "")

knit(rmd_name, md_name) # create markdown file 

header <- "<html><head>"
open.css <- "<style>"
css <- paste(readLines("markdown.css"), collapse=" ")
close.css <- "</style>"
r_syntax_css <- paste(readLines("r_syntax.css"), collapse = " ")
r_syntax_js <- paste(readLines("r_syntax.js"), collapse = " ")
end_header <- "</head><body>"
fragment <- renderMarkdown(md_name, renderer = 'HTML')
disqus_code <- paste(readLines("disqus.snippet"), collapse=" ")
footer <- "</body></html>"

html <- paste(header, open.css, css, close.css, r_syntax_css, r_syntax_js, end_header, fragment, disqus_code, footer,
              sep =" ")

fileConn<-file(html_name)
 writeLines(c(html), fileConn)
close(fileConn)
