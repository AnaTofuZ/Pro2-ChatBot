#!/usr/bin/env perl
use strict;
use warnings;

use Pro2::ChatBot;
use utf8;
use Encode;

my @dataset = ("greeting\tじゃ～ん！プロちゃんの驚く顔が見たい野々原茜ちゃん登場ーっ！ね、驚いた？驚いた？茜みたいなダイヤの原石を前にしてビックリしちゃった？",
                "こんにちは\tプロちゃん元気ないね？茜ちゃんと一緒にプリン食べる？",
                "other\tそんなことよりプロちゃん、茜ちゃんをどうプロデュースするか考えてる？",
                "bye.\t茜ちゃん人形作って待ってるね！",
                );

my $count = 0;

my $bot  = Pro2::ChatBot->new(botname => "茜ちゃん",dataset => \@dataset);
$bot->greeting;

while (1){
    print encode_utf8("(入力待ち)");
    my $input = <STDIN>;
    chomp $input;

    $count++;

    my $reply = $bot->reply(decode_utf8($input));
    print encode_utf8("$reply\n");

    if ($input eq "bye."){
        last;
    }

}

print encode_utf8("今日はプロちゃんとたった${count}回しか話してないよ？\n");
