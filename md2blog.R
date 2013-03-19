#! /usr/bin/Rscript --vanilla --default-packages=utils

library(knitr)
library(markdown)

resource_dir <- "~/Dropbox/symlinks/md2blog/"

args <- commandArgs(TRUE)

rmd_name <- args[[1]]
base_name <- strsplit(rmd_name, '\\.')[[1]][[1]]
md_name <- paste(base_name, ".md", sep="")
html_name <- paste(base_name, ".html", sep = "")

knit(rmd_name, md_name) # create markdown file 

get.resource <- function(file_name) paste(readLines(paste(resource_dir, file_name, sep="")), collapse = " ")

header <- "<html><head>"
open.css <- "<style>"
css <- get.resource("markdown.css")
close.css <- "</style>"
r_syntax_css <- get.resource("r_syntax.css")
r_syntax_js <- get.resource("r_syntax.js" ) 
end_header <- "</head><body>"
fragment <- renderMarkdown(md_name, renderer = 'HTML')
disqus_code <- get.resource("disqus.snippet")
footer <- "</body></html>"

html <- paste(header, open.css, css, close.css, r_syntax_css, r_syntax_js, end_header, fragment, disqus_code, footer,
              sep =" ")

fileConn<-file(html_name)
 writeLines(c(html), fileConn)
close(fileConn)
