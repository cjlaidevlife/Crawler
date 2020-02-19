# R語言爬蟲小工具
## 前言
> 身為資料工作者，時常遇到手邊沒有資料的窘況。如果需要解決這個問題，那我們就需要有自己產生資料的能力，最為普遍的就是所謂的爬蟲(Crawler)。這個專案是我用來複習R語言資料處理，順便學習資料爬蟲所建立。本次將爬取**永慶房屋實價登錄3.0**的內湖區搜尋結果。

## 使用套件
本次一共使用2個Ｒ語言的套件：

1) **rvest**:提供便利的爬蟲功能。

2) **dplyr**:協助Forward Pipe。

## 專案結構樹

```
YOUNGCHING
├── * README.MD
├── * FunLibary.R
│            ├── 。url_fun 
│            └── 。Etl_nr 
├── * NeedPackage.R
│            ├── 。rvest
│            └── 。dplyr
├── * UrlXpath.R
├── * Crawler_YoungChing_Neihu.r
└── * Crawler_Data
             ├── 。(2020-02-16)Crawler_YoungChing_Neihu(Example)
             └── ...
```
## 專案結構說明

1) **README. MD**    
用來說明本專案的目的與動機，並協助觀看者快速理解本專案。
2) **FunLibary.R**    
檔名是指函數(Function)庫(Libary)的意思，用來放置自訂函數。目前僅有*url_fun*(建立結構化網址)跟*Etl_nr*(回車鍵、空白鍵剔除)兩個自訂函數。
3) **NeedPackage.R**  
負責導入本次所需要用到的套件。會偵測R的環境是否有安裝所需要的套件，如果沒有則會幫你安裝下載(也會更新至最新版本)。

4) **UrlXpath.R**    
將目標欄位所需要的Xpath都存在這裡，協助主程式需要撈取時解析網頁結構。

5) **Crawler_YoungChing_Neihu.r**
本專案的主要腳本，會呼叫2,3,4腳本內的程式碼來完成爬取資料的任務。

6) **Crawler_Data**
用來存放程式所爬取到的資料，預設格式為(yyyy-mm-dd)Crawler_YoungChing_Neihu.csv，如果需要更改格式，可以在Crawler_YoungChing_Neihu.r腳本內修改。

## 專案成果

>這支程式僅是做出簡單的爬蟲功能(且只能針對這個網站做撈取)，使用的技術都很淺層、基礎，目的是訓練自己能夠用R寫出一支小工具，並且將整個功能藉由文字的方式記錄下來。如果有機會，希望能再更近一步加入撈取POST網頁機制的進一步功能。最後提醒，有的網頁還是要注意不要亂撈，以免觸法。

![](https://imgur.com/QRWSove.gif)

<div style="text-align: right">2020.02.17 錄製</div>
