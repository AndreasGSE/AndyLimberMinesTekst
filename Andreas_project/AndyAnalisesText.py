import numpy as np

#with open('reviews_ratings.txt', 'r') as review_file: # so we load in ALL the data as a massive string
#	car_output = stringfile.read()

review_data = np.loadtxt("reviews_ratings.txt", dtype = str, delimiter = "\n")
reviews = [review[:-1] for review in review_data]

print reviews[1]