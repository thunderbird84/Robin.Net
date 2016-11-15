#!/bin/sh
CURRENT=`pwd`
BASENAME=`basename "$CURRENT"`
SCRIPT_PATH=`dirname "$0"`; SCRIPT_PATH=`eval "cd \"$SCRIPT_PATH\" && pwd"`
WIN_PATH=BASENAME


args=$@
OS="`uname`"
case $OS in
  'Linux')
    OS='Linux'
    alias ls='ls --color=auto'
    ;;
  'FreeBSD')
    OS='FreeBSD'
    alias ls='ls -G'
    ;;
  'WindowsNT')
    OS='Windows'
    ;;
   'CYGWIN_NT-6.3')
	OS='Windows'
	WIN_PATH= `cygpath -wa ${SCRIPT_PATH}`
    ;;
   'MINGW32_NT-6.2')
	OS='Windows'
	$CYGPATH -w ${SCRIPT_PATH}
    ;;
  'Darwin') 
    OS='Mac'
    ;;
  'SunOS')
    OS='Solaris'
    ;;
  'AIX') ;;
  *) ;;
esac

if [ $OS == 'Windows' ]
then   
   echo $WIN_PATH cmd "/c  /D \"$pwd\"" robin.cmd  $args"
   echo cmd "/c  /D \"$WIN_PATH\"" robin.cmd  $args"
else
	echo $OS
	echo You may not go to the party.
fi