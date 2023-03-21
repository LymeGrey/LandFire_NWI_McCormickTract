library(chorddiag)    #Using "chorddiag" to create the diagram in this case
library(readr)
library(readxl)
library(dplyr)
library(tidyverse)    #"tidyverse", "tidygraph" and "igraph" are needed to convert to matrix
library(igraph)
library(tidygraph)
library(networkD3)    #Network for saving .html


# Create  data
my_data <- read_csv("C:/GC488/LearningR/data/McCSimplified.csv")


# Set source and target
my_data$source <- as.factor(my_data$source)
my_data$target <- as.factor(my_data$target)


#Selecting what data I want to use
my_data<-my_data %>% select("source", "target", "value")


#Converting to matrix
my_data<-as.matrix(as_adjacency_matrix(as_tbl_graph(my_data),attr = "value"))


#Creating chord diagram
chord <- chorddiag(data = my_data,
                   groupnamePadding = 20,
                   groupPadding = 5,
                   groupColors = c('#76D7C4','#1E8449','#34495E', '#5DADE2', '#CD6155','#ec7014', '#cc4c02', '#8c2d04'),
                   groupnameFontsize = 13,
                   showTicks = FALSE,
                   margin=150,
                   chordedgeColor = "#B3B6B7",
                   width = 1800,
                   height = 650,
)
chord

#Save
saveNetwork(chord, "C:/GC488/LearningR/outputs/chord_lf_nwi_McCormickTract.html", selfcontained = TRUE)                  



