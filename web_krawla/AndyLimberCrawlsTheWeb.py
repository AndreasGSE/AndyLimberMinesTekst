import sys
import numpy as np
import time, random
import urllib2
import xmltodict
from BeautifulSoup import BeautifulSoup


def get_url_info(url, type):
	raw_page = urllib2.urlopen(url)

	if type == "XML":
		xml_res = xmltodict.parse(raw_page.read()) # parsing result for XML
		return xml_res
	if type == "HTML":
		html_res = BeautifulSoup(raw_page) # parsing result for HTML
		return html_res

# Calling on each URL
def scrape_yo_booty(url_list, type, output_file):
	scrape_results = []

	for i, url in enumerate(url_list):
		wait = random.randint(1,3) # time delay
		time.sleep(wait)
		print "Trying url #" + str(i) + " with delay " + str(wait)
		
		# Get content
		try:
			scrape_results.append(get_url_info(url, type))

			with open("./completed_urls.txt", "a") as complete_file:
				complete_file.write(url + '\n')
				complete_file.close()

        # In case of failure        
		except:
			with open("./failed_urls.txt", "a") as failed_file:
				failed_file.write(url + '\n')
				failed_file.close()

        # Blank results for memory
        if i % 10000 == 0 and i != 0:
        	np.savetxt(output_file, scrape_results, delimiter=',', fmt='%s')
        	scrape_results = []

	np.savetxt(output_file, scrape_results, delimiter=',', fmt='%s')

# Loading the URLs and begining to retrieve data
def scrape_the_web(argv):
	start_i = int(argv[0])
	end_i = int(argv[1])
	file_in = argv[2] # input file
	url_type = argv[3] # is it HTML or XML?
	file_out = argv[4] # output file

	file_loc = "./" + file_in
	output_file = "./" + file_out + ".gz"

	url_list = np.loadtxt(file_loc, dtype = str)[start_i:end_i]
	scrape_yo_booty(url_list, url_type, output_file)


# Taking arguments from command line to initiate
if __name__ == '__main__':
    scrape_the_web(sys.argv[1:])