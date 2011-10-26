use inc::Module::Install;

name     'Digest-Mock-Size';
all_from 'lib/Digest/Mock/Size.pm';
author   q{Jason M Mills <jmmills@cpan.org>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

