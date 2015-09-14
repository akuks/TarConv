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

	if(-d $outDir){
		print "$outDir Exist \n";
	}
	else{
		print "$outDir directory doesn't exist\n";
		print "Creating $outDir...\n";
		createOutDir($outDir);
	}
}

## Read All the files from the Input Dir

if(defined $dir){
	opendir(DIR, $dir) or die "Can't open $dir directory $!\n";
	
	my @shellFile = grep(/\.sh$/, readdir(DIR));

	foreach my $sFile (@shellFile){
		fileConverter($sFile);
	}

	close(DIR);
}

if(defined $file){

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

sub createOutDir {
	my $outDir = shift;

	mkdir $outDir or die "Error Creating Directory : $outDir $!";
	print "Directory Created \n";
}

sub fileConverter {
	my $sFile = shift;

	print "Shell File Name : ", $sFile, "\n";

	open (my $sFH, '<', $dir.'/'.$sFile) or die "Can't Open $sFile $! \n";

	my @sFileContent = <$sFH>;

	my ($pFile ) = split(/\./, $sFile);

	print "Perl File Name : ", $pFile.'.pl', "\n";

	open (my $pFH, '>', $outDir.'/'.$pFile.'.pl') or die "Can't open $pFile.pl\n";

	print $pFH "#!/usr/bin/perl\n\n";

	print $pFH 'exec \'/bin/sh\', \'-c\', <<\'TarConv\', $0, @ARGV', "\n\n";
	print $pFH @sFileContent;
	print $pFH "TarConv\n";
 
}

