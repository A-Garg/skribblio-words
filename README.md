# skribblio-words
Convert documents containing objectives from Canadian medical licensing bodies into word lists for [skribbl.io](skribbl.io), a picture-drawing online game.

Original documents are from the Royal College of Physicians and Surgeons [internal medicine competencies](https://www.royalcollege.ca/rcsite/ibd-search-e?N=10000033+10000034+4294967122&label=Internal%20Medicine) and Canadian College of Family Physicians [certification objectives](https://portal.cfpc.ca/ResourcesDocs/uploadedFiles/Education/Certification_in_Family_Medicine_Examination/Assessment-Objectives-for-Certification-in-FM-full-document.pdf). I converted these PDFs to text files, which are uploaded as `Royal College Words.txt` and `CCFP words.txt`.

The scripts, `extract_words.py` and `extract_words.R`, extract 5-letter-or-longer words from these files, alphabetize them, and return them separated by commas. Both the python and R scripts do the same thing; I wanted practice scripting in both languages.

Sample output files are `Royal College Words.txt` and `CCFP output.txt`.
