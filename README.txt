README

step 1
place all gzipped raw data files (what was downloaded from the sequencing core) in the folder ./rawdata
-make sure they are not in any sub directory


step 2: create environment with needed packages from existing file. I have created an environment you can use or you can download the necessary packages through conda on your own. If copying my environment, Only need to run this line of code once. 
terminal: conda env create -f STARenvironment.yml
--> Note: this is only the packages for STAR, I use a seperate environment for DESEQ related analysis in order to not get bogged down

step 3
Terminal: jupyter server

Step6:
Open filtering_STARalignment.ipynb and run pipeline for filtering, sequencing QC, Alignment and count extraction (to run chunk of code, press [shift+return]

https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf
https://hbctraining.github.io/Intro-to-rnaseq-hpc-O2/lessons/03_alignment.html
https://multiqc.info/docs/

you can watch files and folders be created to watch the progress of the file.
open the multiqc.html file to view QC results

step 6
Open loadsamples.ipynb to generate count matrix and metadata for DESeq 
--> I edit metadata tables in excel locally then upload to the folder for use, just easier for me 

step 7
open DESeq_Master.ipynb to generate PCA plots, run DE analysis and make volcanoes 

