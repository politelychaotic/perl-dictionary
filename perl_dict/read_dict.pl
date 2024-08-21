#!/usr/bin/perl

use 5.010;

=pod
This is a PERL script that takes in a dictionary term, searches a file called dictionary.txt, 
and stores the data as a PERL 'hash', with the search term being the key, and then allowing up to two 
definitions. 

-politelychaotic
=cut

my $search = $ARGV[0];

sub read_dictionary {
    my ($key) = @_;
    my $filename = 'dictionary.txt';
    my %hasher = ();
    open my $file, $filename or die "Can't open $filename: $!";
    while (my $line = <$file>) {
        chomp $line;
        
        my @words = split(/ /, $line, 2);
        my @defs = split(/; /, $words[1], 1);
        @keys = split(//, $words[0], 1);
        $hasher{$keys[0]} = $defs[0];
    }
    say "$key\nDefinition(s): $hasher{$key}";
    close;
}


read_dictionary($search);
