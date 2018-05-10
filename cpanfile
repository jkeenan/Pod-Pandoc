requires 'perl', '5.014';

# core modules
requires 'Pod::Simple', '3.08';
requires 'Pod::Usage';
requires 'Getopt::Long';

# additional modules
requires 'Pandoc', '0.6.0';
requires 'Pandoc::Elements', '0.33';
requires 'IPC::Run3'; # already implied by Pandoc

on test => sub {
    requires 'Test::More', '0.96';
    requires 'Test::Output';
    requires 'Capture::Tiny';
    requires 'Test::Exception';
};
