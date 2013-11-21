
#install.packages("devtools")

require(devtools)

#install_github('rCharts', 'ramnathv')
require(rCharts)

#Make sure you set the path to the place you saved the file
ranks<-read.csv("Data/y2013w12Rank.csv")

names(ranks) = gsub("\\.", "", names(ranks))

ranks1<-ranks[rowSums(cbind(ranks$Wins, ranks$Losses))>5,]

mytooltip = "function(d){return d.Team + '\n' + d.Rank + '\n' + d.Score}"


n1 <- nPlot(TrueMargin~Elo, 
            data = ranks1,
            group = "Losses",
            type = 'scatterChart')
n1$chart(size = '#! function(d){return d.Score} !#')
n1$chart(tooltipContent= "#! function(key, x, y, e){
  return '<b>Team:</b> ' + e.point.Team + '<br/>' +
    '<b>Rank: </b>' + e.point.Rank + '<br/>' + 
    '<b>Score: </b>' + e.point.Score + '<br/>' +  
    '<b>Wins: </b>' + e.point.Wins + '<br/>' + 
    '<b>Losses: </b>' + e.point.Losses
} !#")
n1$set(height = 700, width = 1100)
n1

