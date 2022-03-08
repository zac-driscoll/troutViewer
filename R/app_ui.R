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
    # 
    shinydashboard::dashboardPage(
      shinydashboard::dashboardHeader(title = "Great Lakes Trout Viewer"),
      #sidebar
      shinydashboard::dashboardSidebar(
        shinydashboard::sidebarMenu(
          shinydashboard::menuItem(
            "Import Data",
            tabName = "import",
            icon = icon("file-import"),
            selected = TRUE
          ),
          shinydashboard::menuItem(
            "Plot Biomass",
            tabName = "biomass",
            icon = icon("weight-hanging")
          ),
          shinydashboard::menuItem("Plot Mortality",
                                   tabName = "mortality",
                                   icon = icon("skull"))
        )
      ),
      #body
      shinydashboard::dashboardBody(
        shinydashboard::tabItems(
          # First tab content
          shinydashboard::tabItem(tabName = "import",
                                  tabsetPanel(
                                    type = "tabs",
                                    tabPanel("Model1",
                                             shiny::fluidRow(shinydashboard::box(
                                               mod_load_data_ui("ipsum_load1")
                                             )),
                                             shiny::fluidRow(
                                               # shiny::h3("Model 1 Data"),
                                               mod_ipsum_summary_ui("ipsum_text_ui_1"))
                                             ),
                                    tabPanel("Model2",
                                             shiny::fluidRow(shinydashboard::box(
                                               mod_load_data_ui("ipsum_load1")
                                             )),
                                             shiny::fluidRow(
                                               shiny::h3("Model 2 Data"),
                                               mod_ipsum_table_ui("ipsum_table_ui_2"))
                                             ),
                                    tabPanel("Model3",
                                             shiny::fluidRow(shinydashboard::box(
                                               mod_load_data_ui("ipsum_load3")
                                             )),
                                             shiny::fluidRow(
                                               shiny::h3("Model 3 Data"),
                                               mod_ipsum_table_ui("ipsum_table_ui_3"))
                                  ))), 
          # Second tab content
          shinydashboard::tabItem(
            tabName = "biomass",
            shiny::fluidRow(
              shinydashboard::box(
                mod_ipsum_plot_ui("ipsum_plot_ui_1")))
          ),
          # Third tab content
          shinydashboard::tabItem(
            tabName = "mortality",
            shiny::fluidRow(
              shinydashboard::box(
                mod_ipsum_plot_ui("ipsum_plot_ui_2")))
          )
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

