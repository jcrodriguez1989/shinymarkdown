#' Set up a Shiny app to use shinymarkdowneditor
#'
#' This function must be called from a Shiny app's UI in order for all other
#' shinymarkdowneditor functions to work.
#' You can call `useShinyMarkdownEditor()` from anywhere inside the UI, as long as the final
#' app UI contains the result of `useShinyMarkdownEditor()`.
#'
#' @importFrom shiny tagList tags
#'
#' @export
#'
useShinyMarkdownEditor <- function() {
  tagList(
    tags$link(
      rel = "stylesheet", href = "https://uicdn.toast.com/editor/latest/toastui-editor.min.css"
    ),
    tags$head(tags$script(src = "https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"))
  )
}
