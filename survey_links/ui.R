#!/usr/bin/Rscript

# User interface for reordering list of hyperlinks

library(shiny)

shinyUI(fluidPage(
  titlePanel("Class survey links"),
  verticalLayout(
    h1('Refresh to reorder survey links'),
    tableOutput("list")
)))
