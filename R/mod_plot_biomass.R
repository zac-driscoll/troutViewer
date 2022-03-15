#' plot_biomass UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_plot_biomass_ui <- function(id){
  ns <- NS(id)
    tagList(
      #select input
      shiny::column(
      4,
      shinydashboard::box(
        title = "Select Model",
        status = "primary",
        width = NULL,
        solidHeader = TRUE,
        height =  250,
        shiny::selectInput(
          shiny::NS(id, "models"),
          "",
          choices = c("Model1", "Model2", "Model3"),
          multiple = TRUE
        ),
        shiny::selectInput(shiny::NS(id,"type"),
                           "Select Plot Type",
                            choices = c("Single" = "single",
                                        "Multiple" = "multiple",
                                        "Cumulative" = "cumulative")),
        shiny::actionButton(shiny::NS(id, "button"),"Plot Data")
      )
    ),
    #plot
    shiny::column(
    6,
    offset = 1,
    shinydashboard::box(
      title = "Biomass Plot",
      width = NULL,
      status = "primary",
      solidHeader = TRUE,
      height = 500,
      plotly::plotlyOutput(shiny::NS(id, "bmsPlot"))
    )
  ))
}
    
#' plot_biomass Server Functions
#'
#' @noRd 
mod_plot_biomass_server <-
  function(id,
           dat1,
           dat2 = NULL,
           dat3 = NULL) {
    moduleServer(id, function(input, output, session) {
      ns <- session$ns
      
      shiny::observeEvent(input$button, {
        #single plot
        if (input$type == "single") {
          dat_selected1 <-
            shiny::eventReactive(input$models, {
              switch(input$models[1],
                     "Model1" = dat1,
                     "Model2" = dat2)
            })
          output$bmsPlot <-
            plotly::renderPlotly(
              trout.modlR::make_bmsPlots(
                dat1 = shiny::isolate(dat_selected1()),
                type = "single",
                plotly = TRUE
              )
            )
        } 
          #multiple plots
          if (input$type == "multiple") {
            output$bmsPlot <-
              plotly::renderPlotly(
                trout.modlR::make_bmsPlots(
                  dat1 = dat1,
                  dat2 = dat2,
                  type = "multiple",
                  plotly = TRUE
                )
              )
          }
          #cumulative
          if (input$type == "cumulative") {
            output$bmsPlot <-
              plotly::renderPlotly(
                trout.modlR::make_bmsPlots(
                  dat1 = dat1,
                  dat2 = dat2,
                  type = "cumulative",
                  plotly = TRUE
                )
              )
      }
    })
  })
  }

## To be copied in the UI
# mod_plot_biomass_ui("plot_biomass_ui_1")
    
## To be copied in the server
# mod_plot_biomass_server("plot_biomass_ui_1")
