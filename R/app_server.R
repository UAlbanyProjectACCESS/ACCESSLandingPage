#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @import shinyjs
#' @noRd
app_server <- function(input, output, session) {

  Navigator_List<-c("Choose a Navigator",
    "Melissa - (Mon, Thurs)",
    "Evan - (Mon, Wed, Fri)",
    "Chioma - (Tues, Thurs, Fri)",
    "Meg - (Mon, Wed, Thurs)",
    "Shea - (Tues, Thurs, Fri)",
    "Clare - (Mon, Tues, Thurs)",
    "Mikhaela - (Mon, Tues, Wed)")

  first_item <- Navigator_List[1]
  Randomized_Navs <- Navigator_List[-1]

  shuffled_navs <- sample(Randomized_Navs)

  randomized_list <- c(first_item, shuffled_navs)

  print(randomized_list)

  output$Randomized_Nav_List<-renderUI({
    tagList(
      f7SmartSelect("Navigators", label=NULL, placeholder = "Choose a Navigator",
                    choices = randomized_list,
                    selected = "Choose a Navigator", openIn = c("sheet"), searchbar = F, virtualList = F)
    )
  })



  observeEvent(input$Navigators, {
      SelectedNavigator<- input$Navigators
      print(SelectedNavigator)
      SelectedNavLink<- NEW_navlinks[NEW_navlinks[,1]==SelectedNavigator,2]
      shortname<-NEW_navlinks[NEW_navlinks[,1]==SelectedNavigator,5]
      buttontext<- paste("Schedule with ", shortname, sep = "")

      if(input$Navigators != "Choose a Navigator"){
        output$LinkButton<-renderUI({
          tagList(
          f7Button(label = buttontext, href=SelectedNavLink)
          )
        })
      } else {
        output$LinkButton<-renderUI({})
        }

      SelectedNavigator_picture_link<- NEW_navlinks[NEW_navlinks[,1]==input$Navigators,3]
      Image_link<- paste("<center><img src='",SelectedNavigator_picture_link,"' width=20%></center>", sep = "")

      SelectedNavigator_info<-NEW_navlinks[NEW_navlinks[,1]==input$Navigators,4]
      Virtual_info<-NEW_navlinks[NEW_navlinks[,1]==input$Navigators,6]
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
