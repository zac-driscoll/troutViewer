#' load_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList
mod_load_data_ui <- function(id) {
  shiny::tagList(
    shiny::br(),
    shinydashboard::box(
      title = "Select Model", 
      status = "primary", 
      solidHeader = TRUE,
      height = 200,
      shiny::fileInput(shiny::NS(id, "modelData"),""),
      shiny::actionButton(shiny::NS(id, "data_button"),
                          "Get Data")
  ))
}
    
#' load_data Server Functions
#'
#' @noRd 
mod_load_data_server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    shiny::eventReactive(input$data_button, {
      shiny::req(input$modelData)
      dget(input$modelData$datapath)
    })
  })
}

## To be copied in the UI
# mod_load_data_ui("load_data_ui_1")
    
## To be copied in the server
# mod_load_data_server("load_data_ui_1")
