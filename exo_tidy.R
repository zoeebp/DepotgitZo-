############################################################################
############################################################################
###################  ANALYSES - INDICATEURS  ###############################
############################################################################
############################################################################

## Date : 15/11/2024 
## Auteur : ....

##########################################################################
########################### Fonction utiles ##############################
##########################################################################


library(tidyverse)

#%>% 
#|> 
#read_excel()
#select() avec start_with() par exemple
#filter()
#mutate()
#fct_recode()
#group_by_()
#summarise()
#left_join() right_join() inner_join() full_join()
#pivot_longer() pivot_wider()
# ...


##########################################################################
########################### Import #######################################
##########################################################################
install.packages(readxl)

Sites <- read_excel("data/Sites.xlsx")
Microorga <- read_excel("data/Microorganismes.xlsx")
Nematodes <- read_excel("data/Nematodes.xlsx")
Vers <- read_excel("data/Lombrics.xlsx")

##########################################################################
######################### Jointure de tables #############################
##########################################################################
########### CONSIGNE : Choisir deux communauté biologique ###########

#associer sites et deux communauté

#left_join() right_join() inner_join() full_join()

#exemple

Sites, |> inner_join(., Microorga,join_by(ID))-> SiteMicro

Sites %>%
  inner_join(.,Microorga,join_by(ID)) %>%
  inner_join(.,Nematodes,join_by(ID)) -> SiteMN

##########################################################################
################## Sélection de lignes et colonnes ##################
##########################################################################
########### CONSIGNE : Choisir un site ###########

SiteMN %>%
  filter(SITE=="Feucherolles") %>%
  select(SITE:REPET_BLOC,ARGILE,contains("SABLE"), 
         ends_with("MIN"),PHYTO:CARNI)-> feMN

  

##########################################################################
####################### Créer des variables ##################
##########################################################################

feMN %>%
  mutate((Pphyto=PHYTO/(PHYTO+BACT+FONG+OMNI+CARNI))*100) -> feMN2
      View(feMN2)
##########################################################################
############################## Calculs par groupe ########################
##########################################################################
########### CONSIGNE : calculs sur plusieurs variables en même temps#####
      
feMN2 %>%
  group_by(MODALITE_DESCR) %>%
  summarise (mean_Pp=mean(Pphyto),sd_Pp=sd(Pphyto))
      
      
      


##########################################################################
####################### Graphique ########################
##########################################################################
########### CONSIGNE : un graphique en modifiant l'ordre et en recodant des modalités


##########################################################################
######################## Pivots ##########################################
##########################################################################

feMN %>%
    pivot_longer(cols=SABLE_F : SABLE_G,
                  names_to = "Type_Sable",
                  value_to = "Valeur_Sable")  -> feMNPIVOT
##########################################################################
####################### Enchaîner tous les traitements ###################
##########################################################################

