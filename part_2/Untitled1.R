






































#T1~~~简单运算，矩阵
#T2~~~给数据，几个数据串做成框，看列名，前几行，中位数平均啥的，倾斜
#T3~~~散点图，条形图，折线图，箱型图等等
#T4~~~分析，假设性检验和P值，线性回归（系数），ANOVA（星号多，p越小，拒绝原假设）
#T5~~~蛋疼方程和循环
#T6~~~Poisson，Monte Carlo integration，Rejection sampling(Beta)
#EX~~~Galton board,  Chebyshev’s theorem



# T1
# 1-1 Evaluate the following expressions.
#12.3 + 232.2
12.3+232.2
#log(e^2 + 3)
log(exp(2)+3)
#sin(𝜋/4+ 3)
sin(pi/4+3)
#tan^−1(1.3^2)
atan(1.3^2)

# 1-2 Let 𝑥 = 2.3 and 𝑦 = 3.1. Evaluate the following expressions.
x <- 2.3
y <- 3.1
#根号下(x^4-5y)
sqrt(x^4-5*y)
#e^x-3x+y^x
exp(x) - 3*x + y^x
#cos^-1(x/y)
acos(x/y)
#log(z+3/z) where z=x^2-log(10y)
z <- x^2 - log(10*y)
log(z+3/z)

# 1-3 Let 𝑥 = 2.3 and 𝑦 = 3.1. 
#Determine whether the following expressions are true or false.
x <- 2.3
y <- 3.1
#3𝑥 > 2𝑦
3*x > 2*y
#x^y<=y^x and 3^x+y^2.2
(x^y <= y^x) & (3^x > y^2.2)
#cos(𝑥) = 0 or sin(𝑦) > 0
(cos(x) == 0) | (sin(y)>0)

# 1-4 Let 𝒙 and 𝒚 be vectors where 𝒙 = (6,4,3,20) and 𝒚 = (12,46,2,1). 
#Evaluate the following expressions.
x <- c(6,4,3,20)
y <- c(12,46,2,1)
#x + 2y
x + 2*y
#∑ (i=1~4)xiyi
sum(x*y)
#max(𝒛) where the 𝑖th component of zi=xi^2-10yi,
#Which component gives this maximum value of z?
z <- x^2 - 10*y
max(z)
which.max(z)
#How would you code to get the components of 𝒚 that is bigger than 10?
y[y>10]
#Run this following code: c(x, y). What do you think happen here?
c(x,y)#It combines the vector 𝑥 and 𝑦 into one vector.组合成一个向量
#Run this following code: sum(x[x>5]). What do you think happen here?
sum(x[x>5])#It calculates the sum of 𝑥 with values greater than 5.大于5的x的和
#Run this following code: sum(x>5). What do you think happen here?
sum(x>5)#数量The code calculates the number of component in 𝑥 with values greater than 5.

# 1-5 Without using only the c() function, create the following:
#A vector containing integers from -10 to 10.
-10:10
#A sequence of numbers from 0 to 100 where the length of sequence is 1000.
seq(from=0, to=100, length.out=1000)
#A vector of 0’s with length 10.
rep(0, 10)# or vector("numeric", 10)
#The vector (“A”, “B”, “C”, “A”, “B”, “C”, “A”, “B”, “C”).
rep(c("A", "B", "C"), times=3)
#The vector (“A”, “A”, “A”, “B”, “B”, “B”, “C”, “C”, “C”).
rep(c("A", "B", "C"), each=3)

# 1-6 Let 𝐴 = [21 3 ] and 𝐵 = [12 4 ]. Answer the following questions.
#              [2  14]          [5  51]
#Assign the variables A and B as the matrix above. 
#Run this following code: class(A). What do you get here?
A <- matrix(c(21,3,2,14), ncol=2, byrow=TRUE)
B <- matrix(c(12,5,45,1), ncol=2, byrow=TRUE)
class(A)
#Evaluate A+B
A+B#叠加
#Evaluate AB
A %*% B
#Evaluate A^-1
solve(A)
#Evaluate (A^T B)^-1
solve(t(A) %*% B)

# 1-7 Let D = [3  52  7]and x=[75] Assign the variables D and x as given. 
#             [2  10  1]      [2 ]
#Let E be a 2 × 4 matrix where the first 3 columns of E is the same as D
#and the fourth column of E is the same as x. How would you code the matrix 𝐸 in R?
D <- matrix(c(3,52,7,2,10,1), nrow=2, byrow=TRUE)
x <- matrix(c(75,2),nrow=2)
E <- cbind(D,x)
#Let F be a 2 × 2 matrix where F is the first two columns of D.
#How would you get matrix F using R?
F <- D[,c(1,2)]







