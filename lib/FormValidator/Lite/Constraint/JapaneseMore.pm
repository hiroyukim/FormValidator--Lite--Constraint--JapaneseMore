package FormValidator::Lite::Constraint::JapaneseMore;
use strict;
use warnings;
our $VERSION = '0.01';
use FormValidator::Lite::Constraint;

rule 'KIGOU' => sub { delsp($_) =~ /^\p{CJKSymbolsAndPunctuation}+$/  };
rule 'KANJI' => sub { delsp($_) =~ /^\p{CJKUnifiedIdeographs}+$/      };

1;
__END__

=head1 NAME

FormValidator::Lite::Constraint::Japanese - constraints for Japanese

=head1 CONSTRAINTS

=over 4

=item KIGOU 

Check valid KIGOU or not.

=item KANJI 

Check valid KANJI or not.

=back

=head1 AUTHOR

yamanaka hiroyuki E<lt>default {at} example.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
