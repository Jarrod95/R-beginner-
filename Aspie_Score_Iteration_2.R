# (1) Define the data building blocks required for plotting purposes [uses
# a subset of the OAC results plotted above]

var.names <- c("ndTalent", "ndPerception", "ndCommunication", "ndRelationship", "ndSocial", "ntSocial", "ntRelationship", "ntfCommunication", "ntPerception",  "ntTalent")
var.order = seq(1:10)
nDiverse <- c(10, 8.5, 5, 5, 5, 2, 6.5, 1, 1, 3)
nTypical <- c(10, 6, 4, 4.5, 4.5, 1.5, 7, 1, 2.5, 3.5)
group.names <- c("Nov 2018", "Jan 2020")


# (2) Create df1: a plotting data frame in the format required for ggplot2

df1.a <- data.frame(matrix(c(rep(group.names[1], 10), var.names), nrow = 10, ncol = 2), 
                    var.order = var.order, value = nDiverse)
df1.b <- data.frame(matrix(c(rep(group.names[2], 10), var.names), nrow = 10, ncol = 2), 
                    var.order = var.order, value = nTypical)

df1 <- rbind(df1.a, df1.b)
colnames(df1) <- c("group", "variable.name", "variable.order", "variable.value")
df1

# (3) Create a radial plot using ggplot2
library(ggplot2)
ggplot(df1, aes(y = variable.value, x = reorder(variable.name, variable.order), ymin = 0, ymax = 10, 
                group = group, colour = group),  size = 10) + coord_polar(theta = "x", direction = 1) + geom_point() + geom_path() + 
  labs(title = "Aspie Score 2018 & 2020") + xlab(NULL) + ylab(NULL) 