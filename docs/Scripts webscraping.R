
 library(pacman)
 
p_load(RSelenium, rvest, xml2)


system('docker run -d -p 4445:4444 selenium/standalone-chrome')

remDr <- RSelenium::remoteDriver(remoteServerAddr = "localhost",
                                 port = 4445L,
                                 browserName = "chrome")
remDr$open()
