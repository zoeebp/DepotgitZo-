#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Appli test CALCULE"),

   
    numericInput("num", "Entrez un nombre :", value = 1), #cadre dans lequel on entre la valeurs numérique 
    actionButton("btn", "Calculer"), #commande qui execute le code du server
   tags$h3(textOutput("resultat"), style ="color: blue") #sortie texte dans lequel le résultat est indiqué 
        )

