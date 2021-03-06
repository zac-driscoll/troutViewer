#' ipsum_plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'         
#' @importFrom shiny NS tagList 
mod_ipsum_plot_ui <- function(id) {
  ns <- NS(id)
  tagList(shiny::column(
    6,
    offset = 1,
    shinydashboard::box(
      title = "Biomass Plot",
      width = NULL,
      status = "primary",
      solidHeader = TRUE,
      height = 500,
      plotly::plotlyOutput(shiny::NS(id, "ipsum"))
    )
  ))
}
    
#' ipsum_plot Server Functions
#'
#' @noRd 
mod_ipsum_plot_server <- function(id,plot_type){
  moduleServer(id, function(input, output, session){
    output$ipsum <-
      plotly::renderPlotly(shinipsum::random_ggplotly(plot_type))
  })
}
    
## To be copied in the UI
# mod_ipsum_plot_ui("ipsum_plot_ui_1")
    
## To be copied in the server
# mod_ipsum_plot_server("ipsum_plot_ui_1")