# T2
# 2-1-a Using the data.frame() function,
#create a new data frame named TIRES using the following data:
x <- c(30,30,31,31,32,32,33,33,34,34,35,35,36,36)
y <- c(29.5,30.2,32.1,34.5,36.3,35,38.2,37.6,37.7,
       36.1,33.6,34.2,26.8,27.4)
TIRES <- data.frame(x=x, y=y)
# 2-1-b Using names(), change the variable names in the data frame 
#such that the variable x is changed to pressure, and the variable y is changed to mileage.
names(TIRES) <- c("pressure", "mileage")
# 2-1-c Print out the first 4 rows.
TIRES[1:4,]#or head(TIRES, n=4)
# 2-1-d Print out the rows in the dataset with mileage is greater than 35
subset(TIRES, mileage>35)#or TIRES[TIRES$mileage>35,]
# 2-1-e Print out your current working directory.
getwd()
# 2-1-f Using the write.csv() function, save the data frame into a CSV file. Verify the file.
write.csv(TIRES, file="Question1e.csv",
          row.names=FALSE)

# 2-2 Using read.table() or read.csv() functions, import the dataset into R,
#and assign it to a data frame named TestScore.
TestScore <- read.csv("TestScore.csv")
# What are the available variables in the data frame?看变量或列名
names(TestScore)
# Print out the 8th row of the data frame.
TestScore[8,]
# Using the describe() function in psych package,
# print out the summary statistics for the data frame.
library(psych)
describe(TestScore)
# Calculate the mean, median, and variance for the GPAs of the students.
mean(TestScore$GPA)
median(TestScore$GPA)
var(TestScore$GPA)
# Calculate the first and third quartiles for the GPAs of students, and its interquartile range.
quantile(TestScore$GPA, c(0.25,0.75))
IQR(TestScore$GPA)
# Calculate skewness and kurtosis for the GPAs of the students.
# Is the data skewed to the left or to the right? Is the data platykurtic or leptokurtic?
library(e1071)
skewness(TestScore$GPA)#Skewed to the right (but only slightly), since the skewness is positive（正数）. 
kurtosis(TestScore$GPA)#Platykurtic since the kurtosis is negative（负数）.
# Print out all rows containing students from Class B.
#Assign these values to another data frame.
subset(TestScore, Class=="B")
#or
TestScore[TestScore$Class=="B",]
classB <- subset(TestScore, Class=="B")
# Calculate the mean, median, and variance for the IQ of students in Class B.
mean(classB$IQ)
median(classB$IQ)
var(classB$IQ)
# Calculate the range for the IQ of students in Class B.
max(classB$IQ) - min(classB$IQ)
# Using quantile(), what is minimum value for the top 15% of students’ study hours?
quantile(TestScore$StudyHours, probs=0.85)
# Find the mode for the study hours of the students.
table(TestScore$StudyHours)
names(table(TestScore$StudyHours))[which.max(
      table(TestScore$StudyHours))]

# 2-3 Import the dataset into R.
property_sales <- read.csv(file.choose())
# Print out the name of all the available variables in the dataset.
names(property_sales)
# Print out the first 6 rows of the dataset.
head(property_sales, 6)#property_sales[1:6,]
# Using the table() function on the neighbourhood variable,
#print out how many observations there are for each neighbourhood.
#Which neighourhood has the highest frequency?
table(property_sales$Neighbourhood)
# What is the highest and lowest sales price in the dataset?
#Calculate the value for its range.
max(property_sales$Sales)
min(property_sales$Sales)
max(property_sales$Sales)-min(property_sales$Sales)
# Calculate the mean, median and variance for the sales price of all the properties.
mean(property_sales$Sales)
median(property_sales$Sales)
var(property_sales$Sales)
# Calculate the mean, median and variance for the sales price of the properties in Davis Isles.
Davis <- subset(property_sales,
                Neighbourhood == "DavisIsles")
mean(Davis$Sales)
median(Davis$Sales)
var(Davis$Sales)
# Calculate skewness and kurtosis for the sales price in Davis Isles.
#Is the data skewed to the left or to the right? Is the data platykurtic or leptokurtic?
library(e1071)
skewness(Davis$Sales)
kurtosis(Davis$Sales)
# Calculate the first, second, and third quartiles for the appraised land value
#for the properties in Cheval. Calculate its interquartile range.
Cheval <- subset(property_sales, 
                 Neighbourhood=="Cheval")
quantile(Cheval$Land.value, c(0.25,0.5,0.75))
IQR(Cheval$Land.value)







