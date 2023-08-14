#' Create a modal dialog
#'
#' @param id A unique id for the modal
#' @param title The modal's title
#' @param content The modal's content
#' @param footer The modal's footer
#' @return [htmltools::tagList()]
#' @examples
#' # Example 1----
#' if (interactive()) {
#'   library(shiny)
#'   library(micromodal)
#'
#'   ui <- fluidPage(
#'     use_micromodal(),
#'     actionButton(
#'       inputId = "trigger",
#'       label = "Trigger modal",
#'       `data-micromodal-trigger` = "modal-1"
#'     ),
#'     micromodal(
#'       id = "modal-1",
#'       title = "Hello, World!",
#'       content = tagList(
#'         tags$p("Hi Mom,"),
#'         tags$p("Come see my first modal!")
#'       )
#'     )
#'   )
#'
#'   server <- \(input, output, session) {}
#'
#'   shinyApp(ui, server)
#' }
#'
#' # Example 2----
#' if (interactive()) {
#'   library(shiny)
#'   library(micromodal)
#'
#'   server <- \(input, output, session) {
#'
#'   }
#'
#'   ui <- bslib::page(
#'     title = "Micromodal",
#'     theme = bslib::bs_theme(version = 5),
#'     # inform shiny to use {micromodal}:
#'     use_micromodal(),
#'     # your normal UI code:
#'     tags$div(
#'       class = "container",
#'       tags$div(
#'         class = "container my-5",
#'         tags$h1("Micromodal.js in Shiny", class = "mb-5"),
#'         # trigger for "modal-1"
#'         actionButton(
#'           inputId = "show_modal_1",
#'           label = "Exhibit 1",
#'           class = "btn-outline-primary px-3",
#'           `data-micromodal-trigger` = "modal-1"
#'         ),
#'         # trigger for "modal-2"
#'         actionButton(
#'           inputId = "show_modal_2",
#'           label = "Exhibit 2",
#'           class = "btn-outline-primary px-3",
#'           `data-micromodal-trigger` = "modal-2"
#'         )
#'       ),
#'       # modal-1:
#'       micromodal(
#'         id = "modal-1",
#'         title = "Login",
#'         content = tagList(
#'           textInput(
#'             inputId = "name",
#'             label = "Name",
#'             width = "400px"
#'           ),
#'           passwordInput(
#'             inputId = "password",
#'             label = tags$div(
#'               tags$span("Password"),
#'               tags$span("(required)", class = "text-muted fw-light")
#'             ),
#'             width = "400px"
#'           ) |> tagAppendAttributes(class = "mb-0"),
#'           tags$div(
#'             "Must be atleast 6 characters long.",
#'             class = "text-muted fw-light"
#'           )
#'         ),
#'         footer = tagList(
#'           tags$button(
#'             class = "modal__btn modal__btn-primary",
#'             "Continue"
#'           ),
#'           tags$a(
#'             href = "#",
#'             class = "ms-3",
#'             `data-micromodal-close` = NA,
#'             `aria-label` = "Close this dialog window",
#'             "Cancel"
#'           )
#'         )
#'       ),
#'       # modal-2:
#'       micromodal(
#'         id = "modal-2",
#'         title = "Micromodal",
#'         content = tagList(
#'           tags$p("This is a completely accessible modal."),
#'           tags$p(
#'             "Try hitting the",
#'             tags$code("tab"),
#'             "key* and notice how the focus stays",
#'             "within the modal itself. To close modal hit the",
#'             tags$code("esc"),
#'             "button, click on the overlay or just click the close button."
#'           ),
#'           tags$p("*", tags$code("alt + tab"), "in safari")
#'         ),
#'         footer = tagList(
#'           tags$button(
#'             class = "modal__btn modal__btn-primary",
#'             "Continue"
#'           ),
#'           tags$button(
#'             class = "modal__btn ms-2",
#'             `data-micromodal-close` = NA,
#'             `aria-label` = "Close this dialog window",
#'             "Close"
#'           )
#'         )
#'       )
#'     )
#'   )
#'
#'   shinyApp(ui, server)
#' }
#' @export
micromodal <- \(
  id,
  title = NULL,
  content = NULL,
  footer = NULL
) {
  title_id <- paste0(id, "-title")
  main_id <- paste0(id, "-content")
  modal <- htmltools::tags$div(
    id = id,
    class = "modal micromodal-slide",
    `aria-hidden` = "true",
    htmltools::tags$div(
      class = "modal__overlay",
      tabindex = "-1",
      `data-micromodal-close` = NA,
      htmltools::tags$div(
        class = "modal__container",
        role = "dialog",
        `aria-modal` = "true",
        `aria-labelledby` = title_id,
        htmltools::tags$header(
          class = "modal__header",
          htmltools::tags$h2(
            class = "modal__title",
            id = title_id,
            title
          ),
          htmltools::tags$button(
            class = "modal__close",
            `aria-label` = "Close modal",
            `data-micromodal-close` = NA
          )
        ),
        htmltools::tags$main(
          class = "modal__content",
          id = main_id,
          content
        ),
        htmltools::tags$footer(
          class = "modal__footer",
          footer
        )
      )
    )
  )

  htmltools::tagList(
    modal,
    # (re-)initialize Micromodal:
    htmltools::tags$script(
      htmltools::HTML("$(document).ready(function() {MicroModal.init();});")
    )
  )
}
