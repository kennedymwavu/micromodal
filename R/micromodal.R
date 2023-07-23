#' Create a modal dialog
#'
#' @param id A unique id for the modal
#' @param title The modal's title
#' @param content The modal's content
#' @param footer The modal's footer
#' @return [shiny::tagList()]
#'
micromodal <- \(
  id,
  title = NULL,
  content = NULL,
  footer = NULL
) {
  title_id <- paste0(id, "-title")
  main_id <- paste0(id, "-content")
  modal <- tags$div(
    id = id,
    class = "micromodal-slide",
    `aria-hidden` = "true",
    tags$div(
      class = "modal__overlay",
      tabindex = "-1",
      `data-micromodal-close` = NA,
      tags$div(
        class = "modal__container",
        role = "dialog",
        `aria-modal` = "true",
        `aria-labelledby` = title_id,
        tags$header(
          class = "modal__header d-flex justify-content-between align-items-center",
          tags$h2(
            class = "modal__title my-0 text-primary",
            id = title_id,
            title
          ),
          tags$button(
            class = "modal__close bg-transparent border-0",
            `aria-label` = "Close modal",
            `data-micromodal-close` = NA
          )
        ),
        tags$main(
          class = "modal__content",
          id = main_id,
          content
        ),
        tags$footer(
          class = "modal__footer",
          footer
        )
      )
    )
  )

  tagList(modal)
}
