#' ipsum_table UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_ipsum_table_ui <- function(id){
  ns <- NS(id)
  tagList(
    tagList(shiny::column(9,DT::DTOutput(shiny::NS(id, "ipsum"))))
  )
}
    
#' ipsum_table Server Functions
#'
#' @noRd 
mod_ipsum_table_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$ipsum <- DT::renderDT(shinipsum::random_DT(ncol = 5,nrow = 10))
  })
}
    
## To be copied in the UI
# mod_ipsum_table_ui("ipsum_table_ui_1")
    
## To be copied in the server
# mod_ipsum_table_server("ipsum_table_ui_1")
