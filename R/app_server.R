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
    "Evan - (Mon, Wed, Fri)",
    "Melissa - (Mon, Thurs)",
    "Meg - (Mon, Wed, Thurs)",
    "Shea - (Tues, Thurs, Fri)",
    "Clare - (Mon, Tues, Thurs)",
    "Mikhaela - (Mon, Tues, Wed)")

  first_item <- Navigator_List[1]

  Randomized_Navs <- Navigator_List[-(1)]

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

      # Display Description of what to expect in a Nav Appt only if "choose a navigator" is selected...
      if(input$Navigators == "Choose a Navigator"){

        output$NavApptDescription <- renderUI({
          tagList(
            f7Align(
              h2(tagList(tags$strong("What to expect in a navigation appointment"))),
              side = c("center")
            ),
            f7Align(
              h4("You will meet with a peer trained to have brief, motivational conversations with you about substance use, mental health, and sexual health. You may discuss your academic success, finances, and other aspects of your well-being. The peer navigator will connect you with relevant resources and supports as needed."),
              side = c("left")
            )
          )
        })

      } else {

        output$NavApptDescription <- renderUI({})

      }





  })


}
