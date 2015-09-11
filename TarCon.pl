#!/usr/bin/perl

use strict;
use warnings;

#############################################
#                                           #
# This Utility is the extension of sh2Perl  #
# It will also take a directory containg    #
# Shell scripts.                            #
#                                           #
# This Utility will convert it to the Perl  #
#                                           #
#  Version : 1.0                            #
#  Author  : Ashutosh Kukreti               #
#  Mail ID : kukreti.ashutosh@gmail.com     #
#                                           #
#############################################

use Getopt::Long;

my ($dir, $file, $all, $outDir, $outFile, $help);

GetOptions(
		'd=s' => \$dir,
		'f=s' => \$file,
		'a=s' => \$all,
		'o=s' => \$outDir,
		'help' => \$help
	);

if(defined $help){
	usage();
}

if(!defined $dir && !defined $file){
	usage();
}

if(!defined $outDir){
	$outDir = "cOutDir";
	print "Output Directory : ", $outDir, "\n";
}

sub usage{
	print "Usage : 
		perl TarCon.pl -d {directory_path},
			       -f {file_name},
		               -a {if all the shell files in directory needs to be converted},
                               -o {out directory where the converted files are stored},
			       -help {to get the Usage of the utility}
		\n"; 
exit;
}



