#' Sanitize Input IDs
#'
#' `{shinymarkdown}` doesn't work if the inputId contains a "-" in its name. And "-" is
#' particularly used by Shiny namespaces, so it's important to perform these ID fixes.
#'
#' @param inputId The input ID to sanitize.
#'
sanitize_input_ids <- function(inputId) {
  # Just replace "-" with "_", this could cause ID collapses but with low probability.
  gsub("\\-", "_", inputId)
}
