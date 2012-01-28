#!/bin/bash

# Some functions
function usage {
    echo "USAGE: $0 <map>"
}

function availableMaps {
    indent="    "
    echo
    echo "Available Maps:"

    for i in $BASE_DIR/*/start_*.sh ; do
	echo "$indent$(basename $(dirname $i))"
    done

}

WD=$(pwd)

cd $(dirname $0)
BASE_DIR=$(pwd)

cd $WD

if [ -z "$1" ]; then
    echo "Argument missing."
    usage
    availableMaps
    exit 1
else
    # Check Map
    if  [ ! -d $BASE_DIR/$1 ] ||
	[ ! -f $BASE_DIR/$1/start_$1.sh ]
    then
	echo "Unknown map: $1"
	availableMaps
	exit 2
    fi
fi

# Here we go!
prefix=$1

VEC_DIR=$BASE_DIR/../datasets
MAP_DIR=$BASE_DIR/$prefix
somtoolbox=$BASE_DIR/../../somtoolbox.sh

echo "Starting $prefix map"

tv="-t $VEC_DIR/$prefix.tv"
vec="-v $VEC_DIR/$prefix.vec"
unit="-u $MAP_DIR/$prefix.unit"
wgt="-w $MAP_DIR/$prefix.wgt"

if  [ -f $MAP_DIR/$prefix.dwm ] ||
    [ -f $MAP_DIR/$prefix.dwm.gz ]
then
    dwm="--dw $MAP_DIR/$prefix.dwm"
fi

if [ -f $VEC_DIR/$prefix.cls ]; then
    cls="-c $VEC_DIR/$prefix.cls"
    else if [ -f $VEC_DIR/$prefix.clsinfo ]; then
        cls="-c $VEC_DIR/$prefix.clsinfo"
        else if [ -f $VEC_DIR/$prefix.clsinf ]; then
            cls="-c $VEC_DIR/$prefix.clsinf"
	    fi
    fi
fi

#echo $somtoolbox SOMViewer $vec $unit $wgt $tv $cls $dwm
$somtoolbox SOMViewer $vec $unit $wgt $tv $cls $dwm
