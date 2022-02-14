library(shiny)
library(plotly)
library(shinythemes)

ui <- fluidPage(
  theme = shinytheme("darkly"),
  headerPanel('Plotting MT Cars data using plotly'),
  sidebarPanel(
    selectInput('xcol','X Variable', names(mtcars), selected = names(mtcars)[[1]]),
    selectInput('ycol','Y Variable', names(mtcars), selected = names(mtcars)[[3]]),
    selectInput('color','Color', names(mtcars), selected = names(mtcars)[[2]])
    )
    ,
  mainPanel(
    plotlyOutput('plot')
  )
)

server <- function(input, output) {
  
  x <- reactive({
    mtcars[,input$xcol]
  })
  
  y <- reactive({
    mtcars[,input$ycol]
  })
  
  color <- reactive({
    mtcars[,input$color]
  })
  
  
  output$plot <- renderPlotly(
    plot1 <- plot_ly(
      x = x(),
      y = y(), 
      color = color(),
      text  = color(),
      type = 'scatter',
      mode = 'markers',
      hovertemplate = paste(
                            '<br><b>X</b>: %{x}',
                            '<br><b>Y</b>: %{y}',
                            '<br><b>Color</b>:',
                            '<b>%{text}</b><extra></extra>')
      )
    %>% layout(
      paper_bgcolor="#303030",
               plot_bgcolor="#303030",
      xaxis = list(
        color = '#ffffff'),
      yaxis = list(
        color = '#ffffff'),
      font = list(color = '#ffffff')
               )
  )
  
}

shinyApp(ui,server)