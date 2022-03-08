#' ipsum_summary UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_ipsum_summary_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::column(2,
      shiny::textOutput(shiny::NS(id, "ipsum1"))
    ),
    shiny::column(2,
                  shiny::textOutput(shiny::NS(id, "ipsum2"))
    )
  )
}
    
#' ipsum_summary Server Functions
#'
#' @noRd 
mod_ipsum_summary_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$ipsum1 <- shiny::renderText("Model Date: 10/31/2020")
    output$ipsum1 <- shiny::renderText("Species: Lake Trout")
  })
}
    
## To be copied in the UI
# mod_ipsum_summary_ui("ipsum_summary_ui_1")
    
## To be copied in the server
# mod_ipsum_summary_server("ipsum_summary_ui_1")
