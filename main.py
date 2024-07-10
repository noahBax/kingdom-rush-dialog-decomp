import sys
import os

event_folder = './Events'

for file in os.listdir(event_folder):

	path = os.path.join(event_folder, file)


	with open(path) as file_contents:
		for line in file_contents:

			line_contents = line.strip()

			if 'cinematicMapHelper.HeroByTag("ct_survival").GUID,' in line_contents:
				print('--------------------------------------------')
				print(file_contents.read())	
				print('--------------------------------------------')
				break