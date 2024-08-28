#' Change the value of a Markdown Editor input on the client
#'
#' @param session	The session object passed to function given to shinyServer. Default is
#'   `getDefaultReactiveDomain()`.
#' @param inputId The id of the input object.
#' @param value The label to set for the input object.
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @export
#'
updateMarkdownEditorInput <- function(session = getDefaultReactiveDomain(), inputId, value) {
  session$sendCustomMessage(paste0("updateMarkdownEditorInput_", inputId), value)
}
