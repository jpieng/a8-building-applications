# Load in packages
library(plotly)
library(shiny)
library(dplyr)

# filters the iris data frame to each specific species
setosa_species <- iris %>% filter(Species == "setosa")
versicolor_species <- iris %>% filter(Species == "versicolor")
virginica_species <- iris %>% filter(Species == "virginica")

shinyServer(function(input, output) {
  # creates first box plot of petal length or width
  # depending on input.
  output$length_plot <- renderPlotly({
    # Inteprets a string as a variable to choose which
    # data.frame to use and whether it is comparing length or width.
    p <- plot_ly(eval(parse(text = input$species)), 
                 y = eval(parse(text = paste0("Petal.",input$dimensions))), 
                 color = Species, type = "box") %>% 
                      # Makes the y-axis label
                      layout(yaxis = list(title = paste("Petal", input$dimensions)))
  })
  
  # creates second box plot of sepal length or width
  # depending on input.
  output$width_plot <- renderPlotly({
    # Inteprets a string as a variable to choose which
    # data.frame to use and whether it is comparing length or width.
    p <- plot_ly(eval(parse(text = input$species)), 
                 y = eval(parse(text = paste0("Sepal.",input$dimensions))),  
                 color = Species, type = "box") %>% 
                      # Makes the y-axis label
                      layout(yaxis = list(title = paste("Sepal", input$dimensions)))
  })
})