# T3
# 3-1 Run the following code first to assign the values to each variable.
year <- 2012:2019
engineering <- c(20397, 21432, 22206, 20778, 22362, 23669, 23400, 24137)
science <- c(10680, 11561, 11690, 10592, 11858, 13100, 11796, 12267)
technology <- c(5124, 6679, 6828, 6200, 9553, 10809, 11396, 10682)
# Produce a scatterplot between the number of engineering students and the years
# Modify your code to include a suitable title and the labels for x-axis and y-axis.
plot(x=year, y=engineering, main="Plot of 
    engineeering students over the years", 
     ylab="Number of students", xlab="Years")#or plot(engineering~year)
# How would you modify your code if you want to
#draw lines connecting each subsequent point?
plot(x=year, y=engineering, main="Plot of 
    engineeering students over the years", 
     ylab="Number of students", xlab="Years", type="o")
# Play around and experiment with the arguments for the plot() function.
plot(x=year, y=engineering, main="Plot of 
    engineeering students over the years", 
     ylab="Number of students", xlab="Years", type="o", col="magenta", 
     pch=3, cex=1.5, lty=2, lwd=1, ylim=c(20000,30000))
# Now, using the functions points() or lines(),
#add the plots showing the number of science and technology students for each year to the existing diagram.
#The plot should now consist of three lines/points, one for each category.
#Make sure the colours and characters used for each category are distinguishable.
#You may need to modify the ylim in the original plot() to fit all the lines/points.
plot(x=year, y=engineering, main="Plot of number of 
     students over the years", ylab="Number of students", 
     xlab="Years", type="o", col="magenta", pch=3, 
     cex=1.5, lty=2, lwd=1, ylim=c(5000,25000))
points(x=year, y=science, type="o", col="blue")
points(x=year, y=technology, type="o", 
       col="darkgreen", pch=2)
# Using the legend() function, add suitable legends in the plot to show what each line/point refers to.
plot(x=year, y=engineering, main="Plot of number of 
     students over the years", ylab="Number of students", 
     xlab="Years", type="o", col="magenta", pch=3, 
     cex=1.5, lty=2, lwd=1, ylim=c(5000,25000))
points(x=year, y=science, type="o", col="blue")
points(x=year, y=technology, type="o", 
       col="darkgreen", pch=2)
#和上面一样，只是多了下面这段
# "bottomright"是右下角，左上角是"topright"
legend(x="bottomright", legend=c("Engineering", 
                                 "Science", "Technology"), pch=c(3,1,2), 
       col=c("magenta","blue","darkgreen"), lty=c(2,1,1))

# 3-2 Load the mtcars dataset by running data(mtcars) in the R console.
# Draw a histogram for the miles per gallon (mpg) of the cars.
data(mtcars)
hist(mtcars$mpg, main="Histogram of mpg", xlab="mpg")
# The variable am is 0 if the car has an automatic transmission,
#and 1 if the car has a manual transmission.
#Draw a side-by-side boxplot to compare the miles per gallon (mpg) and the transmission of the car (am). Modify the labels for the boxplot.
boxplot(mpg~am, data=mtcars, 
        names=c("Automatic","Manual"), xlab="Transmission", 
        main="Boxplot of transmission vs mpg")
# Draw a scatterplot for miles per gallon (mpg) vs displacement (disp).
plot(mpg~disp, data=mtcars, main="Plot of mpg vs disp")
#或者plot(x=mtcars$disp, y=mtcars$mpg, main="Plot of mpg vs disp")
# Draw a scatterplot matrix with the variables mpg, disp, hp, and wt in the diagram.
pairs(~mpg+disp+hp+wt, mtcars)
# The code table(mtcars$gear) gives the frequency of cars
#with each of the number of forward gears.
#Using this frequency, draw a bar graph for the number of cars with the number of forward gears.
barplot(table(mtcars$gear), xlab="Gear", 
        ylab="Frequency", main="Bar graph of gear frequency")

# 3-3-a Draw a scatterplot matrix to show the relationships between sales, 
#land, and improvement values. Give this figure a good title.
property_sales <- read.csv(file.choose())
pairs(~Sales+Land.value+Improvement.value, 
      data=property_sales, main="Scatterplot matrix")
# 3-3-b Create a new column in the data frame named total which calculates the sum of land and improvement values.
#The new column is the total value of the property. Draw a scatterplot of sales in the y-axis vs total values in the x-axis.
#Give the figure a good title and axis labels.
property_sales$total <- property_sales$Land.value + 
                        property_sales$Improvement.value
plot(x=property_sales$total, y=property_sales$Sales, 
     main="Plot of sales vs total value",
     xlab="Total value", ylab="Sales")#这段要给下面复制
