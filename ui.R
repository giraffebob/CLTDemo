library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Central Limit Theorem Demonstrator"),
  sidebarPanel(
    radioButtons("dist","Distribution type:",
    c("Uniform (0,1)"="unif",
    "Exponential (lambda=0.2)" = "exp")),
    sliderInput('sampleNumber','Set Number of Samples',value=1000,min=100,max=2000,step=100),
    sliderInput('sampleSize','Set Sample Size',value=5,min=5,max=100,step=5)
               ,submitButton('Generate Graph'),
    h3('Instructions'),
     p('Use the radio buttons to choose a distribution.'),
     p('Use the top slider to choose the number of samples used to create the histogram.'),
     p('Use the bottom slider to choose the size of individual samples.'),
     p('When you are ready to go, just press the Generate Graph button.'),
     p('You can reset the inputs and plot a new graph as often as you like.')),
  mainPanel(
    plotOutput('CLTgraph'),
    p('The plot shows the sampling distribution of the mean for the distribution set in the side panel. The histogram is produced by simulating
      the sampling distribution using a random number generator. The red curve is the sampling distribution predicted by the theorem.'),
    h3('The Central Limit Theorem'),
    p('The theorem applies to a wide variety of distributions and concerns the asymptotic behaviour of the sampling distribution of the mean.
      It states that this distribution approaches a normal distribution as the sample size tends to infinity. Less formally: take the mean of
      a sample of values from the distribution of interest; repeat for many samples; plot all of the means.
      The plot will look like a normal distribution. The bigger the size of the individual samples, the more normal the output distribution will appear. '),
    h3('This App'),
    p('The app is primarily an educational tool designed to deepen understanding of the theorem through interactive experimentation.
    In other words, play with the numbers and see what happens. Higher sample size should give a better fit to the normal distribution.
    (It also gives a narrower normal distribution, but you need to look at the x-scale to appreciate that.) 
    A higher number of samples should give a smoother histogram and again, a better fit.
    Two alternatives for the original distribution are provided. 
    The exponential distribution is highly skewed and starts further away from normality than the uniform 
    distribution. However, both distributions are covered by the theorem.')
          )
  ))