#! /usr/bin/perl
use 5.020;
use List::MoreUtils qw/uniq/;

while (my $line = readline()){
  my @processed_chars;
  my @last_4;
  my $count = 0;
  foreach my $char (split m//, $line){
    $count++;
    push(@processed_chars, $char);
    shift(@last_4) if $#last_4 >= 3;
    push(@last_4, $char);
    my @uniques = uniq(sort(@last_4));   
    say "[$count] $char [".join('', @last_4)."] $#uniques [".join('', @uniques)."] ($#processed_chars) ($#last_4)";
    if( $#uniques == 3 ){
      say "> $count" and exit;
    }
  }
} 
