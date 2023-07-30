#' Use micromodal
#'
#' Call this function once in your app's UI
#' @export
use_micromodal <- \() {
  assets_dir <- system.file("assets", package = "micromodal")
  if (assets_dir == "") {
    stop(
      "Could not find package `micromodal`. Try re-installing it.",
      call. = FALSE
    )
  }
  htmltools::tagList(
    get_dependencies(),
    htmltools::tags$script(
      htmltools::HTML("$(document).ready(function() {MicroModal.init();});")
    )
  )
}
