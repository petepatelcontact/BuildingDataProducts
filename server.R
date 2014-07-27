library(shiny)
shinyServer(
  function(input, output){
    output$tankSize <- renderText(input$tankSize)
    output$mpg <- renderText(input$mpg)
    output$remaining <- renderText({calculateUsed(input$tankSize, input$used)})
    output$availDist <- renderText({calculateAvailDist(input$tankSize, input$mpg, input$used)})
  }
)

calculateUsed <- function (tankSize,  used) 
{
  result <- (tankSize * (1-(used/100)))
  return(round(result, digits = 2))
}

calculateAvailDist <- function (tankSize, mpg, used) 
{
  result <- (tankSize * (1-(used/100))) * mpg
  return(round(result, digits = 2))
}
