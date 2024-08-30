#' Check if we can connect to ToastUI
#'
can_connect <- function() {
  !inherits(
    try(
      close(url("https://uicdn.toast.com/editor/latest/toastui-editor.min.css", "r")),
      silent = TRUE
    ),
    "try-error"
  )
}
