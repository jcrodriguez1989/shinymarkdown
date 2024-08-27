#' Hide the editor
#'
#' @param .id The \code{inputId} of the editor.
#'
#' @return NA; used for side effects to hide the editor instance defined with \code{\link{mdInput}}.
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
hide_editor <- function(.id) {
  session <- getDefaultReactiveDomain()
  session$sendCustomMessage("hide_editor", list(id = .id))
}
