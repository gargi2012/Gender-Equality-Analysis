library(shiny)
library(shinydashboard)
library(readxl)
library(ggplot2)
library(tidyr)
library(dplyr)
library(readxl)


setwd("C:\\Users\\DELL\\Downloads")
teams <- as.data.frame(read_excel("Final_Teamwise.xlsx"))
ui <- dashboardPage(
  dashboardHeader(title = "IPL Dashboard"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Team Performance",tabName = "team",icon = icon("dashboard"))
    )
  ),
  dashboardBody(
    tabItems(
      
#team performance______________
      
      tabItem(tabName = "team",
              fluidPage(
                selectInput("team","Select Teams:",
                            unique(teams$team)),
                fluidRow(
                  shinydashboard::box(
                    title = "Overview",
                    width = 12,
                    solidHeader = T,
                    collapsible = F,
                    background = "black"
                  ),
                  infoBoxOutput("home_matches"),
                  infoBoxOutput("home_wins"),
                  infoBoxOutput("away_matches"),
                  infoBoxOutput("away_wins")
                ),
                plotOutput("pie")
                )
              )
      )
    )
  )






server <- function(input, output){
  
  
  
  output$home_matches <- renderInfoBox(
    {
    infoBox("Home Matches")
    }
  )
  
  output$home_wins <- renderInfoBox(
    {
      infoBox("Home Wins")
    }
  )
  
  output$away_matches <- renderInfoBox(
    {
      infoBox("Away Matches")
    }
  )  

  output$away_wins <- renderInfoBox(
    {
      infoBox("Away Wins")
    }
  )
  
  output$plot <- renderPlot({
    pie()
  })
}


shinyApp(ui,server)