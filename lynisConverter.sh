#!/bin/bash

echo "Welcome to Plug and Play Audit System"

# converter package required 
git clone https://github.com/d4t4king/lynis-report-converter.git
cd lynis-report-converter


# Dependencies for converting raw data to pdf 

apt -y install htmldoc libxml-writer-perl libarchive-zip-perl libjson-perl
pushd /tmp/
wget http://search.cpan.org/CPAN/authors/id/M/MF/MFRANKL/HTML-HTMLDoc-0.10.tar.gz
tar xvf HTML-HTMLDoc-0.10.tar.gz
pushd HTML-HTMLDoc-0.10
perl Makefile.PL
make && make install
popd
wget http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/Excel-Writer-XLSX-0.95.tar.gz
tar xvf Excel-Writer-XLSX-0.95.tar.gz
pushd Excel-Writer-XLSX-0.95
perl Makefile.PL
make && make install
popd
popd

# Execution command
# use can specify where the file should be output to a particular location...
./lynis-report-converter.pl -j -o json_report.json
./lynis-report-converter.pl -p -o report.pdf

exit 0
