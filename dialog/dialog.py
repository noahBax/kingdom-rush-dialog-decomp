from io import TextIOWrapper
import re

class Dialog:

	def __init__(self, title: str, file_contents: TextIOWrapper) -> None:
		
		self.title = title
		self.lines_read = 0

		# print('Title is', self.title)

		open_count = 2

		# Skip 2 lines
		file_contents.readlines(2)

		for line in file_contents:
			self.lines_read += 1
			if re.search('narrator = ', line):
				# print(line.strip()[18:-1])
				t = line.strip()[18:-1].split(',', maxsplit=1)
				num = int(t[0])
				val = t[1].strip()[1:-2]
				self.narrator = (num, val)
				print(self.narrator)

