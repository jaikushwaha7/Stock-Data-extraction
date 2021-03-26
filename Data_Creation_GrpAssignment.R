
# Get quantmod
if (!require("quantmod")) {
  install.packages("quantmod")
  library(quantmod)
}

start <- as.Date("2019-01-01")
end <- as.Date("2021-03-17")

# Getting codes for BSE
codes<- read.csv('BSE_Equity_Symbols.csv', header=T)
head(codes)
str(codes)
summary(codes)
# total 4119 share codes are there
# We will extract the Indian Banks codes

codes_bank<-  codes %>% select("Security.Name", 'Security.Id', 'Industry')
summary(codes_bank)
codes_bank<- filter(codes_bank, Industry=='Banks')
head(codes_bank)
dim(codes_bank)  # 32 banks
ticker <- paste( codes_bank$Security.Id, 'BO', sep=".")
ticker

# Daily Data
getSymbols(ticker, src = "yahoo", from = start, to = end)  

# Weekly Data
getSymbols(ticker, src = "yahoo", from = start, to = end, periodicity = 'weekly')  

ticker



#candleChart(prices, up.col = "black", dn.col = "red", theme = "white")

# Let's get data for Microsoft (MSFT) and Google (GOOG) (actually, Google is
# held by a holding company called Alphabet, Inc., which is the company
# traded on the exchange and uses the ticker symbol GOOG).
#getSymbols(c("MSFT", "GOOG"), src = "yahoo", from = start, to = end)

# Create an xts object (xts is loaded with quantmod) that contains closing
ticker
# Daily Data
stocks <- as.xts(data.frame(SBIN.BO=SBIN.BO[,'SBIN.BO.Close'],
                            IDBI.BO=IDBI.BO[,'IDBI.BO.Close'],
                            HDFCBANK.BO=HDFCBANK.BO[,'HDFCBANK.BO.Close'],
                            KOTAKBANK.BO=KOTAKBANK.BO[,'KOTAKBANK.BO.Close'],
                            FEDERALBNK.BO=FEDERALBNK.BO[,'FEDERALBNK.BO.Close'],
                            BANKBARODA.BO=BANKBARODA.BO[,'BANKBARODA.BO.Close'],
                            BANKINDIA.BO=BANKINDIA.BO[,'BANKINDIA.BO.Close'],
                            ICICIBANK.BO=ICICIBANK.BO[,'ICICIBANK.BO.Close'],
                            DHANBANK.BO=DHANBANK.BO[,'DHANBANK.BO.Close'],
                            CUB.BO=CUB.BO[,'CUB.BO.Close'],
                            AXISBANK.BO=AXISBANK.BO[,'AXISBANK.BO.Close'],
                            SOUTHBANK.BO=SOUTHBANK.BO[,'SOUTHBANK.BO.Close'],
                            IOB.BO=IOB.BO[,'IOB.BO.Close'],
                            PNB.BO=PNB.BO[,'PNB.BO.Close'],
                            UNIONBANK.BO=UNIONBANK.BO[,'UNIONBANK.BO.Close'],
                            CANBK.BO=CANBK.BO[,'CANBK.BO.Close'],
                            UCOBANK.BO=UCOBANK.BO[,'UCOBANK.BO.Close'],
                            MAHABANK.BO=MAHABANK.BO[,'MAHABANK.BO.Close'],
                            YESBANK.BO=YESBANK.BO[,'YESBANK.BO.Close'],
                            KTKBANK.BO=KTKBANK.BO[,'KTKBANK.BO.Close'],
                            DCBBANK.BO=DCBBANK.BO[,'DCBBANK.BO.Close'],
                            INDIANB.BO=INDIANB.BO[,'INDIANB.BO.Close'],
                            CENTRALBK.BO=CENTRALBK.BO[,'CENTRALBK.BO.Close'],
                            PSB.BO=PSB.BO[,'PSB.BO.Close']))

