#! /usr/bin/perl

use 5.030;

my $cum_score = 0;
while(my $line = readline()){
  chomp($line);
  next unless $line =~ m/.+/;
  my ($him, $me) = split(m/\s+/, $line);
  my $this_score = get_score($him, $me);
  $cum_score = $cum_score + $this_score;
#  say "[$him][$me]i $this_score $cum_score";
}
say $cum_score;

# # #
# #
#

sub get_score{
 my ($him, $me) = @_;
 my $score = get_score_from_choice($me) + get_score_from_winning($him, $me);
 return $score;
}

sub get_score_from_choice {
  my $choice = shift;
  return 1 if $choice eq 'X';
  return 2 if $choice eq 'Y';
  return 3 if $choice eq 'Z';
  say "$.: Failed to read score from choice";
}

# A X rock
# B Y paper
# C Z scissors

sub get_score_from_winning {
  my ($him, $me) = @_;
  if($him eq 'A'){
    return 3 if $me eq 'X';
    return 6 if $me eq 'Y';
    return 0 if $me eq 'Z' ;
  }elsif($him eq 'B'){
    return 3 if $me eq 'Y';
    return 6 if $me eq 'Z';
    return 0 if $me eq 'X' ;
  }elsif($him eq 'C'){
    return 3 if $me eq 'Z';
    return 6 if $me eq 'X';
    return 0 if $me eq 'Y' ;
  }
  say "$.: failed to get score from winning ('$him''$me')";
}
