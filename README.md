# shinymarkdown

#### Use a WYSIWYG Markdown Editor in Shiny

<!-- badges: start -->

[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

<!-- badges: end -->

{shinymarkdown} packages JavaScript's [Toast UI](https://github.com/nhn/tui.editor) Markdown editor for use in Shiny.

### :bangbang: \| NOTE: THIS PACKAGE IS UNDER ACTIVE DEVELOPMENT AND ITS API IS LIKELY TO CHANGE \|

## Table of contents

-   [Installation](#installation)
-   [Demos](#demos)
-   [Feedback](#feedback)
-   [Code of Conduct](#code-of-conduct)

------------------------------------------------------------------------

## Installation

You can install the development version of {shinymarkdown} from Github with:

``` {.r}
remotes::install_github("jcrodriguez1989/shinymarkdown")
```

## Demos

{shinymarkdown} is still under active development, and its API is likely to change. It is best to use the editor in your browser window (Google Chrome or Safari). Below is an example of {shinymarkdown} with the left panel as the Markdown Editor and the right panel as the (live) HTML preview.

### Basic Usage

If you just want to plop in an editor, the following code will work! For customizing the appearance/functionality of the Editor, please see the [editor customization](#editor-customization) section below or the documentation for the `markdownEditorInput()` function.

``` {.r}
library("shiny")
library("shinymarkdown")
ui <- fluidPage(
  useShinyMarkdownEditor(),
  markdownEditorInput("editor1")
)

server <- function(input, output, session) {}

shinyApp(ui, server)
```

### Accessing the Editor's Contents

``` {.r}
library("shiny")
library("shinymarkdown")
ui <- fluidPage(
  useShinyMarkdownEditor(),
  markdownEditorInput("editor1", height = "300px")
)

server <- function(input, output, session) {
  
  # Print the Markdown
  observe({print(input$editor1)})
  
}

shinyApp(ui, server)
```

### Additional Features

#### Editor Customization

{shinymarkdown} provides different arguments for customizing the Markdown editor's appearance and functionality. The following options, accessible through `?marker()` are provided:

|      Parameter      |                                                                           Description                                                                           |
|:-------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|    `min_height`     |                           The editor's minimum height value (pixels). Default = '300px'. This is overwritten by the height parameter.                           |
|      `height`       |                  The editor's height value, applied as a border-box. Example values include "300px", "100%", and "auto". Defaults to "500px".                   |
|   `preview_style`   |                                       The Markdown editor's preview style. Either "tab" or "vertical". Default is "tab".                                        |
| `initial_edit_type` |                                              Initial editor type: "markdown" or "wysiwyg". Default is "markdown".                                               |
|     `language`      |                                                         Editor language ISO code. Defaults to "en-US".                                                          |
|   `iniial_value`    |                                 Should the editor have text already present? If so, supply a character string. Default is NULL.                                 |


## Feedback

If you want to see a feature, or report a bug, please [file an issue](https://github.com/jcrodriguez1989/shinymarkdown/issues) or open a [pull-request](https://github.com/jcrodriguez1989/shinymarkdown/pulls)! As this package is just getting off the ground, we welcome all feedback and contributions. See our [contribution guidelines](.github/CONTRIBUTING.md) for more details on getting involved!

## Code of Conduct

Please note that the shinymarkdown project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
