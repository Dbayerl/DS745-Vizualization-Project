#David Bayerl
#DS 745-Project 1

library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Poverty in the United States"),
  sidebarLayout(
    sidebarPanel(
      selectInput("Graphs", "Select Graph to Examine", c("Poverty Rate", "Single Motherhood Rate", "Unemployment Rate", "High School Dropout Rate")),
      helpText("Note: Data collection for some groups began at a later data than others for certain variables. This will be reflected within certain graphs.")
      ),
      
    mainPanel(
      plotOutput("plots"),
      
      h4("Breaking the cycle of poverty can seem like an impossible challenge for those who are unfortunate enough to be born into it.
         At an early age, children in this position are already limited in opportunities and will likely lack the same kind of support and advantages
         that allow children of middle and upper class families to continue living in their respective income brackets upon reaching adulthood. 
         As such, children in poverty must grow up being able to make smart decisions if they ever hope to reach the middle class."),
      h4("The Brookings Institute shared an interesting online", a("article", href="https://www.brookings.edu/opinions/three-simple-rules-poor-teens-should-follow-to-join-the-middle-class/", target=" _blank"), 
         " back in 2013 offering three simple steps teens and adults can follow if they want to avoid being permanently poor in the United States."),
      pre(h4("1. Finish Highschool" ),
      h4("2. Get a full-time job"),
      h4("3. Dont have a baby out of wedlock")),
      h4("You are encouraged to examine the various graphs presented to see which areas certain groups are struggling with the most.")
    )
  )
    
))
