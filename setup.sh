#!/bin/bash
ls websockets/config/v3/**/{receive,send}.json | perl -lpe'my $base = s{^websockets/config/v3/}{}r; my $target = "lib/api/" . ($base =~ s{/}{_}r); symlink "../../$_" => $target or die "no luck with symlink on $_ - $!" unless -r $target'
