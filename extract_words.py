#################################
#                               #
#  extract_words.py             #
#  Akhil Garg, garga4@vcu.edu   #
#  Updated 2021-02-10           #
#                               #
#################################

import sys
import re

# Collect words in a set
word_set = set()

# File names can be written through console
try:
    read_file_name  = sys.argv[1]
    write_file_name = sys.argv[2]
except IndexError:
    read_file_name  = 'Royal College Words.txt'
    write_file_name = 'Royal College Output.txt'

# File manipulation
with open(read_file_name,'r', encoding = "utf8") as f:
  for line in f:
        
    # String processing
    if line.isspace(): continue #remove blank lines
    line = line.strip() #remove whitespace
    
    # Remove special characters except letters, spaces, slashes, or dashes
    line = ''.join(i for i in line if (i.isalpha() or i == ' ' or i == '/' or i == '-')) 
    line = line.lower() # make all letters lowercase
    
    # Collect words in a set to remove duplicates
    for i in re.split(' |/',line): word_set.add(i)
    

# Obtaining at least 5-letter words and alphabetizing
words = sorted(list(word_set))
words = [i for i in words if len(i) >= 5]


# Writing to file
with open(write_file_name,'w') as f:
    for i in words: 
    
        f.write(i)   
        if i == words[-1]: continue # Don't add a comma after the last word
        else: f.write(',')
        
print('Total number of words: {}'.format(len(words)))
