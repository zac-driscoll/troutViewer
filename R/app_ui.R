#' ui
#'
#' @param request needed for bookmarking
#'
#' @import shiny
#' @import shinydashboard
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    # golem_add_external_resources(),
    # List the first level UI elements here
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title = "Basic dashboard"),
      shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
          shinydashboard::menuItem(
            "Dashboard",
            tabName = "dashboard",
            icon = icon("dashboard")
          ),
          shinydashboard::menuItem("Widgets", 
                                   tabName = "widgets",
                                   icon = icon("th"))
        )
      ),
      shinydashboard::dashboardBody(
        shinydashboard::tabItems(
          # First tab content
          shinydashboard::tabItem(
            tabName = "dashboard",
            shiny::fluidRow(
              shinydashboard::box(plotOutput("plot1", height = 250)),
              shinydashboard::box(
                title = "Controls",
                sliderInput("slider", "Number of observations:", 1, 100, 50)
              )
            )
          ),
          # Second tab content
          shinydashboard::tabItem(tabName = "widgets",
                                  h2("Widgets tab content"))
        )
      )
    )
  )
}

#' @import shiny
golem_add_external_resources <- function(){
  
  addResourcePath(
    'www', system.file('app/www', package = "golemdashboard")
  )
  
  tags$head(
    golem::activate_js(),
    golem::favicon(),
    tags$title("golemdashboard")
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    #tags$link(rel="stylesheet", type="text/css", href="www/custom.css")
    
  )
}

