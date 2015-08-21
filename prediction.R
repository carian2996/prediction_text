# Ian Castillo Rosales
# Prediction
# 025/07/2015

predict_word <- function(phrase){

    split_phrase <- strsplit(x = phrase, split = " ", fixed = T)[[1]]
    split_phrase <- tolower(split_phrase)
    split_phrase <- gsub("[[:punct:]]", "", split_phrase)
    
    if(length(split_phrase) >= 3){
        base_words <- split_phrase[length(split_phrase) - 2:0]
        
        best_words <- sep_fourgrams %>% filter(word1 == base_words[1], 
                                               word2 == base_words[2],
                                               word3 == base_words[3]) %>%
            select(word4, proba) %>% arrange(desc(proba))
        fourgram_pred <- head(as.character(best_words$word4), 5)
        
        best_words <- sep_fourgrams %>% filter(word2 == base_words[2],
                                               word3 == base_words[3]) %>%
            select(word4, proba) %>% arrange(desc(proba))
        trigram_pred <- head(as.character(best_words$word4), 5)
        
        best_words <- sep_fourgrams %>% filter(word3 == base_words[3]) %>%
            select(word4, proba) %>% arrange(desc(proba))
        bigram_pred <- head(as.character(best_words$word4), 5)
        
        predictions <- unique(c(fourgram_pred, trigram_pred, bigram_pred))
        predictions <- predictions[!is.na(predictions)]
        
        if(length(predictions) == 0){
            predictions <- sep_fourgrams %>% select(word4, proba) %>% 
                arrange(desc(proba))
            predictions <- head(as.character(unique(predictions$word4)), 5)
        }
        
        predictions
        
    } else if(length(split_phrase) == 2){
        base_words <- split_phrase[length(split_phrase) - 1:0]
        
        best_words <- sep_fourgrams %>% filter(word2 == base_words[1],
                                               word3 == base_words[2]) %>%
            select(word4, proba) %>% arrange(desc(proba))
        trigram_pred <- head(as.character(best_words$word4), 5)
        
        best_words <- sep_fourgrams %>% filter(word3 == base_words[2]) %>%
            select(word4, proba) %>% arrange(desc(proba))
        bigram_pred <- head(as.character(best_words$word4), 5)
        
        predictions <- unique(c(trigram_pred, bigram_pred))
        predictions <- predictions[!is.na(predictions)]
        
        if(length(predictions) == 0){
            predictions <- sep_fourgrams %>% select(word4, proba) %>% 
                arrange(desc(proba))
            predictions <- head(as.character(unique(predictions$word4)), 5)
        }
        
        predictions
        
    } else if(length(split_phrase) == 1){
        base_words <- split_phrase
        
        best_words <- sep_fourgrams %>% filter(word3 == base_words[1]) %>%
            select(word4, proba) %>% arrange(desc(proba))
        bigram_pred <- head(as.character(best_words$word4), 5)
        
        predictions <- unique(bigram_pred)
        predictions <- predictions[!is.na(predictions)]
        
        if(length(predictions) == 0){
            predictions <- sep_fourgrams %>% select(word4, proba) %>% 
                arrange(desc(proba))
            predictions <- head(as.character(unique(predictions$word4)), 5)
        }
        
        predictions
    }
    
}
