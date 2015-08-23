library(shiny)
library(tm)
library(memoise)
library(wordcloud)
library(RColorBrewer)

shinyServer(function(input, output, session) {
    output$contents <- renderText({ 
        inFile <- input$file1
        
        if (is.null(inFile))
            return(NULL)
        
        inText <- scan(inFile$datapath, what="", quiet=T)
    })


    output$plot <- renderPlot({
        inFile2 <- input$file1
        inText2 <- scan(inFile2$datapath, what="", quiet=T)
        myCorpus <- Corpus(VectorSource(inText2))
        myCorpus <- tm_map(myCorpus, content_transformer(tolower))
        myCorpus <- tm_map(myCorpus, removePunctuation)
        myCorpus <- tm_map(myCorpus, removeNumbers)
        # SMART - English stopwords from the SMART info system - ?stopwords for more info.
        myCorpus <- tm_map(myCorpus, removeWords, c(stopwords("SMART"),"gpa"))
        # Describes the frequency of terms that occur in a collection of documents
        myTdm <- TermDocumentMatrix(myCorpus, control = list(minWordLength = 1))
        
        m <- as.matrix(myTdm)
        v <- sort(rowSums(m), decreasing = TRUE)
        d <- data.frame(word = names(v),freq=v)
        
     wordcloud(d$word, d$freq, scale=c(4,0.2),
        min.freq = input$freq, max.words=input$max,
       random.order=FALSE, rot.per=.15, colors= brewer.pal(as.numeric(input$num), input$color))
    })

})