# 3-3-c Using curve() function with the argument add=TRUE, 
#add a straight line 𝑦 =−16.5 + 1.36𝑥 to the figure drawn in (b).
#Give this line a suitable colour and other properties to make it nicer.
#把上面那段复制，再接着
curve(-16.5+1.36*x, from=0, to=2500, add=TRUE, col="red", lty=2)#加上线
# 3-3-d Add a legend in the top left corner of the figure, to show the line created in (c) is a fitted line.
#上面复制，包括线
legend("topleft", legend="fitted line", lty=2, col="red")#加上图例
# 3-3-f calculates the difference between the sales value and 
#the given straight line. Then, draw a histogram of the residuals,
# setting the y-axis to be the probability for each bin. Give this figure a good title.
residuals <- property_sales$Sales - (-16.5+1.36*property_sales$total)
hist(residuals, freq=FALSE)
# 3-3-g The code below gives the pdf of a Normal distribution with the given mean and 
#standard deviation. Using this function, add the pdf line in the histogram drawn in (d).
residuals <- property_sales$Sales - (-16.5+1.36*property_sales$total)
hist(residuals, freq=FALSE)#复制上面
curve(dnorm(x, mean=mean(residuals), sd=sd(residuals)), 
      from=-400, to=600, add=TRUE, col="red")







# T4
# 4-1-a Run the lines above and test whether the mean score for 
#class A students is greater than 70. State the null and alternative hypotheses.
TestScore <- read.csv(file.choose())
class_A <- subset(TestScore, Class=="A")
class_B <- subset(TestScore, Class=="B")
t.test(x=class_A$Score, mu=70, alternative="greater")
#𝐻0: 𝜇𝐴 ≤ 70 vs 𝐻1: 𝜇𝐴 > 70
#where 𝜇𝐴 is the mean score for class A.
#The R output shows that the test statistic is 2.4528 and 𝑝-value for the test is 0.03512.
#Since the 𝑝-value is less than 𝛼 (0.05), we have enough evidence to reject the null hypothesis,
#and support the alternative hypothesis. We conclude that the mean score for class A is greater than 70.

# 4-1-b Test whether the variance of the scores of students in the two classes are equal. State the null and alternative hypothesis.
var.test(x=class_A$Score, y=class_B$Score)
#H0: 𝜎A^2 = 𝜎B^2 vs H1: 不等于
# the 𝑝-value is 0.4462, which is greater than the significance level 𝛼 = 0.05.
#Therefore there is not enough evidence to reject the null hypothesis. 
#We conclude that the two variances are equal.

# 4-1-c Test whether the mean GPA of students in Class A is equal to the mean GPA of students in Class B,
# assuming the variances are equal. State the null and alternative hypothesis.
t.test(x=class_A$GPA, y=class_B$GPA, var.equal=TRUE, 
       alternative="two.sided")
#𝐻0: 𝜇𝐴 = 𝜇B vs 𝐻1: 𝜇𝐴 ≠ 𝜇B
#𝑝-value is 0.2262,which is greater than the significance level 𝛼.
#Therefore there is not enough evidence to reject the null hypothesis.

# 4-1-d Using one-way ANOVA, test whether 
#the  mean GPA of students in Class A is equal to the mean GPA of students in Class B.
#Compare the p-value of your test here with the p-value found in (c).
summary(aov(GPA ~ Class, data=TestScore))#H0=,H1不等

# 4-1-e From the scatterplot, it is hypothesized that IQ can be used as a predictor for test score using the linear regression model.
#Fit the linear regression model using test score as the dependent variable and IQ as the independent variable.
#i Write down the fitted regression line.
plot(Score ~ IQ, data=TestScore)
model <- lm(Score ~ IQ, data=TestScore)
summary(model)
#ii Do the two variables test score and IQ have a significant linear relationship? Explain your answer.
#得𝑆𝑐𝑜𝑟𝑒 = −6.4157 + 0.8882 × 𝐼𝑄
#𝑝-value for variable IQ is 0.00427, which is smaller than 𝛼.
#Therefore, it can be concluded that the parameter related to IQ is non-zero,
# and that Score and IQ have a significant linear relationship.有关系
# The 𝑝-value is for testing 𝛽1 = 0 vs 𝛽1 ≠ 0 

# 4-2-a
#Using 𝑥1, 𝑥2, 𝑥3 and 𝑥4 as the predictors, 
#fit a linear regression model with 𝑦 as the response variable.
#Based on your results here, which predictors are significant to the model? 
#Use 10% significance level for your decision.
cement <- read.csv(file.choose())
model1 <- lm(y ~ x1 + x2 + x3 + x4, data=cement)
summary(model1)
#Based on the 𝑝-values, only the variable 𝑥1 has 𝑝-value less than 𝛼 = 0.1
#Therefore, only 𝑥1seems to be significant to the model.也可以看星号

