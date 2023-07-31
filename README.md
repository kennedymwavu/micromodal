
<!-- README.md is generated from README.Rmd. Please edit that file -->

# micromodal

<!-- badges: start -->

[![R-CMD-check](https://github.com/kennedymwavu/micromodal/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kennedymwavu/micromodal/actions/workflows/R-CMD-check.yaml)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
<!-- badges: end -->

Modal dialogs for R Shiny via
[Micromodal.js](https://github.com/Ghosh/micromodal).

## Installation

You can install the dev version of `{micromodal}` with:

``` r
remotes::install_github("kennedymwavu/micromodal")
```

## Usage

See [live demo here](https://mwavu.shinyapps.io/micromodal/).

<details>
<summary>
Show code
</summary>

``` r
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
      title = "🔒 Login",
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
      title = "Micromodal 🔥",
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
```

</details>

## About

You’re reading the doc about version: 0.0.0.9000

This README has been compiled on the:

``` r
Sys.time()
#> [1] "2023-07-31 22:34:00 EAT"
```
