# some examples about dplyr

# about filter
library(dplyr)
Name = c("zhang3", "li4", "wang5", "zhao6")
sID = c(1, 2, 3, 4)
Stat = c(60, 70, 90, 90)
Form = data.frame(Name, sID, Stat)
filter(Form, Stat == 90)

# about arrange
library(dplyr)
Name = c("zhang3", "li4", "wang5", "zhao6")
sID = c(1, 2, 3, 4)
Stat = c(100, 70, 90, 90)
Form = data.frame(Name, sID, Stat)
arrange(Form, Stat)
arrange(Form, desc(Stat))

# about select
library(dplyr)
Name = c("zhang3", "li4", "wang5", "zhao6")
sID = c(1, 2, 3, 4)
Stat = c(100, 70, 90, 90)
Form = data.frame(Name, sID, Stat)
select(Form, Name:sID)
select(Form, Stat:sID)
select(Form, -Stat)

# about mutate
library(dplyr)
Name = c("zhang3", "li4", "wang5", "zhao6")
sID = c(1, 2, 3, 4)
Stat = c(100, 70, 90, 90)
Algebra = c(60, 80, 90, 70)
Form = data.frame(Name, sID, Stat, Algebra)
mutate(Form, Total = 0.4*Stat + 0.6*Algebra)
Form

# about summarise
library(dplyr)
Name = c("zhang3", "li4", "wang5", "zhao6")
sID = c(1, 2, 3, 4)
Stat = c(100, 70, 90, 90)
Algebra = c(60, 80, 90, 70)
Form = data.frame(Name, sID, Stat, Algebra)
summarise(Form, sum(Stat))
summarize(group_by(Form, Name), sum(0.4*Stat, 0.6*Algebra))  # group_by is a good stuff

# about rename
library(dplyr)
Name = c("zhang3", "li4", "wang5", "zhao6")
sID = c(1, 2, 3, 4)
Stat = c(100, 70, 90, 90)
Algebra = c(60, 80, 90, 70)
Form = data.frame(Name, sID, Stat, Algebra)
rename(Form, studentID = sID)

# about pipe
library(dplyr)
Name = c("zhang3", "li4", "wang5", "zhao6")
sID = c(1, 2, 3, 4)
Stat = c(100, 70, 90, 90)
Algebra = c(60, 80, 90, 70)
Form = data.frame(Name, sID, Stat, Algebra)
newForm = c(Stat + Algebra) %>% mutate(Form, .)
newForm