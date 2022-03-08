#' ipsum_biomass_input UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_ipsum_biomass_input_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shinydashboard::box(
      title = "Select Model",
      status = "primary",
      solidHeader = TRUE,
      height = 200,
      shiny::selectInput(
        shiny::NS(id, "models"),
        "Select Models",
        choices = c("Model1", "Model2", "Model3"),
        multiple = TRUE
      ),
      shiny::checkboxInput(shiny::NS(id, "cumul"),
                           "Cumulative?")
    )
  )
}
    
#' ipsum_biomass_input Server Functions
#'
#' @noRd 
mod_ipsum_biomass_input_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_ipsum_biomass_input_ui("ipsum_biomass_input_ui_1")
    
## To be copied in the server
# mod_ipsum_biomass_input_server("ipsum_biomass_input_ui_1")
