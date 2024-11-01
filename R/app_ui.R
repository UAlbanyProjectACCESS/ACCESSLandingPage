#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic

    shinyMobile::f7Page(
      title = "Project ACCESS Scheduling Portal",
      options = list(theme=c("auto"), dark=TRUE, preloader = F,  pullToRefresh=F),
      allowPWA=TRUE,
      f7TabLayout(
        # panels are not mandatory. These are similar to sidebars
        navbar = f7Navbar(
          title= "Schedule with a Project ACCESS Navigator"),

        # f7Tabs is a special toolbar with included navigation
        f7Tabs(
          animated = TRUE,
          id = "tabs",
          f7Tab(
            tabName = "SchedulingTab",
            icon = f7Icon("house"),
            active = TRUE,
            hidden= T,
# UNDER CONSTRUCTION MESSAGE
#             f7Align(h1("The Scheduling System is Currently Under Construction."),side = c("center")),
#             f7Align(h2("Please check back later."),side = c("center")),
#             br(),
#             f7Align(h3("We apologize for the inconvenience!"),side = c("center")),



            f7Block(
              f7Card(
                uiOutput("NavDescription"),
                uiOutput("LinkButton")),

              f7Shadow(
                intensity = 5,
                hover = TRUE,
                f7Card(
                  f7Align(h2("Select a Navigator to view their schedule:"), side = c("left")),
                  f7SmartSelect("Navigators", label=NULL, placeholder = "Choose a Navigator",
                           choices = c(
                             "Choose a Navigator",
                             "Evan - (Mon, Wed, Thurs, Fri)",
                             # "Julia - (Mon, Tues, Thurs)",
                             "Melissa - (Mon, Tues, Thurs)",
                             "Chioma - (M-F)",
                             "Meg - (Mon,Wed, Thurs)",
                             "Shea - (Tues, Thurs)",
                             "Clare - (Tues, Thurs)",
                             "Mikhaela - (Mon, Wed)"),
                           selected = "Choose a Navigator", openIn = c("sheet"), searchbar = F, virtualList = F),


                  # f7Picker("Navigators", label=NULL, placeholder = "Choose a Navigator",
                  #          choices = c(
                  #              "Choose a Navigator",
                  #              "Meg - (Mon,Tues, Thurs)",
                  #              "Mikhaela - (Mon, Thurs)",
                  #              "Chioma - (Mon, Wed, Thurs)",
                  #              "Evan - (Mon, Wed, Fri)",
                  #              "Clare - (Tues, Wed, Thurs)",
                  #              "Caroline - (Mon, Tues, Fri)",
                  #              "Pat  - (Wed, Thurs)",
                  #              "Shea - (Tues, Fri)"), rotateEffect = T,
                  #          openIn = "auto", scrollToInput = T, toolbar = F, toolbarCloseText = NULL,
                  #          closeByOutsideClick = TRUE, sheetSwipeToClose = F),

                  br(),
                  footer = NULL,
                  hairlines = F, strong = T, inset = F, tablet = FALSE))

            )






          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  # add_resource_path(
  #   "www",
  #   app_sys("app/www")
  # )

  tags$head(
    favicon(),
    # bundle_resources(
    #   path = app_sys("app/www"),
    #   app_title = "MassBaselineCleaner"
    # )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()

    HTML('<link rel="stylesheet" type="text/css" href="https://ewokozwok.github.io/MHScreener/www/framework7.bundle.min.css">')

  )
}
