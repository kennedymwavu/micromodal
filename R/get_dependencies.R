#' Get package dependencies
get_dependencies <- \() {
  list(
    htmltools::htmlDependency(
      name = "micromodal-binding",
      version = as.character(utils::packageVersion("micromodal")),
      package = "micromodal",
      src = "assets",
      script = "micromodal.min.js",
      stylesheet = "micromodal.css"
    )
  )
}
