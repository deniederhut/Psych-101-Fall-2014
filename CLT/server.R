library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
 
  normal <- rnorm(n = 10000, mean = 0, sd = 1)
  uniform <- runif(n = 10000, min = -3, max = 3)
  geometric <- rgeom(n = 10000, prob = 0.5)
  exponential <- rexp(n = 10000, rate = 1)
  dist <- data.frame(norm = rnorm(n=10000, mean = 0, sd = 1))
  
  output$distribution <- renderPlot({ 
    if (input$distro == 'normal') dist$x <- normal
    if (input$distro == 'uniform') dist$x <- uniform
    if (input$distro == 'geometric') dist$x <- geometric
    if (input$distro == 'exponential') dist$x <- exponential
    title1 <- paste0("Comparison of the ", input$distro, " and normal curves (dashed red line)")
    plot1 <- ggplot(dist) + geom_density(aes(x = x)) + 
             geom_density(aes(x = norm),colour = 'red', linetype = 'dashed') +  
             ggtitle(title1) + xlab("Values") + ylab("Density")
    print(plot1)
  })
  
  output$sampling <- renderPlot({
    if (input$distro == 'normal') dist$x <- normal
    if (input$distro == 'uniform') dist$x <- uniform
    if (input$distro == 'geometric') dist$x <- geometric
    if (input$distro == 'exponential') dist$x <- exponential  
    dist$sam <- replicate(1000, mean(sample(dist$x, size = input$n, replace = TRUE)))
    title2 <- paste0("Distribution of sample means at size: ", input$n)
    plot2 <- ggplot(dist) + geom_density(aes(x = sam)) +  
      ggtitle(title2) + xlab("Values") + ylab("Density")
    print(plot2) 
  })
})