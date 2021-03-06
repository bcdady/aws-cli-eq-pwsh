#!/bin/bash

# utils
echo_info () {
    echo -e "\e[32m$1\e[m"
}
echo_error () {
    echo -e "\e[31m$1\e[m" >&2
}

# 
export_path="./temp"
# exclude help
subcommands=$(aws help | col -b | sed -n '/AVAILABLE SERVICES/,/SEE ALSO/p' | grep 'o ' | sed s/'o '//g | tr -d ' ' | sed -e /help/d | sort)
cliversion=$(aws --version 2>&1 | awk '{print $1}' | awk -F'/' '{print $2}')

# output metadata
echo $cliversion > "$export_path/_cli.version.cfg"
echo -n > "$export_path/_cli.metadata.cfg"
for c in $subcommands
do
    echo $c >> "$export_path/_cli.metadata.cfg"
done
# output each subcommands of subcommand
for c in $subcommands
do
    # excluce wait, help, space
    echo_info "$c..."
    eval "aws $c dummy_error_command" 2>&1 | tail -n +9 | awk -F'|' '{printf "%s\n%s\n",$1,$2}' | tr -d ' ' | sed -e /wait/d -e /help/d -e /^$/d | sort | \
        awk -v "v1=$c" '{printf "aws %s %s\n",v1,$0}'  >  "$export_path/$c.txt"
done