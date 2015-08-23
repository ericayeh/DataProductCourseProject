library(shiny)

shinyUI(fluidPage(
# Giving a name to the application
    titlePanel("Resume Word Cloud"),
    sidebarLayout(
        sidebarPanel(
            fileInput('file1', 'Upload your Text File', accept='text/plain'),
            
            selectInput("color", "Select Color Scheme", c(One = "Dark2", Two = "Paired",
                Three = "Set1", Four = "Greys", Five = "Accent", Six = "Spectral"), selected = "Dark2"),
            
            radioButtons("num", "Select Number of Color", c(3, 5, 8), selected = 8, inline=T),

            tags$hr(), # Adding a horizontal line to separate the field
            
            sliderInput("freq",
                        "Minimum Frequency:", min = 1,  max = 15, value = 2),
            sliderInput("max",
                        "Maximum Number of Words:", min = 1,  max = 500,  value = 100)
        ),
        
        mainPanel(  
            tabsetPanel(
                tabPanel("Content", tableOutput('contents')),
                tabPanel("Cloud", plotOutput("plot"))               
            )
            
        )

    )
))






