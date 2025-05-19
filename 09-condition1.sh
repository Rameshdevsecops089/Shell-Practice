#!/bin/bash

NUMBER=$1

if [$NUMBER -lt 20]
then 
    echo "given number $NUMBER is less than 20"
else
    echo "given number $NUMBER is not less than 20"
fi
