#!/bin/sh

# use external JAXB installation...
if [ -n "$JAXB_HOME" ]
then
	echo "No JAXB_HOME variable defined..."
	exit 1
fi

# local variables
xjc_dir=$JAXB_HOME/lib
xjc_jar=$xjc_dir/jaxb-xjc.jar

# location where our plugin(s) are to be found
xjc_cp=lib/*

java -Djava.endorsed.dirs=$xjc_dir -jar $xjc_jar -cp $xjc_cp -extension -Xinherit $@
