README
Following instructions are for running the pipeline locally on your computer vs on a remote computer

place all gzipped raw data files (what was downloaded from the sequencing core) in the folder ./rawdata
-make sure they are not in any sub directory


step 1
before running code, you must download miniconda3 (uses environments  to contains all packages needed to run the code) 
https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.pkg

step 2
in terminal, enter the base directory (STAR_alignment)
Cd ~/path/to/your/STAR_alignment
(don't know the filepath? type "Cd" and drag and drop the STAR_alignment directory into terminal) 

step 3: create environment with needed packages from existing file. Only need to run this line of code once. 
terminal: conda env create -f STAR_conda.yml



step 4: Activate conda environment containing packages. NOTE: must run this line before starting jupyter to run code successfully, otherwise the packages will not be loaded. 
Terminal: conda activate STAR_conda

step 5
Terminal: jupyter notebook

Step6:
Open filtering_STARalignment.ipynb and run pipeline (to run chunk of code, press [shift+return]

https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf
https://hbctraining.github.io/Intro-to-rnaseq-hpc-O2/lessons/03_alignment.html
https://multiqc.info/docs/

you can watch files and folders be created to watch the progress of the file.
open the multiqc.html file to view QC results

step 6
open Rmarkdown file (DeSeq_Ca.rmd) in Rstudio
https://rstudio.com/products/rstudio/download/#download

step 7
make any edits needed to code and run!
Note: you will likely need to download and load all packages inside Rstudio (anything that says library(xxx)).
