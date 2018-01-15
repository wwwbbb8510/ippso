#!/usr/bin/env bash
while getopts r: option;do
    case "${option}" in
    r) RUNS=${OPTARG};;
    esac
done

print_help(){
    printf "Parameter r(RUNS) is mandatory\n"
    printf "r values - number of runs"
    exit 1
}

if [ -z "${RUNS}" ];then
    print_help
fi

for i in `seq 1 ${RUNS}`;do
    bash run_all.sh -g 2 -i 200${i} -e 1
    bash run_all.sh -g 2 -i 200${i} -e 2
done