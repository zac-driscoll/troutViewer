#' ipsum_summary UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_ipsum_summary_ui <- function(id) {
  ns <- NS(id)
  tagList(
    shinydashboard::box(
      title = "Model Summary", 
      status = "primary", 
      solidHeader = TRUE,
      height = 200,
      shiny::htmlOutput(shiny::NS(id, "ipsum1")),
      shiny::br(),
      shiny::htmlOutput(shiny::NS(id, "ipsum2")),
      shiny::br(),
      shiny::htmlOutput(shiny::NS(id, "ipsum3")),
      shiny::br(),
      shiny::htmlOutput(shiny::NS(id, "ipsum4"))
    )
  )
}
    
#' ipsum_summary Server Functions
#'
#' @noRd 
mod_ipsum_summary_server <- function(id,mod_dat,spp,mu,author){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$ipsum1 <- shiny::renderText({paste("<b>Model Date:</b>", mod_dat)})
    output$ipsum2 <- shiny::renderText({paste("<b>Species</b>:", spp)})
    output$ipsum3 <- shiny::renderText({paste("<b>Management Unit</b>:",mu)})
    output$ipsum4 <- shiny::renderText({paste("<b>Author:</b>",author)})
  })
}
    
## To be copied in the UI
# mod_ipsum_summary_ui("ipsum_summary_ui_1")
    
## To be copied in the server
# mod_ipsum_summary_server("ipsum_summary_ui_1")
