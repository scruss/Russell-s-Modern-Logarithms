#!/usr/bin/perl -w
# antilogtable.pl - CC BY-NC-SA - scruss.com - 2012-11-04

use strict;

my $row=0;
for ( my $x = 0.0 ; $x < 0.9999 ; $x += 0.001 ) {
  $row++;
  print '\rowcolor{bg}' unless ($row%2);
  $_ = sprintf( "%.3f", $x );
  s/^0//;
  if ($_ =~ /00$/) {
    print ' \textcolor{blue}{\textbf{', $_, '}}';
  }
  else {
    print ' \textbf{', $_, '}';
  }
  print '\markboth{0', $_, '}{0', $_, '}'; # add leading zero to heads
  my $a = $x;
  for ( my $i = 0 ; $i < 10 ; $i++ ) {
    printf( " & %.4f", 10.0**$a );
    $a += 0.0001;
  }
  print ' \\\\', "\n";
}
exit;

