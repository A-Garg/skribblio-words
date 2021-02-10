#################################
#                               #
#  extract_words.R              #
#  Akhil Garg, garga4@vcu.edu   #
#  Updated 2021-02-10           #
#                               #
#################################

# File names
read_file  = "CCFP words.txt"
write_file = "CCFP output.txt"

word_list = c()
i = 1

# Read data
rf = file(read_file, "r")
while ( TRUE )
{
  line = readLines(rf, n = 1)

  if (length(line) == 0){break}   # break out of loop at end of file
  line = trimws (line)            # trim whitespace
  line = tolower(line)            # make lowercase
  if (length(line) == 0){next}    # skip whitespace only lines
  if (grepl("^ *$", line) ){next} # skip blank lines

  # Split line into vector across spaces or slashes
  line = unlist(strsplit(line, "\\s+|/"))

  # Remove non-letter symbols
  line = gsub("[^a-z]", "", line)

  # Add >= 5 letter long words to list
  for (word in line)
  {
    if (nchar(word) >= 5)
    {
      word_list[i] = word
      i = i + 1
    }
  }
}
close(rf)

# Remove duplicates and alphabetize
word_list = sort(unique(word_list))

# Write word list to file
sink(write_file)
for (word in word_list)
{
  cat(word)
  # Don't add a comma after the last list element
  if(word != tail(word_list, 1))
  {
    cat(",")
  }
}
sink()

print(paste("Number of words:",length(word_list)))
