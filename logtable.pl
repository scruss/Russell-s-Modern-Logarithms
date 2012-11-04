#!/usr/bin/perl -w
# logtable.pl - CC BY-NC-SA - scruss.com - 2012-11-04

use strict;

my $row=0;
for ( my $x = 1.000 ; $x < 9.999 ; $x += 0.01 ) {
  $row++;
  print '\rowcolor{bg}' unless ($row%2);
  my $disp_x=sprintf( "%.2f", $x );
  if ($disp_x =~ /\.00$/) {
    print ' \textcolor{blue}{\textbf{', $disp_x, '}}';
  }
  else {
    print ' \textbf{', $disp_x, '}';
  }
  print '\markboth{', $disp_x, '}{', $disp_x, '}';
  my $a = $x;
  for ( my $i = 0 ; $i < 10 ; $i++ ) {
    $_ = sprintf( "%.5f", log10($a) );
    s/^0//;
    print " & ", $_;
    $a += 0.001;
  }
  print ' \\\\', "\n";
}
exit;

sub log10 {
  my $n = shift;
  return log($n) / log(10.0);
}
