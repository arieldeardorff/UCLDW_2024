## Analytics for UCSF Data

## load packages
install.packages("readxl")
library(readxl)
library(ggplot2)
library(forcats)

## read in data
data <- read_excel("UCSFData.xlsx", sheet = "Workshops")

# Make a basic plot
ggplot(data, aes(x=Workshop, y=Total)) +
  geom_bar(stat = "identity") +  coord_flip()

#re-order based on amount
data %>%
  mutate(Workshop = fct_reorder(Workshop, Total)) %>%
  ggplot( aes(x=Workshop, y=Total)) +
  geom_bar(stat="identity") +
  coord_flip()+
  geom_text(aes(label = Total), colour = "white", position = position_stack(vjust = 0.5), size = 3)
