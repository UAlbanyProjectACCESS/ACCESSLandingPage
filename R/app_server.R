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


  if (input$Navigators == "Choose a Navigator"){
    showNotification("Oops, you forgot to select a Navigator!", duration = 2, closeButton = T)
  }

  })


  observeEvent(input$Navigators, {
      SelectedNavigator<- input$Navigators
      SelectedNavLink<- navlinks[navlinks[,1]==SelectedNavigator,2]

      if (input$Navigators != "Choose a Navigator"){
        output$LinkButton<-renderUI({
          tagList(
          f7Button(label = "View the Navigator's Schedule", href=SelectedNavLink)
          )
        })
        }

      SelectedNavigator_picture_link<- navlinks[navlinks[,1]==input$Navigators,3]
      Image_link<- paste("<center><img src='",SelectedNavigator_picture_link,"' width=30%></center>")

      SelectedNavigator_info<-navlinks[navlinks[,1]==input$Navigators,4]
      output$NavDescription<-renderUI({
        tagList(
          HTML(Image_link),
          f7Align(h4(SelectedNavigator_info),side=c("center"))
        )
      })


  })


}
