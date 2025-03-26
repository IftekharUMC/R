#call library
library(ggplot2)
#call database
my_data <- read.csv("P_values.csv")

# Basic scatter plot
ggplot(my_data, aes(x=POS, y=Log_p)) + geom_point(size=2, shape=21, color= "blue") + geom_hline( yintercept = 2, color = "red")
