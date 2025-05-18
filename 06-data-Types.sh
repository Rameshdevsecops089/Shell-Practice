#!/bin/bash

Timestamp = $(date)
echo "script execute at: $Timestamp"

number1=100
number2=200

sum=$(($number1+$number2))
sub=$(($number1*$number2))
echo "sum of $number1 and $number2 is:: $sum"

echo "substrction of $number1 and $number2 is :: $sub"

