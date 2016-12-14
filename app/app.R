library(shiny)
library(shinydashboard)
library(shinysky)
library(rhandsontable)
library(DT)
library(scales)
library(tidyr)
library(reshape2)
library(shiny)
library(Rmpfr)


ui <- dashboardPage(
    dashboardHeader(title = "Explore Data"),
    dashboardSidebar(
        sidebarMenu(
            menuItem("Tab 1", tabName = "Data", icon = icon("search")),
            uiOutput("menuItem"),
            menuItem("Tab 2", tabName = "DataTwo", icon = icon("area-chart"))
            )
    ),
    dashboardBody(
        tabItems(
        # include the UI for each tab
        source(file.path("ui", "tab1_ui.R"),  local = TRUE)$value,
        source(file.path("ui", "tab2_ui.R"),  local = TRUE)$value
        )
    )
)
server <- function(input, output, session) {
    # Include the logic (server) for each tab
    source(file.path("server", "tab1_server.R"),  local = TRUE)$value

    output$menuItem <- renderUI({
        return(selectizeInput(
            'pick', 'Choices', choices = c("a", "b", "c"), multiple = FALSE))
    })
}

shinyApp(ui = ui, server = server)