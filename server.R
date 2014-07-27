library(shiny)
shinyServer(
  function(input, output){
    #
    # Get inputs and assign to output variables to display what users entered
    #
    output$tankSize <- renderText(input$tankSize)
    output$mpg <- renderText(input$mpg)
    #
    # Calculate remaining gas in gallons and miles available and assign to output
    # variables for display
    #
    output$remaining <- renderText({calculateRemaining(input$tankSize, input$used)})
    output$availDist <- renderText({calculateAvailDist(input$tankSize, input$mpg, input$used)})
  }
)

# Function to calculate Gallons remaining
calculateRemaining <- function (tankSize,  used) 
{
  result <- (tankSize * (1-(used/100)))
  return(round(result, digits = 2))
}

# Function to calculate distance in miles available
calculateAvailDist <- function (tankSize, mpg, used) 
{
  result <- (tankSize * (1-(used/100))) * mpg
  return(round(result, digits = 2))
}