# Weekly Data
stocks_weekly <- as.xts(data.frame(SBIN.BO=SBIN.BO[,'SBIN.BO.Close'],
                            IDBI.BO=IDBI.BO[,'IDBI.BO.Close'],
                            HDFCBANK.BO=HDFCBANK.BO[,'HDFCBANK.BO.Close'],
                            KOTAKBANK.BO=KOTAKBANK.BO[,'KOTAKBANK.BO.Close'],
                            FEDERALBNK.BO=FEDERALBNK.BO[,'FEDERALBNK.BO.Close'],
                            BANKBARODA.BO=BANKBARODA.BO[,'BANKBARODA.BO.Close'],
                            BANKINDIA.BO=BANKINDIA.BO[,'BANKINDIA.BO.Close'],
                            ICICIBANK.BO=ICICIBANK.BO[,'ICICIBANK.BO.Close'],
                            DHANBANK.BO=DHANBANK.BO[,'DHANBANK.BO.Close'],
                            CUB.BO=CUB.BO[,'CUB.BO.Close'],
                            AXISBANK.BO=AXISBANK.BO[,'AXISBANK.BO.Close'],
                            SOUTHBANK.BO=SOUTHBANK.BO[,'SOUTHBANK.BO.Close'],
                            IOB.BO=IOB.BO[,'IOB.BO.Close'],
                            PNB.BO=PNB.BO[,'PNB.BO.Close'],
                            UNIONBANK.BO=UNIONBANK.BO[,'UNIONBANK.BO.Close'],
                            CANBK.BO=CANBK.BO[,'CANBK.BO.Close'],
                            UCOBANK.BO=UCOBANK.BO[,'UCOBANK.BO.Close'],
                            MAHABANK.BO=MAHABANK.BO[,'MAHABANK.BO.Close'],
                            YESBANK.BO=YESBANK.BO[,'YESBANK.BO.Close'],
                            KTKBANK.BO=KTKBANK.BO[,'KTKBANK.BO.Close'],
                            DCBBANK.BO=DCBBANK.BO[,'DCBBANK.BO.Close'],
                            INDIANB.BO=INDIANB.BO[,'INDIANB.BO.Close'],
                            CENTRALBK.BO=CENTRALBK.BO[,'CENTRALBK.BO.Close'],
                            PSB.BO=PSB.BO[,'PSB.BO.Close']))



head(stocks)
head(stocks_weekly)
dim(stocks)
class(stocks)
write.csv(stocks, 'prices_stock_32bank_GA.csv', row.names=F)
write.csv(stocks_weekly, 'prices_stock_32bank_weekly_GA.csv', row.names=F)
col = colnames(stocks)
col


class(stocks1)
head(stocks1)

library(zoo)
# Created dates as a column
stocks2=as.data.frame(fortify.zoo(stocks, name = "Date"))
stocks2_weekly=as.data.frame(fortify.zoo(stocks_weekly, name = "Date"))
head(stocks2)
head(stocks2_weekly)

# Renaming  the columns
col <- colnames(stocks2)
new_col <- gsub('.BO.Close', '', col)
new_col
colnames(stocks2)<- new_col
colnames(stocks2_weekly)<- new_col
head(stocks2)
head(stocks2_weekly)
write.csv(stocks2, 'prices_stock_32bank_GA_V2.csv', row.names=F)
write.csv(stocks2_weekly, 'prices_stock_32bank_weekly_GA_V5.csv', row.names=F)
# Create a plot showing all series as lines; must use as.zoo to use the zoo
# method for plot, which allows for multiple series to be plotted on same
# plot
plot(as.zoo(stocks), screens = 1, lty = 1:3, xlab = "Date", ylab = "Price")
legend("right",ticker, lty = 1:3, cex = 0.5)
############################################################################
plot(as.zoo(stocks[, col]), screens = 1, lty = 1:2, 
     xlab = "Date", ylab = "Price")
par(new = TRUE)
####################################################################################
plot(as.zoo(stocks[, "SBIN.BO.Close"]), screens = 1, lty = 3, xaxt = "n", yaxt = "n", 
     xlab = "", ylab = "")
axis(4)
mtext("Price", side = 4, line = 3)
legend("topleft", c("AAPL (left)", "MSFT (left)", "GOOG"), lty = 1:3, cex = 0.5)
####################################################################################

# Convert to tall format
stocks3 <- melt(stocks2, id.vars="Date")
head(stocks3)
str(stocks3)
write.csv(stocks3, 'prices_stock_32bank_GA_V3.csv', row.names=F)
# Everything on the same plot
ggplot(stocks3, aes(Date,value, col=variable)) + 
  geom_point() + 
  stat_smooth() 

# Separate plots
ggplot(stocks3, aes(Date,value)) + 
  geom_point() + 
  stat_smooth() +
  facet_wrap(~variable)



######################################################################################
stocks4<- stocks3
stocks4$Date<- as.Date(stocks4$Date)

write.csv(stocks4, 'prices_stock_32bank_GA_V2.csv', row.names=F)
stocks4 %>% 
  ggplot(aes(x=Date, y=value, color=variable))+
  geom_line()+
  facet_wrap(~variable, scales='free_y')+
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())+
  labs(x='Date',
       y='Close Price',
       title=paste('Price Chart' , 'from',as.character(start) , 'till',as.character(end)))
#########################################################################################


 
