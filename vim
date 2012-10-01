#!/usr/bin/perl

if ($#ARGV == 0 && $ARGV[0] =~ /(.*):(\d+):?$/){
	exec("/usr/bin/vim $1 +$2");
}
else{
	exec ("/usr/bin/vim", @ARGV);
}