# 4-2-b Now, using only 𝑥1and 𝑥2as the predictors, fit a linear regression model with 𝑦 as the response variable.
#Based on your results here, which predictors are significant to the model?
model2 <- lm(y ~ x1 + x2, data=cement)
summary(model2)
#After removing the variable 𝑥3and 𝑥4, the 𝑝-values for 𝑥1and 𝑥2are now very small. 
#Therefore, both of these variables (𝑥1and 𝑥2) are significant to the model.

# 4-2-c Write down the fitted regression model using the result in (b).
# 𝑦 = 52.58 + 1.468𝑥1 + 0.6623𝑥2 系数对应Estimate列，在分析结果里

# 4-2-d Using the model in (b) what is the estimated heat evolved in calories per gram of cement 
#when using 8% of tricalcium aluminate and 50% of tricalcium silicate?
# 直接代入： 𝑦 = 52.58 + 1.468(8) + 0.6623(50) = 97.44 calories.

# 4-3-a
#Run the lines above and test whether the sales for properties in Cheval and Hyde Park 
#have the same variance. State the null and alternative hypotheses
property_sales <- read.csv(file.choose())
cheval_sale <- subset(property_sales, Neighbourhood=="Cheval")$Sales
hydepark_sale <- subset(property_sales, Neighbourhood=="HydePark")$Sales
var.test(cheval_sale, hydepark_sale)
#H0 为两个𝜎^2等，H1不等
# p-value is very small (2.2 × 10−5), we have strong evidence to reject the 
#null hypothesis. We conclude that the two variances are not equal

# 4-3-b 
#Test whether the mean sales for properties in Cheval is smaller than the mean sales for 
#properties in Hyde Park, assuming that the variances for the two populations are not equal.
t.test(cheval_sale, hydepark_sale, alternative="less", var.equal=FALSE)
#"two.sided", "less", or "greater"
# p-value is smaller than 𝛼 = 0.05, we reject the null hypothesis.

# 4-3-c
#Using one-way ANOVA, test whether the mean land values are equal for all four
#neighbourhoods. State the null and alternative hypotheses.
#Neighbourhood列有几种名字
summary(aov(Land.value~Neighbourhood, data=property_sales))
#The p-value from the ANOVA is very small. Therefore we reject the null hypothesis

# 4-3-d
#Using one-way ANOVA, test whether the mean improvement values are equal for all four neighbourhoods.
summary(aov(Improvement.value~Neighbourhood, data=property_sales))

# 4-3-e Using land and improvement values as the regressors or independent variables,
#fit a linear regression model to predict the sales using the two regressors.

#i) Write down the fitted regression model.
fit <- lm(Sales~Land.value+Improvement.value, data=property_sales)
summary(fit)

#ii) Based on the results, is land value significant in the linear model? Explain your answer.
#The land value is significant in the regression model 显著
#since the p-value for the parameter related to the land value is very small.非常小

#iii) What is the estimated sales price of a property with $100 000 land value (or equivalently Land.value=100) 
#and $200 000 improvement value (or equivalently Improvement.value=200)?
#直接代入100和200
#𝑆𝑎𝑙𝑒𝑠 = −16.176 + 1.393 × 100 + 1.330 × 200 = 389.124 = $389 124







# T5
# Write down a function named vector_mean that calculates the mean of a vector. 
#Compare your result with the function mean.
vector_mean <- function(x){
  n = length(x)
  output = sum(x)/n
  return(output)
}
#Example output:
vector_mean(c(1,2,3))
mean(c(1,2,3))

# The %% operator calculates the remainder when a number is divided by another number.
#For example, 3 %% 2 will return 1 while 4 %% 2 will return 0.
#Another name for this operation is the modulus operation where 3 mod 2 = 1.
##看是不是整倍数
#Using this operator, write down a function that takes input two integer values, 𝑎 and 𝑏,
#and determine whether 𝑎 is a multiple of 𝑏.
#The function will return TRUE if 𝑎 is a multiple of 𝑏, and will return FALSE if 𝑎 is not a multiple of 𝑏.
#Note that if 𝑎 is a multiple of 𝑏, then 𝑎mod 𝑏 = 0.
multiple <- function(a,b){
  remainder <- a %% b
  if(remainder == 0){
    output=TRUE
  }
  if(remainder != 0){
    output=FALSE
  }
  return(output)
}
#Example output:
multiple(3,2)#(3,3),(27,5),(27,9)都试试

