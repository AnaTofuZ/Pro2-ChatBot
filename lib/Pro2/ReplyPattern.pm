package Pro2::ReplyPattern;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

sub new {
    my ($class,%args) = @_;

    my $self = {};
    $self->{psttern} = $args{pattern} or die 'please input botname';
    $self->{reply} = $args{reply} or die 'please input patterns';

    return bless $self,$class;
}

sub print {
    my $self = shift;
    print("pattern: $self->{pattern}\n");
    print("reply: $self->{reply}\n");
}

sub equals {
    my ($self,$pattern) = @_;
    return ($self->{pattern} eq $pattern);
}


1;
__END__

=encoding utf-8

=head1 NAME

Pro2::ReplyPattern - It's new $module

=head1 SYNOPSIS

    use Pro2::ReplyPattern;

=head1 DESCRIPTION

Pro2::ReplyPattern is ...

=head1 LICENSE

Copyright (C) Takahiro SHIMIZU.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Takahiro SHIMIZU E<lt>anatofuz@gmail.comE<gt>

=cut

