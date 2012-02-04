use strict;
use warnings;
use utf8;
use Test::Base;
use FormValidator::Lite qw/JapaneseMore/;
use CGI;

plan tests => 1 * 5;

filters {
    query    => [qw/eval/],
    rule     => [qw/eval/],
    expected => [qw/eval/],
};

run {
    my $block = shift;
    my $q = CGI->new($block->query);

    my $v = FormValidator::Lite->new($q);
    $v->check(
        $block->rule
    );

    my @expected = $block->expected;
    while (my ($key, $val) = splice(@expected, 0, 2)) {
        is($v->is_error($key), $val, $block->name);
    }
};


__END__

=== KANJI 
--- query: { kanji => '漢字',  hoge => 'ひらがなひらがな', fuga => 'カタカナ', haga => 'asciii', hoga => 'ひらがなと  すぺえす'}
--- rule
(
    kanji => [qw/KANJI/],
    hoge => [qw/KANJI/],
    fuga => [qw/KANJI/],
    hoga => [qw/KANJI/],
    haga => [qw/KANJI/],
);
--- expected
(
    kanji => 0,
    hoge => 1,
    fuga => 1,
    hoga => 1,
    haga => 1,
)

=== KIGOU 
--- query: { kigou => '。、〆〒',  hoge => 'ひらがなひらがな', fuga => 'カタカナ', haga => 'asciii', hoga => 'ひらがなと  すぺえす'}
--- rule
(
    kigou => [qw/KIGOU/],
    hoge => [qw/KIGOU/],
    fuga => [qw/KIGOU/],
    hoga => [qw/KIGOU/],
    haga => [qw/KIGOU/],
);
--- expected
(
    kigou => 0,
    hoge => 1,
    fuga => 1,
    hoga => 1,
    haga => 1,
)
