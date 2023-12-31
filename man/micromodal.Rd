% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/micromodal.R
\name{micromodal}
\alias{micromodal}
\title{Create a modal dialog}
\usage{
micromodal(id, title = NULL, content = NULL, footer = NULL)
}
\arguments{
\item{id}{A unique id for the modal}

\item{title}{The modal's title}

\item{content}{The modal's content}

\item{footer}{The modal's footer}
}
\value{
\code{\link[htmltools:tagList]{htmltools::tagList()}}
}
\description{
Create a modal dialog
}
\examples{
# Example 1----
if (interactive()) {
  library(shiny)
  library(micromodal)

  ui <- fluidPage(
    use_micromodal(),
    actionButton(
      inputId = "trigger",
      label = "Trigger modal",
      `data-micromodal-trigger` = "modal-1"
    ),
    micromodal(
      id = "modal-1",
      title = "Hello, World!",
      content = tagList(
        tags$p("Hi Mom,"),
        tags$p("Come see my first modal!")
      )
    )
  )

  server <- \(input, output, session) {}

  shinyApp(ui, server)
}

# Example 2----
if (interactive()) {
  library(shiny)
  library(micromodal)

  server <- \(input, output, session) {

  }

  ui <- bslib::page(
    title = "Micromodal",
    theme = bslib::bs_theme(version = 5),
    # inform shiny to use {micromodal}:
    use_micromodal(),
    # your normal UI code:
    tags$div(
      class = "container",
      tags$div(
        class = "container my-5",
        tags$h1("Micromodal.js in Shiny", class = "mb-5"),
        # trigger for "modal-1"
        actionButton(
          inputId = "show_modal_1",
          label = "Exhibit 1",
          class = "btn-outline-primary px-3",
          `data-micromodal-trigger` = "modal-1"
        ),
        # trigger for "modal-2"
        actionButton(
          inputId = "show_modal_2",
          label = "Exhibit 2",
          class = "btn-outline-primary px-3",
          `data-micromodal-trigger` = "modal-2"
        )
      ),
      # modal-1:
      micromodal(
        id = "modal-1",
        title = "Login",
        content = tagList(
          textInput(
            inputId = "name",
            label = "Name",
            width = "400px"
          ),
          passwordInput(
            inputId = "password",
            label = tags$div(
              tags$span("Password"),
              tags$span("(required)", class = "text-muted fw-light")
            ),
            width = "400px"
          ) |> tagAppendAttributes(class = "mb-0"),
          tags$div(
            "Must be atleast 6 characters long.",
            class = "text-muted fw-light"
          )
        ),
        footer = tagList(
          tags$button(
            class = "modal__btn modal__btn-primary",
            "Continue"
          ),
          tags$a(
            href = "#",
            class = "ms-3",
            `data-micromodal-close` = NA,
            `aria-label` = "Close this dialog window",
            "Cancel"
          )
        )
      ),
      # modal-2:
      micromodal(
        id = "modal-2",
        title = "Micromodal",
        content = tagList(
          tags$p("This is a completely accessible modal."),
          tags$p(
            "Try hitting the",
            tags$code("tab"),
            "key* and notice how the focus stays",
            "within the modal itself. To close modal hit the",
            tags$code("esc"),
            "button, click on the overlay or just click the close button."
          ),
          tags$p("*", tags$code("alt + tab"), "in safari")
        ),
        footer = tagList(
          tags$button(
            class = "modal__btn modal__btn-primary",
            "Continue"
          ),
          tags$button(
            class = "modal__btn ms-2",
            `data-micromodal-close` = NA,
            `aria-label` = "Close this dialog window",
            "Close"
          )
        )
      )
    )
  )

  shinyApp(ui, server)
}
}
