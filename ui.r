# load packages
library(shiny)
library(plotly)

shinyUI(
  fluidPage(
    # Application title
    titlePanel("Iris Species' Petal and Sepal Data"),
    # Makes sidebar
    sidebarLayout(
      # Side panel for controls
      sidebarPanel( "Compare a species petal and sepal",
                    # Displays a drop down menu with choices 
                    # for each of the iris species. 
                    selectInput("species", label = h4("Choose species"), 
                                       choices = list("Setosa" = 'setosa_species', 
                                                      "Versicolor" = 'versicolor_species', 
                                                      "Virginica" = 'virginica_species'),
                                       selected = "Setosa"),
                    # Displays radio buttons to choose between comparing length
                    # or width of the petal and sepal.
                    radioButtons("dimensions", label = h4("Choose a dimension"),
                      choices = list("Length" = 'Length', "Width" = 'Width'))
    ),
    # Displays two box plots of the length and width
    # of the petal and sepal.
    mainPanel(
      plotlyOutput("length_plot"),
      plotlyOutput("width_plot")
    )
 )
))