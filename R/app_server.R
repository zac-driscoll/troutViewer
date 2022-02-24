#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  mod_ipsum_plot_server("ipsum_plot_ui_1")
  mod_ipsum_plot_server("ipsum_plot_ui_2")
}
