
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

To install the package from CRAN use:

``` r
install.packages("micromodal")
```

You can install the dev version of `{micromodal}` with:

``` r
remotes::install_github("kennedymwavu/micromodal")
```

## Usage

1.  Call `use_micromodal()` anywhere in your UI, once.

``` r
library(shiny)
library(micromodal)

ui <- fluidPage(
  use_micromodal(),
  # the rest of your UI code
)
```

2.  Add a trigger for the modal. This is usually a button or a link.
    Give it the attribute `data-micromodal-trigger` with the value of
    the modal’s id.

``` r
ui <- fluidPage(
  use_micromodal(),
  actionButton(
    inputId = "trigger",
    label = "Trigger modal",
    `data-micromodal-trigger` = "modal-1"
  ),
  # the rest of your UI code
)
```

3.  Make the modal. Use `micromodal()` for this.

``` r
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
```

That’s it.

Here’s the full reprex:

``` r
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
```

- See [live demo here](https://mwavu.shinyapps.io/micromodal/).

- Read the [Get started guide](./articles/micromodal.html).

## About

You’re reading the doc about version: 0.0.0.9000

This README has been compiled on the:

``` r
Sys.time()
#> [1] "2023-08-14 23:43:14 EAT"
```
