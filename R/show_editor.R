#' Show the editor
#'
#' @param .id The \code{inputId} of the editor.
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shinymarkdown)
#'   ui <- fluidPage(
#'     mdInput(inputId = "myEditor", height = "500px", hide_mode_switch = F)
#'   )
#'
#'   server <- function(input, output, session) {
#'     # Hide the editor
#'     observeEvent(input$hide, {
#'       hide_ediotr(.id = "myEditor")
#'     })
#'
#'     # Show the editor
#'     obseveEvent(input$show, {
#'       show_editor(.id = "myEditor")
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @export
#'
r <- function(.id) {
  session <- getDefaultReactiveDomain()
  session$sendCustomMessage("show_editor", list(id = .id))
}
