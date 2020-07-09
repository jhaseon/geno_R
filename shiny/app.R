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

    imageOutput("image"))

  )
)

# server()
server <- function(input, output, session){ 
    observeEvent(input$file1, {
        inFile <- input$file1
        if (is.null(inFile)) return()
        file.copy(inFile$datapath, "/home/jhaseon/projects/geno/geno_R/shiny/www", recursive = TRUE)
    
        output$image <- renderImage({
            list(src = "/home/jhaseon/projects/geno/geno_R/shiny/www/0.jpg", alt = "Input")}, deleteFile=FALSE)
    })
    }

    

# shinyApp()
shinyApp(ui = ui, server = server)