# Write a function that takes an input and calculate the square root of this input.
# The function should return two values, the solution and error check.
#If the input is not numerical or negative value, return NA as the solution, and error check is TRUE.
#Otherwise, return the square root of the input as the solution, and error check is FALSE.
#Note: remember to use list() to return multiple outputs.
square_root <- function(x){
  if(!is.numeric(x) | x<0){
    solution <- NA
    error <- TRUE
  } else {
    solution <- sqrt(x)
    error <- FALSE
  }
  return(list(solution=solution, error=error))
}
#Example output:
square_root("A")# 9,-9都试试

# Use the while loop to determine the number of terms required for the product 1 × 2 × 3 × 4 × ⋯ reaches above 10 million.
i <- 0
product <- 1
while(product < 10000000){
  i <- i+1
  product <- product*i
}
print(i)
#第11下输出

# The Fibonacci numbers, denoted as 𝐹𝑛, is a sequence of numbers
#that starts with 𝐹1 = 1and followed by the second number 𝐹2 = 1.
#For 𝑛 ≥ 3, it is given that 𝐹𝑛 = 𝐹𝑛−1 + 𝐹𝑛−2(注意n是下标)
#Write down a function that will take input 𝑛 and return the first 𝑛 numbers of the Fibonacci numbers.
Fibonacci <- function(n){
  output <- rep(1,n)
  if(n > 2){
    for(i in 3:n){
      output[i] <- output[i-1] + output[i-2]
    }
  }
  return(output)
}
#Example output:
Fibonacci(1)#数字随便搞搞

# Write a code using for loop that simulates the result of a die throw and
#calculates the sum of the numbers from 10 die throws.
#Note that the function sample can be used to randomly select a value out of the given input.
#For example sample(1:6, 1) will randomly select an integer between 1 to 6 with equal probability.
#等概率随机选择一个1到6之间的整数
summation <- 0
for(i in 1:10){
  die_value <- sample(1:6,1)
  summation <- summation + die_value
}
print(summation)

# The solutions to the quadratic equation 𝑎𝑥^2 + 𝑏𝑥 + 𝑐 = 0,
#Note that there is only one solution if 𝑏^2 − 4𝑎𝑐 = 0 and the solution does not exist if 𝑏^2 −4𝑎𝑐 < 0
quadratic <- function(a, b, c){
  disc <- b^2 - 4*a*c
  if(disc==0){
    x <- -b/(2*a)
    number_solution <- 1
  } else if(disc>0){
    x1 <- (-b-sqrt(disc))/(2*a)
    x2 <- (-b+sqrt(disc))/(2*a)
    x <- c(x1,x2)
    number_solution <- 2
  } else{
    x <- NA
    number_solution <- 0
  }
  return(list(solution = x, number_of_solution = 
                number_solution))
}
#Example output:分别是两个，一个，没有解
quadratic(1,0,-9)
quadratic(1,-6,9)
quadratic(1,0,9)

# You bought some stocks at a price of RM 1.00 per share.
#You decided to either cut your loss by selling the shares if the price goes to RM 0.75,
# or sell the shares for some profit if the price reaches RM 1.50.
#Assume that each day, the stock price may either decrease by 5 cents, 
#stay the same, or increase by 5 cents, with equal probability.
#
#Write a code that simulates your stock price each day and 
#determine how long it takes for the stock price to either reach RM 0.75 or RM 1.50.
#You can use sample(c(-0.05, 0,0.05), 1) to select a number between −0.05, 0, and 0.05 with equal probability.
#以相等的概率选择-0.05、0和0.05之间的数字。
price <- 1
day <- 0
while(price < 1.5 & price > 0.75){
  price <- price + sample(c(-0.05,0,0.05),1)
  day <- day+1
}
print(day)







# T6
#Suppose 𝑋 and 𝑌 are independent random variables such that
#𝑋 follows the Poisson distribution with mean 3, and 𝑌 follows the Poisson distribution with mean 4.
#
# Find the probability 𝑃(𝑋 = 3).
dpois(3, lambda=3)
# Find the probability 𝑃(𝑋 ≤ 3).
ppois(3, lambda=3)
# Generate 100 random samples of 𝑌 . Calculate its mean and variance. Compare these values 
#with the theoretical mean and variance of 𝑌 (mean(𝑌 ) = var(𝑌 ) = 4).
set.seed(100)
Y <- rpois(100, lambda=4)
mean(Y)
var(Y)

