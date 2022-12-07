#! /usr/bin/perl

use 5.030;

my %elves_totals;
my $this_elf = 0;
my $this_elf_total = 0;
while(my $line = readline()){
  chomp($line);
  if($line =~ m/^(\d+)$/){
    $this_elf_total += $1;
  }elsif($line =~ m/^\s*$/){
    $elves_totals{$this_elf} = $this_elf_total;
    $this_elf++;
    $this_elf_total = 0;
  }
}
use Data::Dumper;
#say Dumper(keys(%elves_totals));

foreach my $e (sort {$elves_totals{$b} <=> $elves_totals{$a} } keys %elves_totals){
  say "$e ($elves_totals{$e})";
  last;
}
