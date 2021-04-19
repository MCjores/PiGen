#!/bin/bash

WORK_DIR=$HOME/configurator
STEPS_DIR=$WORK_DIR/steps
COMPLETED_DIR=$WORK_DIR/completed

mkdir -p "$WORK_DIR"
mkdir -p "$STEPS_DIR"
mkdir -p "$COMPLETED_DIR"

steps=`ls $STEPS_DIR/*.sh`

echo "Starting running steps"
for script_file in $steps
do
	step_name=$(basename "${script_file%.*}")
	echo "Step $sname"
	if [[ -e $COMPLETED_DIR/$step_name ]]; then
		echo "Step $step_name already done"
		echo "Go to the next step"
	else
		echo "Starting script $script_file"
		("$script_file")
		if [[ $? -eq 0 ]]; then
			echo "Step complete succefully"
			touch $COMPLETED_DIR/$step_name
		else
			echo "Couldn't finish step"
		fi
	fi
done

echo "Configurator are finished"