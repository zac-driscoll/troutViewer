#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  model_dat1 <- mod_load_data_server("ipsum_load1")
  model_dat2 <- mod_load_data_server("ipsum_load2")
  model_dat3 <- mod_load_data_server("ipsum_load3")
  
  #plot biomass data
  mod_plot_biomass_server("plot_biomass_ui_1",
                          dat1 = model_dat1(),
                          dat2 = model_dat2()
                          # dat3 = model_dat3()
                          )
 #table
  mod_ipsum_table_server("ipsum_table_ui_1")
}