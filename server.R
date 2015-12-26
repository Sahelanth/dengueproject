#Acquire dengue data
dengueData <- readRDS("data/dengueData.rds")

#Server code
shinyServer(function(input, output) {
    
  #Make graph

  output$oid1 <- renderPrint({input$id1})
  
  
  output$oid2 <- renderPrint({input$id2})
  
  output$plot1 <- renderPlot({
    plot(table(subset(dengueData$YEAR, dengueData$REGION== input$id1)), 
         main=paste0("Dengue occurrences per year in ", x=input$id1), ylab="Count")
    
  })
  
  output$countryselect <- renderUI({
    selectInput('id2', 'Country', selected="Thailand", choices=unique(as.character(dengueData$COUNTRY[dengueData$REGION==input$id1])))
  })
  
  
  output$plot2 <- renderPlot({
    plot(table(subset(dengueData$YEAR, dengueData$COUNTRY== input$id2)), 
         main=paste0("Dengue occurrences per year in ", x=input$id2), ylab="Count")
    
  })
  
}
)
