library(shiny)
library(ggplot2)
library(png)

shinyServer(function(input, output) {
  hou<-read.csv("shotsHou.csv")
  
  output$shotchart <- renderPlot({
    court <- readPNG('court.png')
    pn <- input$playername
    ggplot(hou[hou$PlayerName==pn & hou$Period %in% input$quarter,], aes(X.Coord,Y.Coord))+ annotation_raster(court, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf) +geom_point(aes(col=as.factor(ShotMadeDummy)))+ coord_fixed(ratio=1,xlim = c(-250, 250),ylim=c(-52.5,417.5))
})
    })