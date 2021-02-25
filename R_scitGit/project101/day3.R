
#5. 패키지(dpylr)----

#5-1. filter()
#5-1-0. 패키지, dataset
search()
getwd()
dir

m_exam <- read.csv("ss_exam.csv")
names(m_exam)
head(m_exam)

#5-1-1. class가 6인 경우
m_exam %>%
  filter(class == 6)

#5-1-2. class가 2가 아닌 경우
m_exam %>%
  filter(class != 2)

#5-1-3. java가 80점 이상이면서 class가 3인 경우
m_exam %>%
  filter(java >= 80 & class == 3)

#5-1-5. eng 또는 java가 80이상이면서 class가 5인 경우
m_exam %>%
  filter((eng >= 80 | java >= 80) & class == 5) #정답!!!!!!!!!!!
m_exam %>%
  filter(eng >= 80 | java >= 80 & class == 5) #틀린것!!

#5-1-6. class가 1, 3, 5인 경우
m_exam %>%
  filter(class %in% c(1,3,5))

#5-1-7. 한 개 과목이 80이상인 인원 중에서 각 class별 java평균


temp <- m_exam %>%
  filter(database >= 80 | java >= 80 | japan >= 80 | eng >= 80)
mean((temp %>% filter(class==1))$java)
mean((temp %>% filter(class==2))$java)
mean((temp %>% filter(class==3))$java)
mean((temp %>% filter(class==4))$java)
mean((temp %>% filter(class==5))$java)
mean((temp %>% filter(class==6))$java)

#5-2. select()----
names(m_exam)
search()
library(dplyr)

# 5-2-1. id와 database select()
m_exam %>%
  select(id, database)

# 5-2-2. eng만 빼고 select()
m_exam %>%
  select(-eng)

# 5-2-3. eng와 java빼고 select()
m_exam %>%
  select(-eng, -java) %>%
  head(10)

# 5-2-4. class가 2인 학생들의 java와 database 확인
m_exam %>%
  filter(class==2) %>%
  select(java, database)

m_exam %>%
  select(java, database) %>%
  filter(class==2)

# 5-2-5. id와 japan성적의 일부만 출력
m_exam %>%
  select(id, japan) %>%
  head(15)

# 5-3. arrange()

# 5-3-1. class와 eng로 정렬(오름차순)
m_exam %>%
  arrange(class, eng) %>%
  head(10)

m_exam %>%
  arrange(class, eng)

# 5-3-2. class(오름차순) eng(내림차순)으로 정렬
m_exam %>%
  arrange(class, desc(eng)) %>%
  head(10)

#q-1.
q_mpg <- mpg
names(q_mpg)

mean((q_mpg%>%
  filter(displ %in% c(5,6)))$hwy) #김동수 방식 (틀림!!!!)
mean((q_mpg%>%
        filter(between(displ,5,6)))$hwy) #김동수 방식 (맞음!!!)

mean((q_mpg %>%
  filter(between(displ, 5, 6)) %>%
  select(displ, hwy))$hwy) # 선생님 방식 

#q-2.

mean((q_mpg %>% filter(manufacturer=="hyundai"))$cty)
mean((q_mpg %>% filter(manufacturer=="lincoln"))$cty)

#q-3.
View(q_mpg)
mean((q_mpg %>% filter(manufacturer%in%c("jeep", "land rover", "dodge")))$hwy) #내방식

unique(mpg$manufacturer)
mpg %>% filter(manufacturer %in% c("jeep", "land rover", "dodge"))

mean((mpg %>% filter(manufacturer %in% c("jeep", "land rover", "dodge")))$hwy) #선생과 내방식


mpg %>% 
  filter(manufacturer %in% c("jeep", "land rover", "dodge")) %>%
  summarise(mean(hwy)) #선생방식1 (전체 평균)

mpg %>% 
  filter(manufacturer %in% c("jeep", "land rover", "dodge")) %>%
  group_by(manufacturer) %>%
  summarise(mean(hwy)) #선생방식2 (서브그룹 평균)


# 5-4. mutate() ----
class(m_exam)
names(m_exam)
head(m_exam)

# sum, avg, test(P, F, 70점)
m_exam %>%
  mutate(sum = database + java + japan + eng
         , avg = sum/4
         , test = ifelse(avg >= 70, "P", "재시험")) %>%
  arrange(desc(avg)) %>%
  head(15)

# 5-5~6. group_by(), summarise() ----
# 주요 G함수()
# mean(): 평균
# min(): 최소값
# max(): 최대값값
# sum(): 합계
# sd(): 표준편차
# n(): count 어차피 dim쓰면 알잖아.

# 5-5/6-1. 주요 그룹함수
m_exam %>%
  summarise(mean_java = mean(java))

m_exam %>%
  summarise(mean_java = mean(java)
            , min_java = min(java)
            , max_java = max(java)
            , median_java = median(java)
            , sum_java = sum(java)
            , sd_java = sd(java)
            , count_java = n())

# 5-5/6-2. 중첩 그룹함수
names(mpg)
 #순서를 알고 있다면 컬럼 순서만 써서 불러와도 괜찮아 거의 안쓰겠지만.
mpg[c(1,7)] %>%
  head(20) 

mpg %>%
  group_by(manufacturer, drv) %>%
  summarize(mean_hwy = mean(hwy)
            ,mean_cty = mean(cty)
            ,n = n()) %>%
  arrange(drv, desc(mean_cty)) %>%
  head(20)

#Quiz8
#8-1
mpg %>% 
  group_by(class) %>%
  summarize(mean_cty = mean(cty))

#8-2
??output
mpg %>% 
  group_by(class) %>%
  summarize(mean_cty = mean(cty)
            ,max_cty = max(cty)
            ,min_cty = min(cty)) %>%
  arrange(desc(mean_cty), desc(max_cty), desc(min_cty))

#8-3
mpg %>%
  group_by(manufacturer) %>%
  summarize(max_mean_hwy = max(mean(hwy))) %>%
  arrange(desc(max_mean_hwy)) %>%
  head(5)

#8-4
mpg %>%
  group_by(manufacturer) %>%
  summarize(count_veh = n()) %>%
  arrange(desc(count_veh)) %>%
  head(3)

#8-5
mpg %>%
  group_by(manufacturer) %>%
  summarize(avg_cty = mean(cty)) %>%
  arrange(desc(avg_cty)) %>%
  head(5)
