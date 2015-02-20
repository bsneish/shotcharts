library(shiny)
hou<-read.csv("shotsHou.csv")
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Houston Rockets Shot Charts"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("playername",
                  "Player Name:",
                  choices = sort(as.character(unique(hou$PlayerName))),
                  selectize = TRUE
    ),
    selectInput("quarter",
                "Quarter:",
                choices = sort(as.character(unique(hou$Period))),
                selectize = TRUE,
                multiple= TRUE,
                selected = c(1,2,3,4,5)
    )
    ),
    
    mainPanel(
      plotOutput("shotchart")
    )
  )
))