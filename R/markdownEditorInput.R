#' Create a Markdown Editor input control
#'
#' @param inputId	The input slot that will be used to access the value.
#'
#' @importFrom glue glue
#' @importFrom shiny div tagList tags
#'
#' @export
#'
markdownEditorInput <- function(inputId) {
  tagList(
    div(id = inputId),
    tags$script(glue(.open = "{{", .close = "}}", "
      // Create the shiny input listener.
      $('#' + '{{inputId}}').on('keyup', function() {
        Shiny.setInputValue('{{inputId}}', {{inputId}}.getMarkdown());
      })
      // Create an instance of the editor.
      const {{inputId}} = new toastui.Editor({
        el: document.querySelector('#{{inputId}}'),
        previewStyle: 'vertical',
        height: '500px',
        initialValue: ''
      });
    "))
  )
}
