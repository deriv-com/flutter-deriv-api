#!/bin/bash

# symlink files from submodule to lib/basic_api/generated
ls bom-core/binary-websocket-api/config/v3/**/{receive,send}.json | perl -lpe'my $base = s{^bom-core/binary-websocket-api/config/v3/}{}r; my $target = "lib/basic_api/generated/" . ($base =~ s{/}{_}r); symlink "../../../$_" => $target or die "no luck with symlink on $_ - $!" unless -r $target'

# copy manually added json files to lib/basic_api/generated if not already there
# cp -n lib/basic_api/manually/*.json lib/basic_api/generated

# generates lib/basic_api/generated/api.dart
ls lib/basic_api/generated | egrep '\.json$' | perl -lne'print qq{export "$_.dart";}' > lib/basic_api/generated/api.dart
perl -pi -e 's/.json//g' lib/basic_api/generated/api.dart
