#!/usr/bin/env perl

use strict;
use warnings;

sub random {
    my ( $min, $max ) = @_;
    return int( rand( $max - $min ) ) + $min;
}

sub random_item_from {
    return @_[ rand @_ ];
}

sub random_consonant {
    return random_item_from(
        qw(b c d f g h j k l ll m n p q r s ss t v w x y z));
}

sub random_vowel {
    return random_item_from(qw(a e ee i o oo u));
}

sub random_word_generator {
    my $length = shift;
    my $word   = '';
    my $vowel  = random( 0, 2 );
    while ( length($word) < $length ) {
        $word .= $vowel ? random_vowel() : random_consonant();
        $vowel = !$vowel;
    }
    return $word;
}

sub format_name {
    my ( $first_name, $second_name ) = @_;
    return sprintf( "%s %s", ucfirst($first_name), ucfirst($second_name) );
}

sub random_name_generator {
    my $first_name  = random_word_generator( random( 3, 10 ) );
    my $second_name = random_word_generator( random( 3, 10 ) );
    return format_name( $first_name, $second_name );
}

srand();

print "TEST\n--\n";
for ( 0 .. 9 ) {
    print random_name_generator() . "\n";
}
print "--\n\n";

