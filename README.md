md2blog
=======

This is an R script that takes an Rmd (R-flavored markdown file) and creates a ready-to-push blog post. 

To use
======
Suppose the name of your Rmd file is new_post.Rmd. 
Just run: 

> Rscript md2blog.R new_post.Rmd  

and you'll get new_post.html is the same directory. 

To use as a stand-alone script
==============================

Modify you .bash_rc: 

> export PATH=$PATH:~/directory_of_md2blog 

Then you can run: 

> md2blog.R new_post.Rmd

Note
====

This code breaks up the knit stage and the covert-to-html stage. As a result, it creates an intermediar ./figure folder.
The final HTML has the images embedded and does not need this figure folder. 
