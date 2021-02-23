# 1. 변수 ----

# 1-1. 변수 만들기

a <- 2
aa <- 10
bb <- a+aa

# 1-2. 여러개의 값 할당
ccc <- c(10, 20, 30, 40, 50)
ccc
class(ccc)
mode(ccc)
length(ccc)
str(ccc)

ccc2 <- c(100:120)
length(ccc2)

ccc3 <- seq(100, 120, by=2)
ccc3

ccc4 <- seq(100, 50, by=-5)
ccc4
?seq()

ccc3 + ccc4
length(ccc)
ccc + ccc3 #되긴 되는데, 자리수가 배수가 아니라 순환해서 더해줌.

# seq(start_num, [end_num], by=-3)
seq(100, by=-3)


# 1-3. 문자변수

h2 <- "aaa"
str(h2)
length(h2)

h3 <- "hello R ~"
length(h3)

h4 <- c("hello", "R", "~")
h4
length(h4)

#문자 + 문자 : 불가능
h2 + h3
paste(h2, h3)
#문자 + 숫자 : 불가능 (컨켓이 안되는 경우들)
h4 + 5
paste(h4, 5)


#2. 함수 ----
h4 
length(h4)

paste(h4, collapse = "+")
h5 <- paste(h4, collapse = " ")

#qplot()
??qplot() #물음표 ? 1개만 쓸 때 메모리에 안올라와있으면 안떠짐.
library(ggplot2)
search()
?qplot()
dim(mpg)
head(mpg)
names(mpg)
mpg$f1
?mpg


qplot(data=mpg, x=hwy) #고속도로연비 > 도표로.
qplot(data=mpg, x=cty) #도심연비 > 도표
qplot(data=mpg, x=mpg$hwy)

#파라메터 활용
qplot(data=mpg, y=hwy, x=drv, geom="point")
qplot(data=mpg, y=hwy, x=drv, geom="boxplot")
qplot(data=mpg, y=hwy, x=drv, geom="boxplot", colour=drv)

# 3. data.frame ----
# 3-1. data.frame만들기
java <- c(99, 83, 67, 51, 72)
eng <- c(55, 100, 92, 47, 89)
java
eng

df_score <- data.frame(java, eng)
dim(df_score)
df_score

# 3-2. 컬럼추가
class <- c("swdo", "scit", "scit", "swdo", "scit")
df_score <- data.frame(java, eng, class)
dim(df_score)
df_score

# 3-3. 컬럼삭제
df_score$class <- NULL
dim(df_score)
names(df_score)

ls()
rm(a)

#평균값
df_score
mean(df_score$java)
mean(df_score$eng)
summary(df_score)

#3-3. 파일로 저장하기 > writexl::write_xlsx()
??writexl
install.packages("writexl")
library(writexl)
search()
detach("package:writexl")
getwd() #디렉토리 알아야지!!
writexl::write_xlsx(df_score, path="df_score2.xlsx")


#3-4. 외부 데이터 읽기
??readxl
install.packages("readxl")
library(readxl)
search()

?read_excel()
df_score3 <- read_excel("df_score2.xlsx", sheet=1, col_names=T)
df_score3

#평균값
java_m <- mean(df_score3$java)
eng_m <- mean(df_score3$eng)
japan_m <-mean(df_score3$japan)
summary(df_score3)

df_score_mean <- data.frame(java_m, eng_m, japan_m)
df_score_mean
df_sc_mean <- df_score_mean
df_sc_mean

#3-5. csv(comma separated value)
# csv 읽기
?read.csv
df_score_mean <- read.csv("df_sc_mean.csv", header=T)
df_score_mean

# csv 내려받기
?write.csv()
write.csv(df_score_csv, file="df_sc_mean.csv")

# 3-6. 데이터 속성조회
# cdhlmnrstV
class(df_sc_mean2)
dim(df_sc_mean2)
head(mpg, 10)
length(mpg)
#levels(mpg) - 범주형 데이터 쓸 때 사용.
mode(mpg)
names(df_sc_mean2)
rownames(df_sc_mean2)
str(mpg)
summary(mpg)
tail(mpg)
View(df_sc_mean2)

?rownames
#3-7. 컬럼명 변경
names(df_sc_mean2)
?rename()
library(dplyr)
search()
#rename(obj, new_col = old_col)
df_mean2 <- rename(df_score_mean, java_mean = java_m)
rename(df_score_mean, r_id = X)
names(df_mean2)

#3-8. 컬럼삭제
df_sc_mean2


#카피
m_mpg <- as.data.frame(ggplot2::mpg)


#ggplot::mpg를 복사해 m_mpg를 생성하고, 아래와 같이 m_mpg의 컬럼명을 변경해보세요.
#cty -> city, hwy -> highway
library(dplyr)
dim(ggplot2::mpg)
m_mpg <- as.data.frame(ggplot2::mpg)
dim(m_mpg)
names(m_mpg)
m_mpg <- rename(m_mpg, city=cty, highway=hwy)
names(m_mpg)








