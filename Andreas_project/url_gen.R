setwd("C:/Users/Dre/Dropbox/Barna/Master/TextMining/AndyLimberMinesTekst/Andreas_project")

urllist_golf <- sapply(1:163, function(x){
  url_golf <- paste0("http://www.weloveanycar.com/car-review/volkswagen/golf?page=",x,
                     "&filter=#.Vz95DZF97IU")
   
})

urllist_passat <- sapply(1:89, function(x){
  url_passat <- paste0("http://www.weloveanycar.com/car-review/volkswagen/passat?page=",x,
                "&filter=#.V0Na65F97IU") 
}) 

urllist_polo <- sapply(1:72, function(x){
  url_polo <- paste0("http://www.weloveanycar.com/car-review/volkswagen/polo?page=",x,
                    "&filter=#.V0Na65F97IU")
})

urllist <- c(urllist_golf, urllist_passat, urllist_polo)
write(urllist, file = "carreviewurls.txt", ncolumns = 1)
