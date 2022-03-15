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
            "Biomass",
            tabName = "biomass",
            icon = icon("weight-hanging")
          ),
          shinydashboard::menuItem("Plot Mortality",
                                   tabName = "mortality",
                                   icon = icon("skull"))
        )
      ),
      #body
      shinydashboard::dashboardBody(shinydashboard::tabItems(
        # First tab content
        shinydashboard::tabItem(
          tabName = "import",
          tabsetPanel(
            type = "tabs",
            tabPanel(
              "Model1",
              mod_load_data_ui("ipsum_load1"),
              mod_ipsum_summary_ui("ipsum_text1")
            ), 
            tabPanel(
              "Model2",
              mod_load_data_ui("ipsum_load2"),
              mod_ipsum_summary_ui("ipsum_text2")
            ),
            tabPanel(
              "Model3",
              mod_load_data_ui("ipsum_load3"),
              mod_ipsum_summary_ui("ipsum_text3")
            )
          )
        ),  
          # Second tab content
          shinydashboard::tabItem(
            tabName = "biomass",
            tabsetPanel(
              type = "tabs",
              tabPanel(
                "Plot Biomass",
                shiny::br(),
                shiny::fluidRow(
                  mod_plot_biomass_ui("plot_biomass_ui_1"))), 
              tabPanel(
                "View Data",
                shiny::br(),
                shiny::fluidRow(
                  mod_ipsum_biomass_input_ui("ipsum_biomass_input_ui_2",
                                             "Get Data",
                                             group = TRUE),
                  mod_ipsum_table_ui("ipsum_table_ui_1"))))),
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

