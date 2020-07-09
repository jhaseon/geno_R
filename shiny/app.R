library(shiny)

# ui object
ui <- fluidPage(
  titlePanel("Genotyping Project"),
  sidebarLayout(
    sidebarPanel(fileInput("file1", "Choose CSV File",
                multiple = FALSE,
                accept = c(
                         ".jpg"))),
    mainPanel("main panel for outputs",

    uiOutput(outputId = "my_ui"))

  )
)

# server()
server <- function(input, output, session){ 
    observeEvent(input$file1, {
        inFile <- input$file1
        if (is.null(inFile)) return()
        file.copy(inFile$datapath, "/home/jhaseon/projects/geno/geno_R/shiny", recursive = TRUE) 
            })
        }

# shinyApp()
shinyApp(ui = ui, server = server)