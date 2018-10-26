package Pro2::ChatBot;
use 5.008001;
use strict;
use warnings;
use Pro2::ReplyPattern;

our $VERSION = "0.01";

sub new {
    my ($class,%args) = @_;

    my $self = {};
    $self->{botname} = $args{botname} or die 'please input botname';
    my @patterns = ();
    $args{dataset} || die 'unko';

    for my $data (@{$args{dataset}}){
            my($pattern,$reply) = split /\t/,$data;
            push @patterns, Pro2::ReplyPattern->new(pattern => $pattern,reply => $reply);
        }

    $self->{patterns} = \@patterns or die 'please input patterns';

    return bless $self,$class;
}

sub searchPattern {
    my ($self,$pattern) = @_;

    for (my $i = 0; $i < @{$self->{patterns}}; $i++){
        if ($pattern eq $self->{patterns}->[$i]->{pattern}){
            return $i;
        }
    }

    map { if ("other" eq $self->{patterns}->[$_]->{pattern}){ retrun $_;}} (0..(@{$self->{patterns}}-1));

    return -1;
}

sub greeting {
    my $self = shift @_;
    my $index = $self->searchPattern("greeting");
    print ("$self->{botname} 「 $self->{patterns}->[$index]->{reply} 」\n");
}

sub reply {
    my ($self,$pattern) = @_;
    my $index = $self->searchPattern($pattern);
    my $message = "$self->{botname} 「 $self->{patterns}->[$index]->{reply} 」\n";
    return $message;
}

1;
__END__

=encoding utf-8

=head1 NAME

Pro2::ChatBot - It's new $module

=head1 SYNOPSIS

    use Pro2::ChatBot;

=head1 DESCRIPTION

Pro2::ChatBot is ...

=head1 LICENSE

Copyright (C) Takahiro SHIMIZU.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Takahiro SHIMIZU E<lt>anatofuz@gmail.comE<gt>

=cut

