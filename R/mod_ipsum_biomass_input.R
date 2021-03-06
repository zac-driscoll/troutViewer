#' ipsum_biomass_input UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_ipsum_biomass_input_ui <- function(id,button_name,group = FALSE) {
  ns <- NS(id)
  tagList(shiny::column(
    4,
    shinydashboard::box(
      title = "Select Model",
      status = "primary",
      width = NULL,
      solidHeader = TRUE,
      height = dplyr::if_else(group == TRUE, 300, 200),
      shiny::selectInput(
        shiny::NS(id, "models"),
        "",
        choices = c("Model1", "Model2", "Model3"),
        multiple = TRUE
      ),
      shiny::checkboxInput(shiny::NS(id, "cumul"),"Cumulative?"),
      if (group == TRUE) {
        # Only show this panel if the plot type is a histogram
        shiny::selectInput(
          shiny::NS(id, "group"),
          "Select Grouping Parameter",
          choices = c(
            NULL,
            "Year",
            "Data Type",
            "Management  Unit",
            "Species",
            "Model"
          )
        )
      },
      shiny::actionButton(shiny::NS(id, "button"),
                          button_name)
    )
  ))
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
