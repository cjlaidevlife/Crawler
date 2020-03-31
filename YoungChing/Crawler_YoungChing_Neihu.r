cat("\n")
cat("步驟一：爬蟲工具","\n")
cat("⏳️初始化...","\n\n")
cat("========================================================","\n")
first_time <- Sys.time()
source(paste0(getwd(),"/NeedPackage.R"))
source(paste0(getwd(),"/UrlXpath.R"))
source(paste0(getwd(),"/FunLibary.R"))

# Start DataFrame  
x <- data.frame()

cat("步驟二：開始爬取資料:","\n")
start_time <- Sys.time()
# create html path
for(i in 1:8){
  if(i == 1){
    paths <- url_fun("")
  }else{
    paths <- url_fun(i)
  }
  # Load data
  htmlcontent <- read_html(paths)
  Dates <- htmlcontent%>%
    html_nodes(xpath = path_Date)%>%
    html_text()
  Types <- htmlcontent%>%
    html_nodes(xpath = path_Type)%>%
    html_text()
  Locals <- htmlcontent%>%
    html_nodes(xpath = path_Local)%>%
    html_text()
  Closings <- htmlcontent%>%
    html_nodes(xpath = path_Closing)%>%
    html_text()
  BuildPings <- htmlcontent%>%
    html_nodes(xpath = path_BuildPing)%>%
    html_text()
  Prices <- htmlcontent%>%
    html_nodes(xpath = path_Price)%>%
    html_text()
  LocalPings <- htmlcontent%>%
    html_nodes(xpath = path_LocalPing)%>%
    html_text()
  Floors <- htmlcontent%>%
    html_nodes(xpath = path_Floor)%>%
    html_text()
  Olds <- htmlcontent%>%
    html_nodes(xpath = path_Old)%>%
    html_text()
  ParkingSpaces <- htmlcontent%>%
    html_nodes(xpath = path_ParkingSpace)%>%
    html_text()
  PathNum <- substr(paths,nchar(paths)-20,nchar(paths))
  cat("⏳️第",i,"頁讀取中...，已經過",start_time-Sys.time(),"秒\n")

  # Finish DataFrame
  x <- rbind(x,data.frame(Dates,Types,Locals,Closings,BuildPings,Prices,LocalPings,Floors,Olds,ParkingSpaces))
}

cat("\n")
cat("步驟三：資料清理","\n")
cat("⏳️請稍候...","\n")
# delete \n & \r & space
for(i in 1:ncol(x)){
  x[,i] <- Etl_nr(x,i)
}
cat("👍️清理完成!!","\n\n")

cat("⏳️開始匯出檔案...","\n\n")
# Output data to csv
Today <- Sys.Date()
Insurance_name <- paste0(getwd(),"/Crawler_Data/(",Today,")Crawler_YoungChing_Neihu.csv")
write.table(x,Insurance_name,quote=TRUE,sep = ",",na="NaN",fileEncoding="utf-8")# 是否覆蓋同檔名使用'append'
cat("🎉🎉🎉恭喜完成！總共花費",first_time-Sys.time(),"秒，請至目標資料夾查看檔案！","\n\n")