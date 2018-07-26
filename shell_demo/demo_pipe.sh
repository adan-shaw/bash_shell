#!/usr/bin/perl -W
use strict;
use warnings;
use Socket;

$SIG{CHLD} = "IGNORE";

$| = 1;
pipe RD, WR;
my $pid = fork();
if($pid == 0){
    close WR;
    while(my $cmd = <RD>){
            warn $cmd;
    }
}elsif(defined $pid){
    close RD;
    sleep(1);
    for (1 ... 3){
            print WR "TEST\n";
    }
    die "GGGGGGGG";
}else{
    die "fork error : $!";
}

