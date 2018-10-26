package Pro2::ChatBot;
use 5.008001;
use strict;
use warnings;
use Pro2::ReplyPattern;
use utf8;
use Encode;

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
        if ($self->{patterns}->[$i]->equals($pattern)){
            return $i;
        }
    }

    for (my $i = 0; $i < @{$self->{patterns}}; $i++){
        if ($self->{patterns}->[$i]->equals("other")){
            return $i;
        }
    }

    return -1;
}

sub greeting {
    my $self = shift @_;
    my $index = $self->searchPattern("greeting");
    print encode_utf8("$self->{botname} 「" .$self->{patterns}->[$index]->reply() ." 」\n");
}

sub reply {
    my ($self,$pattern) = @_;
    my $index = $self->searchPattern($pattern);
    my $message = "$self->{botname} 「 ".$self->{patterns}->[$index]->reply(). " 」\n";
    return $message;
}

1;
__END__

=encoding utf-8

=head1 Ppo2PerlScript

    perl -Ilib examples/main.pl

=head1 ABOUT

プロ2の課題 L<https://github.com/naltoma/java_intro/blob/master/report/report2_chatbot2/report2_intellij.md|チャットボット初号機拡張> な課題のPerl実装
クラスは特にモジュールを使わずに素朴に実装してみた．

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

