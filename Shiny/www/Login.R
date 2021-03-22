#### Log in module ###
USER <- reactiveValues(Logged = Logged)

passwdInput <- function(inputId, label) {
  tagList(
    tags$label(label),
    tags$input(id = inputId, type = "password", value = "")
  )
}

output$uiLogin <- renderUI({
  if (USER$Logged == FALSE) {
    wellPanel(
      textInput("userName", "userName"),
      passwdInput("passwd", "passwd"),
      br(),
      actionButton("Login", "Log in")
    )
  }
})

output$pass <- renderText({
  if (USER$Logged == FALSE) {
    if (!is.null(input$Login)) {
      if (input$Login > 0) {
        Username <- input$userName
        Password <- input$passwd
        Id.username <- if_else(PASSWORD$Username == Username,T,F)
        Id.password <- if_else(PASSWORD$Password == Password,T,F)
        if (Id.username & Id.password) {
            USER$Logged <- TRUE
        } else {
          c(input$userName,
          input$passwd)
        }
      }
    }
  }
})
