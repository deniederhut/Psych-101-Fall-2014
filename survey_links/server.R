#!/usr/bin/Rscript

# R server script for reordering list of hyperlinks

library(shiny)

links <- c('one', 'two', 'three'
)

shinyServer(function(input, output) {
  output$list <- renderTable({
  data.frame(list = sample(x = links, size = length(links), replace = FALSE))      
  })
})
