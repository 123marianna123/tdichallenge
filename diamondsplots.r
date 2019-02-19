
### Installing and loading the package
install.packages("ggplot2")
library(ggplot2)

### Adding the diamonds data set to the working environment
data("diamonds")

### Exploring the data
?diamonds
str(diamonds)
dim(diamonds)
head(diamonds)

### Using ggplot2 via the qplot() function
qplot(x = carat, y = price, data = diamonds)

### Relationship looks exponential
qplot(x = log(carat), y = log(price), data = diamonds)

### Looking at volume of diamond (approximated by x*y*z) 
### and carat weight.
qplot(carat, x*y*z, data = diamonds)

### Isolating the most noticeable outlier
(ind1 <- with(diamonds, which(x*y*z > 3500)))
diamonds[ind1,]

### Comparing it to other 2 carat diamonds
(ind2 <- with(diamonds, which(carat == 2)))
diamonds[ind2,]

### Creating a small subset of the diamond data frame to 
### demonstrate colors.
set.seed(1410)
dsmall <- diamonds[sample(nrow(diamonds), 100), ]

### Ploting price by carat with smaller data set and 
### adding color and cut
qplot(carat, price, data = dsmall, color = color, shape = cut)


### Plotting price per carat by color with jittering
qplot(color, price/carat, data = diamonds, geom = "jitter", 
      alpha = I(1/10))
     
### Plotting conditional boxplots
qplot(color, price/carat, data = diamonds, geom = "boxplot", 
      alpha = I(1/10))

### Stacking the cut within each bar.
ggplot(diamonds, aes(clarity, color = cut)) + 
  geom_bar(position = "stack")

### Breaking bars up by cut within each clarity.
ggplot(diamonds, aes(clarity, color = cut)) + 
  geom_bar(position = "dodge")

### Plotting the proportional representation of each cut within
### each clarity type.
ggplot(diamonds, aes(clarity, color = cut)) + 
  geom_bar(position = "fill")

