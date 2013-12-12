#!/usr/bin/perl -w

my $sys_vim_path=`which -a vim | grep -v $ENV{'HOME'}/bin | head -n 1`;

chomp $sys_vim_path;

sub HasLineOfFile
{
	my($file, $checkline) = @_;
	my $realline = `wc -l $file | cut -d' ' -f1`;

	if ( $realline < $checkline ){
		return 0;
	} else {
		return 1;
	}
}

if ($#ARGV == 0 && !-e $ARGV[0] && $ARGV[0] =~ /(.*):(\d+):?$/ && -e $1 && HasLineOfFile($1, $2)){
	exec("$sys_vim_path $1 +$2");
}
else{
	exec($sys_vim_path, @ARGV);
}
