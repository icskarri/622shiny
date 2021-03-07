#load libraries
library(shiny)

#simple shiny app
ui <- fluidPage(
  titlePanel('hello shiny'),
  selectInput('dataset', label = 'dataset', 
              choices = ls('package:datasets')),
  verbatimTextOutput('summary'),
  tableOutput('table'),
  checkboxGroupInput('animal',
                     'choose your favorite!',
                     'dogs')
)

server <- function(input, output, session){
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}

#need to rewrite this server function so it only 
#loads the dataset into memory once

shinyApp(ui, server)

