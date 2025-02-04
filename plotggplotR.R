#graphique

#fonction graph   hist(),  plot ()

iris #déja dans R, descrition de 150 espèces de plantes



#graphics de Rbase (=R par défaut)
hist(iris$Sepal.Length)
plot(iris$Petal.Length, iris$Petal.Width)

boxplot(iris$Petal.Length~ iris$Species)
plot(iris$Petal.Length ~ iris$Species)


plot(iris$Petal.Length ~ iris$Petal.Width)

points(iris$Petal.Length[iris$Species=="setosa"] ~ 
         iris$Petal.Width[iris$Species=="setosa"],
          col="red", pch=16)
#point : 

par(mfrow=c(1,2)) 
boxplot(iris$Petal.Length~ iris$Species)
stripchart(iris$Petal.Length~ iris$Species)



install.packages("ggplot2")
library(ggplot2)

ggplot(data = iris, 
    mapping = aes(x=Petal.Length, y= Petal.Width, colour = Species))+
  geom_point()+
  geom_smooth()+
  theme_light()
  facet_grid(rows = vars(Species))
#mapping on dit qui on veut en x et en y, lié à la fonction aes
  
  
  ggplot(data = iris, 
         mapping = aes(x=Petal.Length, y= Petal.Width, group= Species))+
    geom_point()+
    geom_smooth(method = "lm", aes(colour = Species))+
    theme_light()
  facet_grid(rows = vars(Species))
  
  #plein de possibilité 
  
  #TD
  
  
  install.packages("dplyr")
  library(dplyr)
  data("starwars")
  starwars
  
  data("diamonds")
  diamonds
  
 
  
  starwars
  
 
   ggplot(data = starwars, 
         mapping = aes(x=mass, y= eye_color, colour = sex))+
    geom_point()+
    theme_dark()+
     geom_violin()
   
starwars
   
   ggplot(data = starwars,
          mapping = aes(x = height, y = mass, color = hair_color)) +
     geom_point(alpha = 0.9) + 
     geom_line(aes(linetype = species), size = 3) 
   # Lignes épaisses moches
     scale_color_manual(values = c("red", "lime", "cyan", "magenta", "yellow", "black", "pink")) +  # Couleurs horribles

       
       library(ggplot2)
     library(dplyr)
     
     
     data <- starwars %>%
       filter(!is.na(height) & !is.na(mass) & !is.na(hair_color) & !is.na(gender) & !is.na(species)) %>%
       sample_n(20) %>%  # Échantillonnage pour éviter trop de points
       mutate(
         hair_color = as.factor(hair_color),
         gender = as.factor(gender),
         species = as.factor(species)
       )
     

     ggplot(data, aes(x = height, y = mass, color = hair_color, shape = gender, size = birth_year)) +
       geom_point(alpha = 0.9) + 
       geom_line(aes(linetype = species), size = 3) +  # Lignes épaisses moches
       scale_color_manual(values = c("red", "limegreen", "cyan", "magenta", "yellow", "black", "pink", "orange", "brown")) +  
       theme(
         panel.background = element_rect(fill = "yellow"),  # Fond 
         plot.background = element_rect(fill = "hotpink"),  
         panel.grid.major = element_line(color = "green", linetype = "dotted", size = 2),
         panel.grid.minor = element_line(color = "blue", linetype = "dashed", size = 1),  
         axis.text = element_text(size = 15, angle = 90, face = "bold", color = "purple"),
         axis.title = element_text(size = 20, face = "italic", color = "blue"),
         legend.background = element_rect(fill = "black"),
         legend.text = element_text(color = "white", size = 12),
         plot.title = element_text(size = 30, face = "bold", color = "green")
       ) 
       
     
     
       
          
