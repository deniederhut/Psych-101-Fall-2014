library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$distribution <- renderPlot({ 
    if (input$distro == 'normal') dist <- data.frame(x = rnorm(n = 10000, mean = 0, sd = 1))
    if (input$distro == 'uniform') dist <- data.frame(x = runif(n = 10000, min = -3, max = 3))
    if (input$distro == 'geometric') dist <- data.frame(x = rgeom(n = 10000, prob = 0.5))
    if (input$distro == 'exponential') dist <- data.frame(x = rexp(n = 10000, rate = 1))
    dist$norm <- rnorm(n=10000, mean = 0, sd = 1)
    title1 <- paste0("Comparison of the ", input$distro, " and normal curves (dashed red line)")
    plot1 <- ggplot(dist) + geom_density(aes(x = x)) + 
             geom_density(aes(x = norm),colour = 'red', linetype = 'dashed') +  
             ggtitle(title1) + xlab("Values") + ylab("Density")
    print(plot1)
  })
  
  output$sampling <- renderPlot({ ##failing to update dist$x
    dist$sam <- replicate(1000, mean(sample(dist$x, size = input$n, replace = TRUE)))
    title2 <- paste0("Distribution of sample means at size: ", input$n)
    plot2 <- ggplot(dist) + geom_density(aes(x = sam)) +  
      ggtitle(title2) + xlab("Values") + ylab("Density")
    print(plot2)
  })
})