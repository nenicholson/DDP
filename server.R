#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
df <- read.csv('https://raw.githubusercontent.com/nenicholson/DDP/gh-pages/cat2.csv')
colnames(df) <- c('weight_lbs', 'weight_kg', 'cals', 'calc')
rownames(df) <- df$weight_lbs

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    sliderInput <- reactive({
        lb <- input$lbs
        df[lb, 'cals']
    })
    
    output$outCals <- renderText({paste('\n', sliderInput())})
    numericInput <- reactive({
        num <- input$kcal
        sliderInput()/(num/100)
    })
    
    output$outGrams <- renderText({paste('\n', numericInput(), 'g')})
})
