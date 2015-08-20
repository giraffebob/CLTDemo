library(shiny)
library(ggplot2)
shinyServer(
  function(input,output){

      output$CLTgraph <- renderPlot({      size <- input$sampleSize
      nSamples <- input$sampleNumber
      distType <- input$dist
      meansSampled <- NULL
      if (distType=="exp") {
        for (i in 1:nSamples) meansSampled <- c(meansSampled,mean(rexp(size,0.2)))
        theoryMean <- 5
        theorySD <- 5
      }
      else {
        for (i in 1:nSamples) meansSampled <- c(meansSampled,mean(runif(size)))
        theoryMean <- 0.5
        theorySD <- 1/sqrt(12)
      }
      
      g1 <- ggplot(data.frame(Value = meansSampled),aes(x=Value))
      g1 <- g1 + geom_histogram(aes(y=..density..),fill="steelblue")
      g1 <- g1 + theme(axis.line = element_line(colour="black"))
      g1 <- g1 + ggtitle("Sampling Distribution of Chosen Distribution")
      myfun1 <- function(xvar) {dnorm(xvar,mean=theoryMean,sd=theorySD/sqrt(size))}
      g1 <- g1 + stat_function(fun = myfun1,colour="red")
      g1
      
    })
  }
  )