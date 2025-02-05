#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output) {

  observeEvent(input$btn, {  # Exécute le code lorsqu'on clique sur le bouton
    output$resultat <- renderText({
      if (is.na(input$num) || input$num == "") {  # Vérifie que l'entrée est valide
        "Veuillez entrer un nombre valide."
      } else {
        paste("Le double est :", input$num * 2)
      }
    })
  })  # <-- Ici, on ferme correctement observeEvent()
  
}
