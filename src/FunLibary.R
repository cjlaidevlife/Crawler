# Function for paste url
url_fun <- 
  function(i){
    x = paste0("https://evertrust.yungching.com.tw/regionyc/%e5%8f%b0%e5%8c%97%e5%b8%82/%e5%85%a7%e6%b9%96%e5%8d%80?",i,"l=2&s=1#mainContent")
    return(x)
}

# Function for delete \n&\r
Etl_nr <- 
  function(a,b){
    a[,b] <-gsub("\r?\n|\r","",a[,b])
    a[,b] <-gsub(" ","",a[,b],fixed = TRUE)
    return(a[,b])
  }