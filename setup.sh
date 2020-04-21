#!/bin/bash
ls websockets/config/v3/**/{receive,send}.json | perl -lpe'my $base = s{^websockets/config/v3/}{}r; my $target = "lib/basic_api/generated/" . ($base =~ s{/}{_}r); symlink "../../../$_" => $target or die "no luck with symlink on $_ - $!" unless -r $target'
ls websockets/config/v3 | perl -lne'print qq{export "${_}_receive.dart";\nexport "${_}_send.dart";}' > lib/basic_api/generated/api.dart
