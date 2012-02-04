use inc::Module::Install;
name 'FormValidator-Lite-Constraint-JapaneseMore';
all_from 'lib/FormValidator/Lite/Constraint/JapaneseMore.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
