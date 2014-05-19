package Digest::Mock::Size;

use 5.10.0;
use strict;
use warnings;
use parent 'Digest::base';

sub _buffer {
    my $self = shift;
    my $buf = $self->{_buffer} ||= [];
    return wantarray? @{ $buf } : $buf;
}

use namespace::clean;

=head1 NAME

Digest::Mock::Size - Mock digest interface to return size of message

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01_1';


=head1 SYNOPSIS

See L<Digest> module.

=head1 METHODS

=head2 new

A very simple constructor

=cut

sub new { return bless {}, shift; }

=head2 clone

Clone the digest object

=cut

sub clone {
    my $self = shift;
    return bless { %{ $self } }, ref( $self );
}

=head2 reset

Reset the message buffer

=cut

sub reset {
    my $self = shift;
    
    @{ $self->_buffer } = ();
    
    return $self;
}

=head2 message

Returns digest message buffer

=cut

sub message {
    my $self = shift;
    return wantarray? @{ $self->_buffer } : join '', @{ $self->_buffer };
}

=head2 reset_with_message

Returns the message buffer and resets it

=cut

sub reset_with_message {
    my $self = shift;
    my $msg  = $self->message;
    
    $self->reset;
    
    return $msg;
}

=head2 add

Add data to the digest message buffer

=cut

sub add {
    my $self = shift;
    
    push @{ $self->_buffer }, @_ if @_;
    
    return $self;
}

=head2 size RESET

Returns the size of the message
If boolean RESET is true it will reset the message buffer

=cut

sub size {
    my $self = shift;
    return length shift()?
        $self->message_and_reset :
        $self->message;
}

=head2 digest

Returns packed size of message and resets as per interface spec
B<Beware>: this is the length of the message prior to any digesting

=cut

sub digest {
    my $self = shift;
    return pack 'N*', $self->size(1);
}

=head1 AUTHOR

Jason M Mills, C<< <jmmills at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-digest-mock-size at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Digest-Mock-Size>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Digest::Mock::Size


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Digest-Mock-Size>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Digest-Mock-Size>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Digest-Mock-Size>

=item * Search CPAN

L<http://search.cpan.org/dist/Digest-Mock-Size/>

=item * GitHub

L<https://github.com/jmmills/digest-mock-size/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Jason M Mills.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Digest::Mock::Size
