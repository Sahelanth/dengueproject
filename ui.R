#Acquire dengue data
dengueData <- readRDS("data/dengueData.rds")

#UI code
shinyUI(pageWithSidebar(
  headerPanel('Dengue cases by region'),
  sidebarPanel(
    selectInput('id1', 'Region', selected="Asia", choices=unique(as.character(dengueData$REGION))),

    uiOutput('countryselect'),
    

    h5('This Shiny app graphs the number of occurrences of dengue fever in a given region and country by year. 
    
    Simply use the first dropdown menu to select the region, then the second to select the country. 
    This will automatically generate a plot that displays the number of occurrences in each year for that region,
    and then another plot for the number of occurrences for that country.
    
    Occurrences can include one or multiple cases; this is more like a count of outbreaks than of individual cases.
    
    Original data source: 
      Messina, Jane P., Oliver J. Brady, David M. Pigott, John S. Brownstein, Anne G. Hoen, and Simon I. Hay. "A Global Compendium of Human Dengue Virus Occurrence." Scientific Data Sci. Data 1 (2014):
      http://www.nature.com/articles/sdata20144')
    ),

  mainPanel(
    h3('Graphs'),
    h5('Region'),
    plotOutput("plot1"),
    h5('Country'),
    plotOutput("plot2")
          )
  ))
