setwd("C:\")
#devtools::install_version("httr",  version="0.6.0",	repos="http://cran.us.r-project.org")

#install.packages("httr")
library(RCurl)

library(ROAuth)  																																																																																														

library(streamR)																																																																																												

library(twitteR)

library(base64enc)

library(httr)
download.file(url="http://curl.haxx.se/ca/cacert.pem",  destfile="cacert.pem")

#my_oauth$handshake(cainfo="cacert.pem")
#  Configuration	for	twitter																																																																																	

outFile<- "tweets_sample_search_nw.json"

#  Twitter	configuration
requestURL  <- "https://api.twitter.com/oauth/request_token"

accessURL  <- "https://api.twitter.com/oauth/access_token"

authURL	<- "https://api.twitter.com/oauth/authorize"

consumerKey	<- "VpTHLu545XeINpVWqrK7c1Llo"

consumerSecret	<- "GWk6gvVg7NSBTYOASDIncghUKYKrkeefwFc10IwRzu4UWBAFHf"

oauth_token	<- "274318371-YRmazd56HdJwFUDYpPaJazVB7MicWd3EnlMIrdua"

oauth_token_secret	<- "tk6GB35e47hmnmtXMAImk6CmYMUdEsHaWg9wfV8eCrzBf"

my_oauth	<- OAuthFactory$new(			consumerKey=consumerKey,
                                
                                consumerSecret=consumerSecret,
                                
                                requestURL=requestURL,
                                
                                accessURL=accessURL,	authURL=authURL)
my_oauth$handshake(cainfo="cacert.pem")
#registerTwitterOAuth(my_oauth)
setup_twitter_oauth(consumerKey, consumerSecret, oauth_token, oauth_token_secret)

# Run Twitter Search. Format is searchTwitter("Search Terms", n=100, lang="en", geocode="lat,lng", also accepts since and until).
 
tweets <- searchTwitter("#SuicideSquad", n=9999, lang="en", since="2016-08-01")
      
      # Transform tweets list into a data frame
      tweets.df <- twListToDF(tweets) 
      
      # Use the searchTwitter function to only get tweets within 50 miles of Los Angeles
      tweets_geolocated <- searchTwitter("'Suicide Squad' OR #SuicideSquad", n=100, lang="en", geocode='34.04993,-118.24084,50mi', since="2016-08-01")
      tweets_geoolocated.df <- twListToDF(tweets_geolocated)


# Get all tweets
sampleStream(  file=outFile,	oauth=my_oauth	)
