#!/usr/bin/perl
my $usage=<<USAGE;
Usage:
     perl  $0  ./genome.gff  ./ann.hmp  ./Phenotype.txt   50kb  Chr:position
e.g. perl  GWAS2LD_haplotypes.pl   /data/sidb/Si.Ann_RNA.gff  /data/lxk/GWAS/2.call.variation/4.annotation/All_ann.hmp  /data/lxk/GWAS/2.call.variation/4.annotation/haplotypes/TG-m0022.mGWAS.txt  50kb  9:54605172

USAGE
print $usage if(@ARGV==0);
exit if(@ARGV==0);
$ARGV[3] =~ /(\d+)/;
$kb = $1 * 1000;
print "The LD is $ARGV[3] --> $kb bp\n";

open GFF ,"$ARGV[0]" or die "$!";
while (<GFF>) {
    if ($_ =~ /\tgene\t/) {
        $_ =~ s/\n*|\r*//g;
        @F = split(/\t/,$_);
        $F[8] =~ /ID=(S\w+);?(.*)/;
        $lxk{$1} = "$F[0]\t$F[3]\t$F[4]\t$1\t$2";
    }
}
close GFF;
@F='';

open RES,">>LD_$ARGV[3]_gene_$ARGV[4].txt" or die $!;

@b = split(/:/,$ARGV[4]);
$start = $b[1] - $kb;
$end   = $b[1] + $kb;
for (keys %lxk) {
    @F = split(/\t/,$lxk{$_});
    if (($F[0] eq $b[0]) and ($F[1] > $start) and ($F[2] < $end)) {
       #print "@b:\t($F[0] eq $b[0]) and ($F[1] > $start) and ($F[2] < $end)\n";
        print  RES "$F[0]\t$F[1]\t$F[2]\t$F[3]\t$F[4]\n";
        system("perl  SNP_Gene_Phenotype2haplotypes.pl  $ARGV[1]  $ARGV[2]  $ARGV[0]  $F[3]");
    }
}
