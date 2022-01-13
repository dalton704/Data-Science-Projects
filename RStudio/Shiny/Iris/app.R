# User interface ----
ui <- fluidPage(
  titlePanel("Iris Species"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("We can view three different types of Iris Species here."),
      
      selectInput("var", 
                  label = "Choose a Species of Iris: ",
                  choices = c("Setosa", "Versicolor",
                              "Virginica"),
                  selected = "Iris Setosa")
    ),
    
    mainPanel(
      uiOutput("image")
    )
  )
)

# Server logic ----
server <- function(input, output) {
  output$image = renderUI({
    if(input$var == "Setosa"){
      img(src = "iris_setosa.png", height = 850, width = 850)
    }
    else if(input$var == "Versicolor"){
      img(src = "Iris_Versicolor.png", height = 850, width = 850)
    }
    else if(input$var == "Virginica"){
      img(src = "iris_virginica.png", height = 850, width = 850)
    }
  })
  
}

# Run app ----
shinyApp(ui, server)
