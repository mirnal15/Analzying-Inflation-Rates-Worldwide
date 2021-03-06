library(shinydashboard)
require(shiny)
require(highcharter)
#layout of the dashboard

#defining character vectors for select inputs
country<-c("India","United States","Mexico","Canada","China, People's Republic of","Japan","Russian Federation","Germany","United Kingdom","European Union",
           "ASEAN-5","New Zealand","Australia","Netherlands","Luxembourg",
           "France","Qatar","United Arab Emirates","Saudi Arabia")

unions<-c("Major advanced economies (G7)","European Union","Emerging and Developing Europe","ASEAN-5","Commonwealth of Independent States",
          "Emerging and Developing Asia","Latin America and the Caribbean",
          "Middle East, North Africa, Afghanistan, and Pakistan")

dashboardPage(
  #defines header
  skin = "red",
  dashboardHeader(
    title="Inflation Rates" ,
    dropdownMenu()
  ),
  
  
  #defines sidebar
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("About", tabName = "about", icon = icon("th")),
      menuItem("Trade Unions",tabName="unions",icon=icon("signal")),
      menuItem("World",tabName="world",icon=icon("globe"))
      
    )
  ),
  
  
  #defines bodys
  dashboardBody(
  
  tabItems(
    
  #First TAB Menu-Dashboard  
        tabItem(tabName = "dashboard",
          
          fluidRow(
            
            
            column(12,
              
              box(selectInput("country",label="Select Country",choices=country),width = 12) 
                  
              ),#end column
            
              #box for plotting the time series plot
            column(12,
                   
              box(
                
                highchartOutput("hcontainer"),
               
              
              
              width="12") #end box2
          
                  ), #end column
            hr(),
            h4("Relative inflation rates time series plot",align="center"),
            br(),
            column(12,
                   
                box(
                  highchartOutput("hc2"),width=12
                  
                ) )

              ),#end row
                h4("Made with love from", strong("Anish Singh Walia")),
                a("R code for this project",target="_blank",href="https://github.com/anishsingh20/Analzying-Inflation-Rates-Worldwide")
              ),
    
    
    
    #second tab menu- ABOUT
          tabItem(tabName="about",
                  
                    h2("What is Inflation ?",style="text-align:center")
                  
                  
                  ),
    
          tabItem(tabName = "unions",
                  
                    h3("Time series of Inflation rates of Economic trade unions",align="center") ,
                  
                   fluidRow(
                    
                    
                    column(12,
                           
                           box(selectInput("region",label="Select Economic Region",choices=unions),width = 12) 
                           
                    ),
                  
                    box(
                      highchartOutput("hc3"),
                      width=12)
                  
                  )# end row 
                ),
          tabItem(tabName = "world",
                  
                  h3("World's Inflation Rates",align="center") ,
                  
                  box(
                    highchartOutput("hc4"),
                    width=12)
            
    )
    )#end tabitems
  
    
)#end body

)#end dashboard