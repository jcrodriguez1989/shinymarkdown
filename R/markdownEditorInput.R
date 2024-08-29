#' Create a Markdown Editor input control
#'
#' @param inputId	The input slot that will be used to access the value.
#' @param height Editor's height style value. Height is applied as border-box ex) "300px", "100%",
#'   "auto".
#' @param min_height Editor's min-height style value in pixel ex) "300px".
#' @param initial_value Editor's initial value.
#' @param preview_style Markdown editor's preview style ("tab", "vertical").
#' @param initial_edit_type Initial editor type ("markdown", "wysiwyg").
#' @param language Language.
#' @param placeholder The placeholder text of the editable element.
#'
#' @importFrom glue glue
#' @importFrom shiny div tagList tags
#'
#' @export
#'
markdownEditorInput <- function(inputId, height = "300px", min_height = "200px", initial_value = "",
                                preview_style = "tab", initial_edit_type = "markdown",
                                language = "en-US", placeholder = "") {
  sInputId <- sanitize_input_ids(inputId)
  tagList(
    div(id = inputId),
    tags$script(glue(.open = "{{", .close = "}}", "
      // Create the shiny input listener.
      $('#' + '{{inputId}}').on('keyup', function() {
        Shiny.setInputValue('{{inputId}}', {{sInputId}}.getMarkdown());
      })
      // Create an instance of the editor.
      const {{sInputId}} = new toastui.Editor({
        el: document.querySelector('#{{inputId}}'),
        height: '{{height}}',
        minHeight: '{{min_height}}',
        initialValue: '{{initial_value}}',
        previewStyle: '{{preview_style}}',
        initialEditType: '{{initial_edit_type}}',
        language: '{{language}}',
        placeholder: '{{placeholder}}',
        previewHighlight: false,
        usageStatistics: false,
        hideModeSwitch: true
      });
      // Add `updateMarkdownEditorInput` listener.
      Shiny.addCustomMessageHandler('updateMarkdownEditorInput_{{inputId}}', function(msg) {
        {{sInputId}}.reset();
        {{sInputId}}.insertText(msg);
      });
    "))
  )
}
