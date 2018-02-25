#David Bayerl
#Ds 745 -Project 1

library(shiny)

shinyServer(function(input, output) {
  #gather cleaned data saved on my github
  birth_raw<- RCurl::getURL("https://raw.githubusercontent.com/Dbayerl/DS745-Vizualization-Project/master/births.csv")
  birth_rates<-read.csv(text = birth_raw)
  poverty_raw<-RCurl::getURL("https://raw.githubusercontent.com/Dbayerl/DS745-Vizualization-Project/master/Poverty.csv")
  poverty_rates<-read.csv(text = poverty_raw)
  education_raw<-RCurl::getURL("https://raw.githubusercontent.com/Dbayerl/DS745-Vizualization-Project/master/Education.csv")
  dropout_rate<-read.csv(text = education_raw)
  labor_raw<-RCurl::getURL("https://raw.githubusercontent.com/Dbayerl/DS745-Vizualization-Project/master/Employment.csv")
  labor_rate<-read.csv(text = labor_raw)

  
  #graphs
  output$plots <-renderPlot(
    if(input$Graphs == "Poverty Rate"){
      lattice::xyplot(All.Races + White + Black + Asian~Year, data= poverty_rates, type='l', ylab = "Percentage of Racial Group", main ="Poverty Rate", auto.key=T)
    }
    else if (input$Graphs == "Single Motherhood Rate"){
      lattice::xyplot(All.Races + White + Black + Asian~Year, data= birth_rates, type='l', ylab = "Percentage of Racial Group", main ="Single Motherhood Rate", auto.key =T)
    }
    else if (input$Graphs == "Unemployment Rate"){
      lattice::xyplot(All + White + Black + Asian~Year, data= labor_rate, type='l', ylab = "Percentage of Racial Group", main ="Unemployment Rate", auto.key =T)
    }
    else{
      lattice::xyplot(All + White + Black + Asian~Year, data= dropout_rate, type='l', ylab = "Percentage of Racial Group", main ="High School Dropout Rate", auto.key =T)
    }
  )
 
  
})
