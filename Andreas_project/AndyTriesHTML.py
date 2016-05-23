import numpy as np
from bs4 import BeautifulSoup

with open('car_output.txt', 'r') as stringfile: # so we load in ALL the data as a massive string
	car_output = stringfile.read()

out = ["<!DOCTYPE html>" + rest for rest in car_output.split("<!DOCTYPE html>")] # I think this is what I want

out_soup = [BeautifulSoup(html, "html.parser") for html in out[1:]]

# I think the above is standard, now we actually do our document (i.e. if change URLs to look at)

# Now extracting reviews - golf gives me 2098, could add another car to get more
review_rating = []
for page in out_soup:
	page_contents = page.find_all("div", itemprop="review")
	result = [(review.find(itemprop="reviewBody").get_text().encode("ascii","replace"),
	           review.find(class_="size8").get_text().encode("ascii","replace").split()[0]) for review in page_contents]
	[review_rating.append(review) for review in result]

review_rating_red = [(review[0].replace('\n', ' ').replace('\r', ''), review[1]) for review in review_rating if review[0] != "Reviewer left no comment"] # leaves us with 151 reviews

with open("reviews_ratings.txt", "w") as out_file:
	out_file.write("\n".join("%s %s" % review for review in review_rating_red))
