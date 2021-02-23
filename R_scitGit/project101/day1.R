# R맛보기 ----

# 1) 패키지 설치 및 메모리 등록----
install.packages("ggplot2")
install.packages("dplyr")

search()      #메모리에 올라온 객체 정보 확인인

library(dplyr)
library(ggplot2)
detach("package:dplyr")

# 2) 데이터 속성 조회 ----
?mpg
mpg
class(mpg)     #객체 타입
names(mpg)     #객체 컬럼명(변수명)
dim(mpg)       #차원정보
head(mpg, 10)  #dataset 앞에서 조회 (default = 6)
tail(mpg, 15)  #dataset 앞에서 조회 (default = 6)
str(mpg)       #컬럼 타입
summary(mpg)   #요약 통계량 조회
View(mpg)      #원자료(raw data) 확인

# 3) 회사별 평균 연비 정렬(내림차순)
?mpg
names(mpg)

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean.hwy = mean(hwy)) %>% 
  arrange(desc(mean.hwy))

# 4) 현대차종별 고속도로 연비 정렬(내림차순)----

names(mpg)
mpg[c(1, 2, 3)]
View(mpg[c("model","class")])

# '<-' 대입하는 연산자.
my_mpg <- mpg %>%
  filter(manufacturer == "hyundai") %>% 
  group_by(model) %>% 
  arrange(desc(hwy))
#summarise(mean.hwy = mean(hwy)) %>% 
#arrange(desc(mean.hwy))

# 5) 회귀분석 ----
#+ 배기량(displ)이 연비(hwy)에 미치는 영향
?lm
lm.mpg <- lm(data=mpg, hwy~displ)
summary(lm.mpg)

# 6) plot ----
#+ 배기량과 연비(hwy)의 관계
?qplot()
qplot(data=mpg, x=displ, y=hwy)