#' Create a modal dialog
#'
#' @param id A unique id for the modal
#' @param title The modal's title
#' @param content The modal's content
#' @param footer The modal's footer
#' @return [shiny::tagList()]
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

  htmltools::tagList(modal)
}
