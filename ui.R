library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Car Trip Calculator"),
  sidebarPanel(
    #
    # Get Inputs from user for Tank Size and Miles Per Gallon
    # Set min and max values, any values out of this range will show
    # input field in red.
    #
    h4('Car Fuel Capacity'),
    numericInput('tankSize', 'Tank Size (Gallons 12-40)', 18,min = 12, max = 40),
    numericInput('mpg', 'Miles Per Gallon (8-50)', 23,min = 8, max = 50),
    #
    # Get Input from user to get percent of tank used
    # Set min and max values, any values out of this range will show
    # input field in red.
    #
    h4('Usage'),
    numericInput('used', 'Tank Used (%)', 50, min = 0, max = 100),
    helpText("This application allows you to determine distance available ",
             "for driving based on remaining fuel in tank.  Typically we ",
             "say we have used 1/2 or 1/4 of tank and want to know how far ",
             "we can go with remaining tank.  Input the Fuel Capacity of the ",
             "car and percent of gas tank used and the application will ",
             "calculate distance car can travel on the remaining gas in tank.")
  ),
  mainPanel(
    #
    # Display back the inputs entered by the user
    #
    h4('Fuel Capacity (gallons)'),
    textOutput("tankSize"),
    h4('Fuel Economy (mpg)'),
    textOutput("mpg"),
    #
    # Show the calculated value of remaining gas and milage
    #
    h4('Fuel Remaining (gallons)'),
    textOutput("remaining"),
    h4('Remaining Distance (miles)'),
    textOutput("availDist")
  )
))
