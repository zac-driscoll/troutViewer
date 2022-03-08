#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  mod_ipsum_plot_server("ipsum_plot_ui_1","line")
  mod_ipsum_plot_server("ipsum_plot_ui_2","histogram")
  mod_load_data_server("ipsum_load1")
  mod_load_data_server("ipsum_load2")
  mod_load_data_server("ipsum_load3")
  mod_ipsum_summary_server("ipsum_text1",
                           mu = "M06",
                           spp ="Lake Trout",
                           mod_dat = "10-31-2020",
                           author = "Ben Turschak")
  mod_ipsum_summary_server("ipsum_text2",
                           mu = "M07",
                           spp ="Lake Trout",
                           mod_dat = "12-25-2020",
                           author = "Ben Turschak")
  mod_ipsum_summary_server("ipsum_text3",
                           mu = "M08",
                           spp ="Lake Trout",
                           mod_dat = "11-17-2020",
                           author = "Ben Turschak")
  mod_ipsum_table_server("ipsum_table_ui_2")
  mod_ipsum_table_server("ipsum_table_ui_3")
}