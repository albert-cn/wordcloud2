setwd("C:/Users/ASUS/Desktop/wordcloud")

library("Rwordseg")
library("jiebaR")
library("stylo")
library("wordcloud2")


#读取文件
text <- scan("1.txt", what = "char", sep = "\n")

insertWords(c("人力资源管理", "三环公寓")) #添加用户词典


text.seged <- segmentCN(text, analyzer = c("jiebaR"), returnType = "tm")

text.seged

cat(text.seged, file = "C:/Users/ASUS/Desktop/wordcloud/1seg.txt")



mycorpus <- load.corpus(corpus.dir = "C:/Users/ASUS/Desktop/wordcloud/corpus", 
                        encoding="ASCII")

chinese <- txt.to.words(mycorpus)

chinese

wordfreq <- make.frequency.list(chinese, value=T, relative = F)

df <- data.frame(wordfreq)

df <- df[-c(1,2,3,7,9),] #同时删除多行数据框

plot(df$Freq)

barplot(df$Freq[1:20], names.arg = df$data[1:20])

wordcloud2(df)
