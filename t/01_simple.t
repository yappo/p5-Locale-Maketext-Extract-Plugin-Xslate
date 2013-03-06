use strict;
use warnings;
use Test::More;

use File::Spec;
use Locale::Maketext::Extract;
use Locale::Maketext::Extract::Plugin::Xslate;

my $ext = Locale::Maketext::Extract->new(
    plugins => {
        xslate => {
            syntax     => 'TTerse',
            extensions => ['html'],
        },
    },
    warnings => 1,
    verbose  => 1,
);
$ext->extract_file( File::Spec->catfile(qw/ t data hello.html /) );
$ext->compile(1);

is_deeply [ sort $ext->msgids ], ['hello', 'nest1', 'nest2', 'nest3', 'term', 'values: %1 %2', 'word', 'xslate syntax'];

done_testing;
