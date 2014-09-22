
library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Exploring the Central Limit Theorem"),
  
  sidebarLayout(
    sidebarPanel(
      h1("Options"),
      p("Choose different options for population distributions and sample sizes to see
       what happens to your distribution of sample means"),
      radioButtons("distro", label = "Poplation distribution",
                   choices = c("Normal" = "normal",
                               "Uniform" = "uniform",
                               "Geometric" = "geometric",
                               "Exponential" = "exponential")),
      numericInput("n", label = "Sample size", value = 1, min = 1, max = 100)),
    mainPanel(
      p("The population distribution and distribution of sample means 
        produced by your options appear below"),
      plotOutput("distribution", hoverId = "Original distribution"),
      plotOutput("sampling", hoverId = "Distribution of sample means")),
    position = 'right'
  )
))
