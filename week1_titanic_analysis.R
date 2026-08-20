# ============================================
# WEEK 1 - TITANIC DATA CLEANING & ANALYSIS
# ============================================

# 1. Load dataset
titanic <- read.csv("Titanic.csv")

# 2. Inspect dataset
str(titanic)
summary(titanic)
dim(titanic)
names(titanic)

# 3. Check missing values
colSums(is.na(titanic))

# 4. Check duplicate rows
sum(duplicated(titanic))

# 5. Create cleaned dataset
titanic_clean <- titanic

# 6. Handle missing Age values using median
titanic_clean$Age[is.na(titanic_clean$Age)] <-
  median(titanic_clean$Age, na.rm = TRUE)

# 7. Handle missing Embarked values using mode
mode_embarked <- names(
  sort(table(titanic_clean$Embarked), decreasing = TRUE)
)[1]

titanic_clean$Embarked[
  is.na(titanic_clean$Embarked)
] <- mode_embarked

# 8. Handle missing Fare using median
titanic_clean$Fare[is.na(titanic_clean$Fare)] <-
  median(titanic_clean$Fare, na.rm = TRUE)

# 9. Check missing values after cleaning
colSums(is.na(titanic_clean))

# 10. Outlier detection using IQR
Q1_age <- quantile(titanic_clean$Age, 0.25, na.rm = TRUE)
Q3_age <- quantile(titanic_clean$Age, 0.75, na.rm = TRUE)
IQR_age <- IQR(titanic_clean$Age, na.rm = TRUE)

lower_age <- Q1_age - 1.5 * IQR_age
upper_age <- Q3_age + 1.5 * IQR_age

age_outliers <- which(
  titanic_clean$Age < lower_age |
    titanic_clean$Age > upper_age
)

Q1_fare <- quantile(titanic_clean$Fare, 0.25, na.rm = TRUE)
Q3_fare <- quantile(titanic_clean$Fare, 0.75, na.rm = TRUE)
IQR_fare <- IQR(titanic_clean$Fare, na.rm = TRUE)

lower_fare <- Q1_fare - 1.5 * IQR_fare
upper_fare <- Q3_fare + 1.5 * IQR_fare

fare_outliers <- which(
  titanic_clean$Fare < lower_fare |
    titanic_clean$Fare > upper_fare
)

length(age_outliers)
length(fare_outliers)

# 11. Min-max normalization
normalize <- function(x) {
  (x - min(x, na.rm = TRUE)) /
    (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

titanic_clean$Age_Normalized <-
  normalize(titanic_clean$Age)

titanic_clean$Fare_Normalized <-
  normalize(titanic_clean$Fare)

summary(
  titanic_clean[, c(
    "Age_Normalized",
    "Fare_Normalized"
  )]
)

# 12. Convert categorical variables to factors
titanic_clean$Sex <- as.factor(titanic_clean$Sex)
titanic_clean$Embarked <- as.factor(titanic_clean$Embarked)
titanic_clean$Name <- as.factor(titanic_clean$Name)
titanic_clean$Ticket <- as.factor(titanic_clean$Ticket)

# 13. One-hot encoding
encoded_data <- model.matrix(
  ~ Sex + Embarked - 1,
  data = titanic_clean
)

head(encoded_data)

# 14. Survival analysis
table(titanic_clean$Survived)

prop.table(
  table(titanic_clean$Survived)
) * 100

table(
  titanic_clean$Sex,
  titanic_clean$Survived
)

prop.table(
  table(
    titanic_clean$Sex,
    titanic_clean$Survived
  ),
  1
) * 100

table(
  titanic_clean$Pclass,
  titanic_clean$Survived
)

prop.table(
  table(
    titanic_clean$Pclass,
    titanic_clean$Survived
  ),
  1
) * 100

# 15. Descriptive statistics
aggregate(
  Age ~ Survived,
  data = titanic_clean,
  mean
)

aggregate(
  Fare ~ Survived,
  data = titanic_clean,
  mean
)

# 16. Correlation analysis
numeric_data <- titanic_clean[, c(
  "Survived",
  "Pclass",
  "Age",
  "SibSp",
  "Parch",
  "Fare"
)]

cor(
  numeric_data,
  use = "complete.obs"
)

# 17. Visualization 1 - Survival by Gender
barplot(
  table(
    titanic_clean$Sex,
    titanic_clean$Survived
  ),
  beside = TRUE,
  legend.text = TRUE,
  main = "Survival by Gender",
  xlab = "Gender",
  ylab = "Number of Passengers"
)

# 18. Visualization 2 - Age Distribution
hist(
  titanic_clean$Age,
  breaks = 20,
  main = "Age Distribution of Titanic Passengers",
  xlab = "Age",
  ylab = "Number of Passengers"
)

# 19. Visualization 3 - Fare Distribution
hist(
  titanic_clean$Fare,
  breaks = 30,
  main = "Fare Distribution of Titanic Passengers",
  xlab = "Fare",
  ylab = "Number of Passengers"
)

# 20. Visualization 4 - Age vs Fare
plot(
  titanic_clean$Age,
  titanic_clean$Fare,
  main = "Age vs Fare",
  xlab = "Age",
  ylab = "Fare",
  pch = 19
)

# 21. Visualization 5 - Survival by Passenger Class
barplot(
  table(
    titanic_clean$Pclass,
    titanic_clean$Survived
  ),
  beside = TRUE,
  legend.text = TRUE,
  main = "Survival by Passenger Class",
  xlab = "Passenger Class",
  ylab = "Number of Passengers"
)