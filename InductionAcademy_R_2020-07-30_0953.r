#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
data=read.csv('InductionAcademy_DATA_2020-07-30_0953.csv')
#Setting Labels

label(data$record_id)="Record ID"
label(data$redcap_survey_identifier)="Survey Identifier"
label(data$pis_timestamp)="Survey Timestamp"
label(data$pis_complete)="Complete?"
label(data$consent_timestamp)="Survey Timestamp"
label(data$consent)=""
label(data$consent_complete)="Complete?"
label(data$cohort_timestamp)="Survey Timestamp"
label(data$cohort)="What is your cohort?"
label(data$cohort_complete)="Complete?"
label(data$pittsburgh_sleep_quality_index_psqi_timestamp)="Survey Timestamp"
label(data$psqi_1)="1. During the past month, what time have you usually gone to bed at night?"
label(data$psqi_2)="2. During the past month, how long (in minutes) has it usually taken you to fall asleep each night?"
label(data$psqi_3)="3. During the past month, what time have you usually gotten up in the morning?"
label(data$psqi_4)="4. During the past month, how many hours of actual sleep did you get at night? (This may be different than the number of hours you spent in bed.)"
label(data$psqi_5a)="5a) Cannot get to sleep within 30 minutes"
label(data$psqi_5b)="5b) Wake up in the middle of the night or early morning"
label(data$psqi_5c)="5c) Have to get up to use the bathroom"
label(data$psqi_5d)="5d) Cannot breathe comfortably"
label(data$psqi_5e)="5e) Cough or snore loudly"
label(data$psqi_5f)="5f) Feel too cold"
label(data$psqi_5g)="5g) Feel too hot"
label(data$psqi_5h)="5h) Had bad dreams"
label(data$psqi_5i)="5i) Have pain"
label(data$psqi_5other)="5j) Other reason(s), please describe"
label(data$psqi_5othera)="How often during the past month have you had trouble sleeping because of this?"
label(data$psqi_6)="6. During the past month, how would you rate your sleep quality overall?"
label(data$psqi_7)="7. During the past month, how often have you taken medicine to help you sleep (prescribed or over the counter)?"
label(data$psqi_8)="8. During the past month, how often have you had trouble staying awake while driving, eating meals, or engaging in social activity?"
label(data$psqi_9)="9. During the past month, how much of a problem has it been for you to keep up enough enthusiasm to get things done?"
label(data$psqi_10)="10. Do you have a bed partner or room mate?"
label(data$psqi_10a)="10a) Loud snoring"
label(data$psqi_10b)="10b) Long pauses between breaths while asleep"
label(data$psqi_10c)="10c) Legs twitching or jerking while you sleep"
label(data$psqi_10d)="10d) Episodes of disorientation or confusion during sleep"
label(data$psqi_10e)="10e) Other restlessness while you sleep; please describe"
label(data$psqi_10e1)=""
label(data$pittsburgh_sleep_quality_index_psqi_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$pis_complete.factor = factor(data$pis_complete,levels=c("0","1","2"))
data$consent.factor = factor(data$consent,levels=c("1"))
data$consent_complete.factor = factor(data$consent_complete,levels=c("0","1","2"))
data$cohort.factor = factor(data$cohort,levels=c("0","1","2","3","4","5"))
data$cohort_complete.factor = factor(data$cohort_complete,levels=c("0","1","2"))
data$psqi_5a.factor = factor(data$psqi_5a,levels=c("0","1","2","3"))
data$psqi_5b.factor = factor(data$psqi_5b,levels=c("0","1","2","3"))
data$psqi_5c.factor = factor(data$psqi_5c,levels=c("0","1","2","3"))
data$psqi_5d.factor = factor(data$psqi_5d,levels=c("0","1","2","3"))
data$psqi_5e.factor = factor(data$psqi_5e,levels=c("0","1","2","3"))
data$psqi_5f.factor = factor(data$psqi_5f,levels=c("0","1","2","3"))
data$psqi_5g.factor = factor(data$psqi_5g,levels=c("0","1","2","3"))
data$psqi_5h.factor = factor(data$psqi_5h,levels=c("0","1","2","3"))
data$psqi_5i.factor = factor(data$psqi_5i,levels=c("0","1","2","3"))
data$psqi_5othera.factor = factor(data$psqi_5othera,levels=c("0","1","2","3"))
data$psqi_6.factor = factor(data$psqi_6,levels=c("0","1","2","3"))
data$psqi_7.factor = factor(data$psqi_7,levels=c("0","1","2","3"))
data$psqi_8.factor = factor(data$psqi_8,levels=c("0","1","2","3"))
data$psqi_9.factor = factor(data$psqi_9,levels=c("0","1","2","3"))
data$psqi_10.factor = factor(data$psqi_10,levels=c("0","1","2","3"))
data$psqi_10a.factor = factor(data$psqi_10a,levels=c("0","1","2","3"))
data$psqi_10b.factor = factor(data$psqi_10b,levels=c("0","1","2","3"))
data$psqi_10c.factor = factor(data$psqi_10c,levels=c("0","1","2","3"))
data$psqi_10d.factor = factor(data$psqi_10d,levels=c("0","1","2","3"))
data$psqi_10e1.factor = factor(data$psqi_10e1,levels=c("0","1","2","3"))
data$pittsburgh_sleep_quality_index_psqi_complete.factor = factor(data$pittsburgh_sleep_quality_index_psqi_complete,levels=c("0","1","2"))

levels(data$pis_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$consent.factor)=c("I have read the above and I consent")
levels(data$consent_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$cohort.factor)=c("OHWB","Palliative Care","Public Health","Mental Health","HEP","Ageing and Dementia")
levels(data$cohort_complete.factor)=c("Incomplete","Unverified","Complete")
levels(data$psqi_5a.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_5b.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_5c.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_5d.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_5e.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_5f.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_5g.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_5h.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_5i.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_5othera.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_6.factor)=c("Very good","Fairly good","Fairly bad","Very bad")
levels(data$psqi_7.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_8.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_9.factor)=c("No problem at all","Only a very slight problem","Somewhat of a problem","A very big problem")
levels(data$psqi_10.factor)=c("No bed partner or room mate","Partner/room mate in other room","Partner in same room, but not same bed","Partner in same bed")
levels(data$psqi_10a.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_10b.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_10c.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_10d.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$psqi_10e1.factor)=c("Not during the past month","Less than once a week","Once or twice a week","Three or more times a week")
levels(data$pittsburgh_sleep_quality_index_psqi_complete.factor)=c("Incomplete","Unverified","Complete")
