#! /usr/bin/perl
use 5.020;
use List::MoreUtils qw/uniq/;

while (my $line = readline()){
  my @processed_chars;
  my @last_14;
  my $count = 0;
  foreach my $char (split m//, $line){
    $count++;
    push(@processed_chars, $char);
    shift(@last_14) if $#last_14 >= 13;
    push(@last_14, $char);
    my @uniques = uniq(sort(@last_14));   
    say "[$count] $char [".join('', @last_14)."] $#uniques [".join('', @uniques)."] ($#processed_chars) ($#last_14)";
    if( $#uniques == 13 ){
      say "> $count" and exit;
    }
  }
} 
