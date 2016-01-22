library(RSelenium)
library(stringr)

OpenMindMupWeb <- function(){
    
    setwd("C:\\Users\\Jose Alberto\\Big Data\\scripts\\rmindmap")
    startServer()
    remDr <- remoteDriver()
    remDr$open()
    remDr$maxWindowSize()
    remDr$navigate(url = "https://www.mindmup.com/")
    
    boton.new.map <- remDr$findElement(using = "xpath", "//button[@data-slide-to = 1]")
    boton.new.map$clickElement()
    
    link.public.map <- remDr$findElement(using = "xpath", "//a[contains(text(), 'Public')]")
    link.public.map$clickElement()
    
    return(remDr)
    
}

CreateMindMupJSON <- function(remDr, mindmap.text){
    
    titulo <- mindmap.text %>% str_extract("^(.*)\n") %>% str_trim()
    remDr$sendKeysToActiveElement(sendKeys = "space")
    
}