# In theory the random variable 𝑍 = 𝑋 + 𝑌 should follow the Poisson distribution with mean 7.
#Generate 1000 samples of 𝑍. Calculate its mean and variance.
#From your generated values of 𝑍, what is the estimated value for the probability 𝑃(𝑍 =7)? 
#Compare your answer with the theoretical probability using Poisson distribution with mean 7.
generate_Z <- function(n){
  X <- rpois(n, lambda=3)
  Y <- rpois(n, lambda=4)
  Z <- X+Y
  return(Z)
}
set.seed(100)
Z <- generate_Z(1000)
mean(Z)
var(Z)
table(Z)/1000 # estimated probability估计概率
dpois(7, lambda=7) # theoretical probability理论概率
#From the generated 𝑍, we estimate 𝑃 (𝑍 = 7) to be 0.145. And as shown, the true value for 𝑃 (𝑍 = 7) is 0.149.

# One such approximation technique is called the Monte Carlo integration.
#
#Write a function f, where the function calculates 𝑓(𝑥) = x^x
f <- function(x){
  return(x^x)
}

#Write a function which takes input 𝑛.
#The function will randomly generate 𝑛 samples of 𝑋 
  #from the uniform distribution with min 1 and max 2.
  #The function then estimates the integral by calculating 1/𝑛∑(1到n)f(𝑋𝑖)
  #The function will then return the estimate.
monte_carlo_int <- function(n){
  X <- runif(n, min=1, max=2)
  est <- 1/n*sum(f(X))
  return(est)
}

#Using the function written in (b), estimate the integral ∫(1到2)x^x dx
#Note: You can use the command “integrate(f, 1, 2)” in R to approximate the integral
#using another approximation method (not Monte Carlo integration).
set.seed(100)
monte_carlo_int(100000)
integrate(f, 1, 2) # compare using built-in function
#We can compare the result from our Monte Carlo method with the built-in function to 
#integrate numerically in R which gives the value 2.050446, which is not far from our result.相似相近

#The Beta(3,5) distribution has the probability density function (pdf)
#i) Generate a random value of 𝑥 using uniform distribution from 0 to 1.
#ii) Generate a random value of 𝑢 using uniform distribution from 0 to 2.4.
#iii) If 𝑢 ≤ 𝑓(𝑥) where 𝑓(𝑥) is the pdf of Beta(3,5), 
#then accept 𝑥 as a sample of Beta(3,5) distribution. Otherwise, reject it and repeat step (i) of the algorithm.
#
#Write a function that generates 𝑛 samples from Beta(3,5) distribution using the rejection sampling 
#algorithm. Then using your function, generate 1000 samples, plot a histogram of the samples, and 
#compare it to the pdf of Beta(3,5) distribution.
generate_x <- function(n){
  x <- c()
  n_accept <- 0
  while(n_accept < n){
    x1 <- runif(1, min=0, max=1)
    u <- runif(1, min=0, max=2.4)
    if(u <= dbeta(x1,3,5)){
      x <- c(x,x1)
    }
  }
  return(x)
}
set.seed(100)
x <- generate_x(1000)
length(x)
hist(x, freq=FALSE)
curve(dbeta(x,3,5), from=0, to=1, col="red", 
      add=TRUE)







# EX
#1-a
generate_X <- function(k) {
  # Starting position
  X <- 0
  
  # Simulate k steps
  for (i in 1:k) {
    # Randomly choose left (-1) or right (1) bounce with equal probability
    direction <- sample(c(-1, 1), 1)
    
    # Update the position based on the chosen direction
    X <- X + direction
  }
  
  return(X)
}
set.seed(123)  # 设置随机种子以确保结果可复现
result <- generate_X(10)  # 小球经过10步后的位置
print(result)


#1-b
generate_X_samples <- function(n, k) {
  # Initialize a vector to store the results
  results <- numeric(n)
  
  # Generate n samples of X after k steps
  for (i in 1:n) {
    results[i] <- generate_X(k)
  }
  
  return(results)
}
set.seed(123)  # 设置随机种子以确保结果可复现
samples <- generate_X_samples(5, 10)  # 生成5个样本，每个样本经过10步后的位置
print(samples)


#1-c
# 定义计算均值和方差的函数
calculate_mean_and_variance <- function(samples) {
  mean_value <- mean(samples)
  variance_value <- var(samples)
  return(c(mean_value, variance_value))
}

# 估计 k = 20 时的均值和方差
set.seed(123)  # 设置随机种子以确保结果可复现
samples_k20 <- generate_X_samples(1000, 20)  # 生成1000个样本，每个样本经过20步后的位置
result_k20 <- calculate_mean_and_variance(samples_k20)
print(paste("Mean for k = 20:", result_k20[1]))
print(paste("Variance for k = 20:", result_k20[2]))

