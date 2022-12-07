#! /usr/bin/perl

use 5.020;

my %scores = (
  "a" => "1",
  "b" => "2",
  "c" => "3",
  "d" => "4",
  "e" => "5",
  "f" => "6",
  "g" => "7",
  "h" => "8",
  "i" => "9",
  "j" => "10",
  "k" => "11",
  "l" => "12",
  "m" => "13",
  "n" => "14",
  "o" => "15",
  "p" => "16",
  "q" => "17",
  "r" => "18",
  "s" => "19",
  "t" => "20",
  "u" => "21",
  "v" => "22",
  "w" => "23",
  "x" => "24",
  "y" => "25",
  "z" => "26",
  "A" => "27",
  "B" => "28",
  "C" => "29",
  "D" => "30",
  "E" => "31",
  "F" => "32",
  "G" => "33",
  "H" => "34",
  "I" => "35",
  "J" => "36",
  "K" => "37",
  "L" => "38",
  "M" => "39",
  "N" => "40",
  "O" => "41",
  "P" => "42",
  "Q" => "43",
  "R" => "44",
  "S" => "45",
  "T" => "46",
  "U" => "47",
  "V" => "48",
  "W" => "49",
  "X" => "50",
  "Y" => "51",
  "Z" => "52",
);

my $priorities = 0;
while (my $line = readline()){
  my ($c1,$c2) = split_line($line);
  my $c = find_repeated_characters($c1, $c2);
  my $priority = $scores{$c};
  say("$priorities: $c $priority");
  die("$.: No score for $c") unless $priority >0;
  $priorities = $priorities + $priority; 
}
say $priorities;

sub split_line{
  my $line = shift;
  chomp($line);
  my $compartment_size = length($line) / 2;
  my $c1 = substr($line, 0, $compartment_size);
  my $c2 = substr($line, $compartment_size);
  #say "[$line][$c1][$c2]";
  return($c1,$c2);
}

sub find_repeated_characters{
  my ($c1,$c2) = @_;
  my $repeated;
  foreach my $char (split(m//, $c1)){
    if($c2 =~ m/$char/){
      $repeated.=$char unless $repeated =~ m/$char/;
    }
  }
  return $repeated if length($repeated) == 1;
  die("$. : repeated: $repeated, [$c1][$c2]");
}

