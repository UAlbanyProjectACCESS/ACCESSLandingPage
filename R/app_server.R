#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @import shinyjs
#' @noRd
app_server <- function(input, output, session) {



  observeEvent(input$Navigators, {
      SelectedNavigator<- input$Navigators
      SelectedNavLink<- navlinks[navlinks[,1]==SelectedNavigator,2]
      shortname<-navlinks[navlinks[,1]==SelectedNavigator,5]
      buttontext<- paste("Schedule with ", shortname, sep = "")

      if (input$Navigators != "Choose a Navigator"){
        output$LinkButton<-renderUI({
          tagList(
          f7Button(label = buttontext, href=SelectedNavLink)
          )
        })
      } else {
        output$LinkButton<-renderUI({})
        }

      SelectedNavigator_picture_link<- navlinks[navlinks[,1]==input$Navigators,3]
      Image_link<- paste("<center><img src='",SelectedNavigator_picture_link,"' width=20%></center>")

      SelectedNavigator_info<-navlinks[navlinks[,1]==input$Navigators,4]
      Virtual_info<-navlinks[navlinks[,1]==input$Navigators,6]
      output$NavDescription<-renderUI({
        tagList(
          HTML(Image_link),
          f7Align(h5(SelectedNavigator_info),side=c("center")),
          br(),
          f7Align(h5(Virtual_info),side=c("center"))

        )
      })


  })


}
