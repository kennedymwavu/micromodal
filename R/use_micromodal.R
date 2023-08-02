#' Use micromodal
#'
#' Call this function once in your app's UI.
#'
#' This function adds the dependencies needed for the modals.
#'
#' See [micromodal()] for a complete example.
#' @return [htmltools::tagList()]
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(micromodal)
#'
#'   ui <- fluidPage(
#'     use_micromodal(),
#'     # the rest of your UI code
#'   )
#' }
#' @export
use_micromodal <- \() {
  assets_dir <- system.file("assets", package = "micromodal")
  if (assets_dir == "") {
    stop(
      "Could not find package `micromodal`. Try re-installing it.",
      call. = FALSE
    )
  }
  htmltools::tagList(get_dependencies())
}