# 估计 k = 30 时的均值和方差
set.seed(123)  # 设置随机种子以确保结果可复现
samples_k30 <- generate_X_samples(1000, 30)  # 生成1000个样本，每个样本经过30步后的位置
result_k30 <- calculate_mean_and_variance(samples_k30)
print(paste("Mean for k = 30:", result_k30[1]))
print(paste("Variance for k = 30:", result_k30[2]))


#1-d
#i
generate_X_samples_with_returns <- function(n, k, cost_per_play, reward_threshold, win_amount) {
  # Initialize vectors to store results(初始化向量来存储结果)
  positions <- numeric(n)
  returns <- numeric(n)
  
  # Generate n samples of X after k steps(k步后生成X的n个样本)
  for (i in 1:n) {
    position <- generate_X(k)
    positions[i] <- position
    
    # Calculate return based on the position(根据仓位计算收益)
    if (position >= reward_threshold) {
      returns[i] <- win_amount
    } else {
      returns[i] <- 0
    }
  }
  
  # Deduct the cost of playing the game(扣除玩游戏的费用)
  returns <- returns - cost_per_play
  
  # Return a list containing positions and returns(返回包含仓位和收益的列表)
  return(list(positions = positions, returns = returns))
}

#ii
# 估计游戏利润或亏损，k = 20
set.seed(123)  # 设置随机种子以确保结果可复现
game_results_k20 <- generate_X_samples_with_returns(1000, 20, 10, 8, 100)

# 计算游戏的总利润或亏损
total_profit_loss_k20 <- sum(game_results_k20$returns)
print(paste("Total profit/loss for k = 20:", total_profit_loss_k20))

# 估计游戏利润或亏损，k = 30
set.seed(123)  # 设置随机种子以确保结果可复现
game_results_k30 <- generate_X_samples_with_returns(1000, 30, 10, 8, 100)

# 计算游戏的总利润或亏损
total_profit_loss_k30 <- sum(game_results_k30$returns)
print(paste("Total profit/loss for k = 30:", total_profit_loss_k30))





#2-a
proportion_within_interval <- function(data, k) {
  # Calculate mean and standard deviation of the data
  # 计算数据的平均值和标准差
  x_bar <- mean(data)
  s <- sd(data)
  
  # Define the interval
  # 定义间隔
  lower_limit <- x_bar - k * s
  upper_limit <- x_bar + k * s
  
  # Count the number of data points within the interval
  # 统计区间内数据点的个数
  within_interval <- sum(data >= lower_limit & data <= upper_limit)
  
  # Calculate the proportion within the interval
  # 计算区间内的比例
  proportion <- within_interval / length(data)
  
  return(proportion)
}
# Generate a sample data set
# 生成一个示例数据集
set.seed(123)
sample_data <- rnorm(100, mean = 10, sd = 2)

# Use a function to calculate the proportion of data in the range x̅ ± ks, where k =2
# 使用函数计算在 x̅ ± ks 范围内的数据比例，这里 k = 2
proportion_within_2sd <- proportion_within_interval(sample_data, 2)
print(paste("Proportion within 2 standard deviations:", proportion_within_2sd))


#2-b
# Generate 100 samples from a standard normal distribution of length 10,000
# 生成100个长度为10,000的标准正态分布的样本
set.seed(123)
random_samples <- matrix(rnorm(100 * 10000), nrow = 100)

# Define a function to check the validity of Chebyshev's theorem
# 定义一个函数，用于检查Chebyshev定理的有效性
check_chebyshev <- function(samples, k) {
  proportions <- apply(samples, 1, proportion_within_interval, k = k)
  return(proportions)
}

# Check the validity of Chebyshev's theorem under different values of k
# 检查Chebyshev定理在不同k值下的有效性
k_values <- c(2, 3, 4)  # 选择不同的k值(Choose different k values)
results <- lapply(k_values, function(k) check_chebyshev(random_samples, k))

# 输出结果
for (i in seq_along(k_values)) {
  cat("Proportion within", k_values[i], "standard deviations:", mean(results[[i]]), "\n")
}


#2-c
# Generate 100 uniformly distributed samples of length 10,000
# 生成100个长度为10,000的均匀分布的样本
set.seed(123)
uniform_samples <- matrix(runif(100 * 10000), nrow = 100)

# Check the validity of Chebyshev's theorem for different values of k (using uniform distribution)
# 检查Chebyshev定理在不同k值下的有效性（使用均匀分布）
results_uniform <- lapply(k_values, function(k) check_chebyshev(uniform_samples, k))

# 输出结果(Output results)
for (i in seq_along(k_values)) {
  cat("Proportion within", k_values[i], "standard deviations (Uniform distribution):", mean(results_uniform[[i]]), "\n")
}
