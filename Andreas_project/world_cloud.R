if (!require("wordcloud")) install.packages("wordcloud"); library(wordcloud)
setwd("C:/Users/Dre/Dropbox/Barna/Master/TextMining/AndyLimberMinesTekst/Andreas_project")

word_data <- read.table("data_export.csv", sep = ",")
colnames(word_data) <- c("Word", "Topic_1", "Topic_2", "Topic_3", "Sentiment")

word_data$Topic_1 <- word_data$Topic_1 / min(word_data$Topic_1)
word_data$Topic_2 <- word_data$Topic_2 / min(word_data$Topic_2)
word_data$Topic_3 <- word_data$Topic_3 / min(word_data$Topic_3)

cloud_frame_1 <- word_data[word_data$Topic_1 > 10000,]

cloud_frame_1$colours <- "black"
cloud_frame_1$colours[cloud_frame_1$Word == "reliabl"] <- "green"
cloud_frame_1$colours[cloud_frame_1$Word == "comfort"] <- "green" 
cloud_frame_1$colours[cloud_frame_1$Word == "excel"] <- "green" 
cloud_frame_1$colours[cloud_frame_1$Word == "easi"] <- "green" 
cloud_frame_1$colours[cloud_frame_1$Word == "cheap"] <- "green" 



wordcloud(cloud_frame_1$Word, cloud_frame_1$Topic_1, colors = cloud_frame_1$colours,
          scale = c(3,0.2), ordered.colors = T)



cloud_frame_2 <- word_data[word_data$Topic_2 > 7000,]

cloud_frame_2$colours <- "black"
cloud_frame_2$colours[cloud_frame_2$Word == "cost"] <- "red"
cloud_frame_2$colours[cloud_frame_2$Word == "expens"] <- "red" 
cloud_frame_2$colours[cloud_frame_2$Word == "fault"] <- "red" 
cloud_frame_2$colours[cloud_frame_2$Word == "issu"] <- "red" 
cloud_frame_2$colours[cloud_frame_2$Word == "old"] <- "red" 
cloud_frame_2$colours[cloud_frame_2$Word == "problem"] <- "red"
cloud_frame_2$colours[cloud_frame_2$Word == "replac"] <- "red" 
cloud_frame_2$colours[cloud_frame_2$Word == "reliabl"] <- "green" 



wordcloud(cloud_frame_2$Word, cloud_frame_2$Topic_2, colors = cloud_frame_2$colours,
          scale = c(3,0.2), ordered.colors = T)

cloud_frame_3 <- word_data[word_data$Topic_3 > 7000,]

cloud_frame_3$colours <- "black"
cloud_frame_3$colours[cloud_frame_3$Word == "best"] <- "green"
cloud_frame_3$colours[cloud_frame_3$Word == "better"] <- "green"
cloud_frame_3$colours[cloud_frame_3$Word == "comfort"] <- "green"
cloud_frame_3$colours[cloud_frame_3$Word == "econom"] <- "green"
cloud_frame_3$colours[cloud_frame_3$Word == "excel"] <- "green"
cloud_frame_3$colours[cloud_frame_3$Word == "qualiti"] <- "green"
cloud_frame_3$colours[cloud_frame_3$Word == "recommend"] <- "green"
cloud_frame_3$colours[cloud_frame_3$Word == "reliabl"] <- "green"

wordcloud(cloud_frame_3$Word, cloud_frame_3$Topic_3, colors = cloud_frame_3$colours,
          scale = c(3,0.2), ordered.colors = T)
