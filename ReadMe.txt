#     The txt result of annovar (table_annovar.pl) is test.si_multianno.txt
#     table_annovar.pl  test.vcf  ./  --vcfinput --outfile  test --buildver  si --protocol refGene --operation g -remove

perl  vcf2hmp.pl  test.vcf  test.si_multianno.txt
perl  SNP_Gene_Phenotype2haplotypes.pl  ./haplotypes.hmp   ./Phenotype.txt  ./test.gff  Si1g22370
