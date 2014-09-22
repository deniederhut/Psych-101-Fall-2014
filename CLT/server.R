library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  output$distribution <- renderPlot({
    if (input$distro == 'norm') dist <- data.frame(x = rnorm(n = 10000, mean = 0, sd = 1))
    if (input$distro == 'unif') dist <- data.frame(x = runif(n = 10000, min = -3, max = 3))
    if (input$distro == 'geo') dist <- data.frame(x = rgeom(n = 10000, prob = 0.5) - 1)
    if (input$distro == 'exp') dist <- data.frame(x = rexp(n = 10000, rate = 1) - 1)
    dist$norm <- rnorm(n=10000, mean = 0, sd = 1)
    dist$sam <- replicate(1000, mean(sample(dist$x, size = input$n, replace = TRUE)))
    plot1 <- ggplot(dist) + geom_density(aes(x = norm), linetype = 'dashed') + 
             geom_density(aes(x = x),colour = 'red') + 
             geom_density(aes(x = sam), colour = 'blue') + 
             ggtitle("Comparison of the population, sampling distribution, and normal curve") + 
             xlab("Values") + ylab("Density")
    print(plot1)
  })
})