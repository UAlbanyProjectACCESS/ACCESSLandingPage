#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @import shinyjs
#' @noRd
app_server <- function(input, output, session) {




  observeEvent(input$NavLink, {
  SelectedNavigator<- input$Navigators
  SelectedNavLink<- navlinks[navlinks[,1]==SelectedNavigator,2]

  print(SelectedNavLink)
  if (nchar(SelectedNavLink) > 0) {
    browseURL(SelectedNavLink)
  } else{
    f7Popup(title = "Oops!",
            f7Align(h3("You forgot to select a Navigator!"),
                    closeOnEscape = T,
                    swipeToClose = T,
                    closeButton = T))
    showNotification("Oops, you forgot to select a Navigator!", duration = 4, closeButton = T)
  }
  })

}
