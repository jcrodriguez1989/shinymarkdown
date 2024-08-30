#' Set up a Shiny app to use shinymarkdowneditor
#'
#' This function must be called from a Shiny app's UI in order for all other
#' shinymarkdowneditor functions to work.
#' You can call `useShinyMarkdownEditor()` from anywhere inside the UI, as long as the final
#' app UI contains the result of `useShinyMarkdownEditor()`.
#'
#' @importFrom shiny HTML tagList tags
#'
#' @export
#'
useShinyMarkdownEditor <- function() {
  # If we can get last ToastUI version, use it. If not, use the local version.
  if (can_connect()) {
    tagList(
      tags$link(
        rel = "stylesheet", href = "https://uicdn.toast.com/editor/latest/toastui-editor.min.css"
      ),
      tags$head(tags$script(
        src = "https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"
      ))
    )
  } else {
    message("Can not connect to ToastUI, using local version.")
    tagList(
      tags$style(paste(readLines(
        system.file("shinymarkdown", "toastui-editor.min.css", package = "shinymarkdown")
      ), collapse = "\n")),
      tags$head(tags$script(HTML(paste(readLines(
        system.file("shinymarkdown", "toastui-editor-all.min.js", package = "shinymarkdown")
      ), collapse = "\n"))))
    )
  }
}
