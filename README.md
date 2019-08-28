# TarConv
TarConv Repository a Perl utility to convert Shell script to Perl script in Bulks.

It is the extension of sh2Perl, with cool unique options.

We have taken the sh2Perl into account for the conversion, our utility will take the following options:

Usage : 
		perl TarCon.pl -d {directory_path},
			       -f {file_name},
		         -a {if all the shell files in directory needs to be converted},
             -o {out directory where the converted files are stored},
			       -help {to get the Usage of the utility}

and convert the shell into the output directory. If no output directory is given. Script creates directory cOutDir in the current directory and place the converted in that directory.
