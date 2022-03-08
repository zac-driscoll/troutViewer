#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  mod_ipsum_plot_server("ipsum_plot_ui_1","line")
  mod_ipsum_plot_server("ipsum_plot_ui_2","histogram")
  mod_load_data_server("ipsum_load1")
  mod_load_data_server("ipsum_load2")
  mod_load_data_server("ipsum_load3")
  mod_ipsum_summary_server("ipsum_text1")
  mod_ipsum_table_server("ipsum_table_ui_2")
  mod_ipsum_table_server("ipsum_table_ui_3")
}