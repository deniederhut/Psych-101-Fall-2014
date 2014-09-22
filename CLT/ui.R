
library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Exploring the Central Limit Theorem"),
  
  sidebarLayout(
    sidebarPanel(
      h1("Options"),
      p("Choose different options for population distributions and sample sizes to see
       what happens to your distribution of sample means"),
      radioButtons("distro", label = "Poplation distribution",
                   choices = c("Normal" = "norm",
                               "Uniform" = "unif",
                               "Geometric" = "geo",
                               "Exponential" = "exp")),
      numericInput("n", label = "Sample size", value = 10, min = 1, max = 100)),
    mainPanel(
      p("The population distribution and distribution of sample means 
        produced by your options appears below, with a normal curve
        superimposed on top"),
      plotOutput("distribution", hoverId = "Original distribution")),
    position = 'right'
  )
))
