# GithubFrontiersNeurosci2018

**A microglial signature directing human aging and neurodegeneration-related gene networks

Short title:	Microglial signatures in aging and disease

Shradha Mukherjee1,2,3*#, Christine Klaus4*, Mihaela Pricop-Jeckstadt5, Jeremy Miller6, Felix L Struebing7,8,9*#

These * authors contributed equally # Corresponding authors

# Citation: This github repository is made open access in hope that it will enable researchers replicate and/or adapt it for their work. So if you use or adapt the results, inferences and computational pipelines presented here, I will be grateful if you please help by citing it as follows. 

# Mukherjee, S., Klaus, C., Pricop-Jeckstadt, M., Miller, J. A. & Struebing, F. L. A Microglial Signature Directing Human Aging and Neurodegeneration-Related Gene Networks. Frontiers in neuroscience 13, 2, doi:10.3389/fnins.2019.00002 (2019).
 
# Contact Information
Shradha Mukherjee*#
Address: Shradha Mukherjee, PhD; Alias Goldy; Garland Avenue, Downtown Los Angeles, Los Angeles, CA 90017, U.S. Email: smukher2@gmail.com
* First author and # Corresponding author

Shradha Mukherjee, PhD in Biochemistry,                                                                                                                                       
MS in Chemistry, MAS in Health Informatics 

CV/Resume Link https://github.com/smukher2/Shradha_Mukherjee_Resume                                                                                      
Researchgate Link https://www.researchgate.net/profile/Shradha_Mukherjee                                                         
Github Link https://github.com/smukher2                                                                                                                                       
Pubmed Link https://www.ncbi.nlm.nih.gov/pubmed/?term=Shradha+Mukherjee   
Youtube Channel Link https://www.youtube.com/user/smukher2/playlists

# Protocol: Organization of folders containing subfolders, files and codes. 

**1 RNAseq_ASUcyverseCluster_Results+Script/ contains 

  *1.1 The codes for analysis of RNA-seq mouse aging hippocampus data analysis codes from raw fastq to htseq counts for GSE61915, GSE73503 and GSE83931 in sub-folder MouseRNAseq_Aging_Scripts_ForGetDataToCountData/  The starting raw fastq files for this code were obtained from GEO using fastq-dump, the code for which is also inclided in the script. 
  
  *1.2 Another subfolder, MouseRNAseq_CellType_Results+Scripts_ForGetDataToCuffdiff2/ contains the codes for analysis of RNA-seq mouse cortex cell types from raw fastq to differential gene expression with cuffdiff2 for GSE52564. The starting raw fastq files for this code were obtained from GEO using fastq-dump, the code for which is also inclided in the script. 
  
**2 MouseAge/ 

contains the codes, input files and results for entire analysis of the mouse aging starting from htseq count files to WGCNA. The htseq count files were obtained with the scripts in RNAseq_ASUcyverseCluster_Results+Script/MouseRNAseq_Aging_Scripts_ForGetDataToCountData/
The minimum files and codes required to reproduce our results here are MouseAge.Rproj, MouseAge.Rmd, InputMsAge/ and InputHtseqCount/ After downloading these if the user runs the MouseAge.Rmd code in RStudio using command 'knit to html' or 'Run all' it should reproduce our results. 
  
**3 HumanAgeDis/ 

contains the codes, input files and results for entire analysis of the human aging and disease microarray data GSE33000 and GSE43490 from getting expression data from GEO to WGCNA. The minimum files and codes required to reproduce our results here are HumanAgeDis.Rproj, HumanAgeDis.Rmd and InputHuAgeDis/  After downloading these if the user runs the HuAgeDis.Rmd code in RStudio using command 'knit to html' or 'Run all' it should reproduce our results. 

**4 HuAgeDisVsMsAge/ 

contains the codes, input files and results for preservation analysis and hypergeometric enrichment test to compare the WGCNA results obtained from HumanAgeDis/ and MouseAge/ The minimum files and codes required to reproduce our results here are Pres&Hyper_HumanAgeVsOthers.Rproj, Pres&Hyper_HumanAgeVsOthers.Rmd and InputPreservation/  After downloading these if the user runs the Pres&Hyper_HumanAgeVsOthers.Rmd code in RStudio using command 'knit to html' or 'Run all' it should reproduce our results. 

# Acknowledgement: 

1) SVA: Dr. Jeff Leek http://jtleek.com/genstats/inst/doc/02_13_batch-effects.html and https://www.bioconductor.org/packages/release/bioc/vignettes/sva/inst/doc/sva.pdf
2) WGCNA: Dr. Jeremy Miller https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/JMiller/
3) WGCNA Preservation: Dr. Steve Horvath and Dr. Peter Langfelder https://horvath.genetics.ucla.edu/html/CoexpressionNetwork/ModulePreservation/Tutorials/MiniTutorial-MouseLiver.pdf
4) WGCNA Hub Genes: Dr. Steve Horvath and Dr. Peter Langfelder https://pdfs.semanticscholar.org/5e42/e2185c54874277794395e5825808e5f5709c.pdf
Users new to SVA and WGCNA, are encouraged to refer to the above mentioned turotials and pipeline. Other acknowledgements have been added to the best of our knowledge as #comment in the code/pipeline itself. 
