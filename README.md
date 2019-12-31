# 基于重测序vcf数据计算群体的单倍型频率及作图: SNP_Gene_Phenotype2haplotypes.pl
the vcf file of SNPs to haplotypes
![-](Plot_gene-Si9g49990.1-Phenotype.png)
![-](Plot_gene-Si9g49990.2-Phenotype.png)
## Description
__`SNP_Gene_Phenotype2haplotypes.pl`__ can be used to draw the Gene structure and haplotypes quickly in `PDF` format based on the VCF, GFF and gene's ID. It will become a useful tool for `drawing gene structure` with the advantages of a simple input data format, easily modified output and very good portability. __`SNP_Gene_Phenotype2haplotypes.pl`__ is open source, so all we ask is that you cite our most recent paper in any publications that use this script:</br>
> 基于重测序vcf数据计算群体的单倍型频率及作图.</br>
> A tool to draw Gene structure and haplotypes based on perl and R language.</br>

## Dependencies
__`perl 5`__ and all __`R`__ versions. </br></br>

## Getting started
Put __`SNP_Gene_Phenotype2haplotypes.pl`__ and VCF, GFF, Phenotype and the TXT result of annovar (table_annovar.pl, such as test.si_multianno.txt) files in a same dir, then run:</br>
```
     perl  vcf2hmp.pl  test.vcf  test.si_multianno.txt
     
     perl  SNP_Gene_Phenotype2haplotypes.pl  ./Your.hmp  ./Phenotype.txt  ./genome.gff  Your_gene_ID
e.g. perl  SNP_Gene_Phenotype2haplotypes.pl  ./haplotypes.hmp   ./Phenotype.txt  ./test.gff  Si9g49990
```
</br>

## Contact information
For any questions please contact xukai_li@qq.com</br>
