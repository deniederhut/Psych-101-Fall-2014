#!/usr/bin/Rscript

# R server script for reordering list of hyperlinks

library(shiny)

links <- c('https://docs.google.com/a/berkeley.edu/forms/d/1J6VpyHBjTcoO-4RcBlHW-B64Nwgeu8qwJAvUyPDIX4k/viewform?c=0&w=1', 
           'http://goo.gl/forms/1sTRCWHFkJ', 
           'https://www.surveymonkey.com/s/DNBFKDY', 
           'https://qtrial2014az1.az1.qualtrics.com/SE/?SID=SV_723mzw0fxV7ZiZf', 
           'https://qtrial2014az1.az1.qualtrics.com/SE/?SID=SV_d0XLNZzhf8LOQAt', 
           'https://www.surveymonkey.com/s/UCBpsych101', 
           'https://www.surveymonkey.com/s/HZK2L2T', 
           'http://goo.gl/forms/56Gfk9tyzK', 
           'http://ucbpsych.qualtrics.com/SE/?SID=SV_6hVaWdu09lbbMHz', 
           'https://qtrial2014az1.az1.qualtrics.com/SE/?SID=SV_ehrxUrXq0McFEtD', 
           'http://bit.ly/1wqpqpY', 
           'https://www.surveymonkey.com/s/8C3Z7CL', 
           'https://www.surveymonkey.com/s/8NJ66DY', 
           'https://www.surveymonkey.com/s/ZVHMPKG', 
           'https://qtrial2014az1.az1.qualtrics.com/SE/?SID=SV_9oQTqvIbvtFBwIl', 
           'https://www.surveymonkey.com/s/VKP7K5F', 
           'https://qtrial2014az1.az1.qualtrics.com/SE/?SID=SV_9MoayTqF8cUKHat', 
           'https://qtrial2014az1.az1.qualtrics.com/SE/?SID=SV_0JUeETTifs1PBB3', 
           'https://qtrial2014az1.az1.qualtrics.com/SE/?SID=SV_bNou9yvMdaJPnvL', 
           'https://www.surveymonkey.com/s/MCS86FT', 
           'http://goo.gl/forms/DXppgRKMti',
           'https://www.surveymonkey.com/s/UCBpsych101',
           'https://www.surveymonkey.com/s/PGQ9LQJ',
           'https://www.surveymonkey.com/s/q239pfk'
)

shinyServer(function(input, output) {
  output$list <- renderTable({
  data.frame(list = sample(x = links, size = length(links), replace = FALSE))      
  })
})
