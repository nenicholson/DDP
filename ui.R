#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Cat Food Calculator"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h5("First choose cat's weight in lbs. 
            To calculate food weight from required calories, enter kcal 
            per 100g of your cat food."),
            sliderInput("lbs",
                        "Cat's weight in lbs:",
                        min = 1,
                        max = 25,
                        value = 10),
            numericInput("kcal", 
                         "Kcal per 100g of cat food:", 
                         value=200,
                         min=10,
                         max=1000)
        ),
        # Show a plot of the generated distribution
        mainPanel(
            h3('Daily calorie intake target for your cat:'),
            textOutput("outCals"),
            h3('Grams of food for target calorie intake:'),
            textOutput("outGrams")
        )
    )
))
