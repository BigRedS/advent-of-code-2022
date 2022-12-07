#!/usr/bin/perl

use 5.020;

my $contained = 0;
while(my $line = readline()){
  chomp($line);
  my @groups = split(m/,/, $line);
  my($l1,$h1) = split(m/-/, $groups[0]);
  my($l2,$h2) = split(m/-/, $groups[1]);

  if($h1 >= $l2 and $l1 <=$h2){
    say "+ $. [$line] $h1 >= $l2 and $l1 <= $h2";
    $contained++;
  }elsif($h2 >=$l1 and $l2 <= $h1){
    say "+ $. [$line] $h2 >= $l1 and $l2 <= $h1";
    $contained++;
  }else{
    say "- $. [$line] $h1    $l2 or $h2    $l1";
  }
}
say $contained;
