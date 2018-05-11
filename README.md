# NAME

Pod::Pandoc - process Plain Old Documentation format with Pandoc

# STATUS

[![Unix Build Status](https://travis-ci.org/nichtich/Pod-Pandoc.svg)](https://travis-ci.org/nichtich/Pod-Pandoc)
[![Windows Build status](https://ci.appveyor.com/api/projects/status/lfskwt20v0ofj5ix?svg=true)](https://ci.appveyor.com/project/nichtich/pod-pandoc)
[![Coverage Status](https://coveralls.io/repos/nichtich/Pod-Pandoc/badge.svg)](https://coveralls.io/r/nichtich/Pod-Pandoc)
[![Kwalitee Score](http://cpants.cpanauthors.org/dist/Pod-Pandoc.png)](http://cpants.cpanauthors.org/dist/Pod-Pandoc)
[![Code Climate Issue Count](https://codeclimate.com/github/nichtich/Pod-Pandoc/badges/issue_count.svg)](https://codeclimate.com/github/nichtich/Pod-Pandoc)
[![Documentation Status](https://readthedocs.org/projects/pod-pandoc/badge/?version=latest)](http://pod-pandoc.readthedocs.io/?badge=latest)

# DESCRIPTION

The Plain Old Documentation format (Pod) is a markup language used to document
Perl code (see [perlpod](https://metacpan.org/pod/perlpod) for reference). Several Perl modules exist to process
and convert Pod into other formats.

Pod::Pandoc is an attempt to unify and extend Pod converting based on the
[Pandoc](http://pandoc.org/) document converter. Pandoc supports more document
formats in a more detailled and uniform way than any set of Perl modules will
ever do. For this reason Pod::Pandoc provides methods to convert Pod to the
Pandoc document model for further processing with Pandoc.

# OUTLINE

- [pod2pandoc](https://metacpan.org/pod/pod2pandoc) is a command line script to convert Pod to any format supported
by Pandoc.
- [App::pod2pandoc](https://metacpan.org/pod/App::pod2pandoc) provides functionality of [pod2pandoc](https://metacpan.org/pod/pod2pandoc) to be used in Perl code.
- [Pod::Simple::Pandoc](https://metacpan.org/pod/Pod::Simple::Pandoc) converts Pod to the abstract document model of Pandoc.
- [Pod::Pandoc::Modules](https://metacpan.org/pod/Pod::Pandoc::Modules) manages a set of Pod documents of Perl modules.

# REQUIREMENTS

Installation of this module does not require Pandoc but it is needed to make
actual use of it. See [http://pandoc.org/installing.html](http://pandoc.org/installing.html) for installation.

# USAGE EXAMPLES

## Replace [pod2html](https://metacpan.org/pod/pod2html)

    # pod2html --infile=input.pm --css=style.css --title=TITLE > output.html
    pod2pandoc input.pm --css=style.css --toc --name -o output.html

Pandoc option `--toc` corresponds to pod2html option `--index` and is
disabled by default. pod2pandoc adds title and subtitle from NAME section.

## Replace [pod2markdown](https://metacpan.org/pod/pod2markdown)

    # pod2markdown input.pod
    pod2pandoc input.pod -t markdown

    # pod2markdown input.pod output.md
    pod2pandoc input.pod -o output.md

## GitHub wiki

The [GitHub wiki of this project](https://github.com/nichtich/Pod-Pandoc/wiki)
is automatically populated with its module documentation.  Wiki pages
are created with [pod2pandoc](https://metacpan.org/pod/pod2pandoc) as following (see script `update-wiki.sh`):

    pod2pandoc lib/ script/ wiki/ --ext md --index Home --wiki -t markdown_github

## Sphinx and Read The Docs

The [Sphinx documentation generator](https://sphinx-doc.org/) recommends
documents in reStructureText format. It further requires a configuration file
`conf.py` and some links need to be adjusted because Pandoc does not support
wikilinks in rst output format (see script `update-docs.sh`:

    pod2pandoc lib/ script/ docs/ --ext rst --wiki -t rst --standalone
    perl -pi -e 's!`([^`]+) <([^>]+)>`__!-e "docs/$2.rst" ? ":doc:`$1 <$2>`" : "`$1 <$2>`__"!e' docs/*.rst
    make -C docs html

The result is published automatically at
[http://pod-pandoc.rtfd.io/en/latest/Pod-Pandoc.html](http://pod-pandoc.rtfd.io/en/latest/Pod-Pandoc.html).

# SEE ALSO

This module is based on the wrapper module [Pandoc](https://metacpan.org/pod/Pandoc) to execute pandoc from Perl
and on the module [Pandoc::Elements](https://metacpan.org/pod/Pandoc::Elements) for pandoc document processing.

This module makes obsolete several specialized `Pod::Simple::...` modules such
as [Pod::Simple::HTML](https://metacpan.org/pod/Pod::Simple::HTML), [Pod::Simple::XHTML](https://metacpan.org/pod/Pod::Simple::XHTML), [Pod::Simple::LaTeX](https://metacpan.org/pod/Pod::Simple::LaTeX),
[Pod::Simple::RTF](https://metacpan.org/pod/Pod::Simple::RTF) [Pod::Simple::Text](https://metacpan.org/pod/Pod::Simple::Text), [Pod::Simple::Wiki](https://metacpan.org/pod/Pod::Simple::Wiki), [Pod::WordML](https://metacpan.org/pod/Pod::WordML),
[Pod::Perldoc::ToToc](https://metacpan.org/pod/Pod::Perldoc::ToToc) etc. It also covers batch conversion such as
[Pod::Simple::HTMLBatch](https://metacpan.org/pod/Pod::Simple::HTMLBatch), [Pod::ProjectDocs](https://metacpan.org/pod/Pod::ProjectDocs), [Pod::POM::Web](https://metacpan.org/pod/Pod::POM::Web), and
[Pod::HtmlTree](https://metacpan.org/pod/Pod::HtmlTree).

# AUTHOR

Jakob Voß <jakob.voss@gbv.de>

# CONTRIBUTORS

Benct Philip Jonsson

# COPYRIGHT AND LICENSE

Copyright 2017- Jakob Voß

GNU General Public License, Version 2
