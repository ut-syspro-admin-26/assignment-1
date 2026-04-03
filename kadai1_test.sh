#!/bin/bash
# Test code for syspro2024 kadai1
# Written by Shinichi Awamoto
# Edited by Momoko Shiraishi, Guojun Wu

state=0
warn() { echo $1; state=1; }
dir=$(mktemp -d)
trap "rm -rf $dir" 0

kadai-a() {
    if [ -d kadai-a ]; then
        cp -r kadai-a $dir
        pushd $dir/kadai-a > /dev/null 2>&1

        if [ ! -f Makefile ]; then
            warn "kadai-a: missing Makefile."
        fi

        make kadai-a 2>&1 | grep -i "warning" > /dev/null
        if [ $? -eq 0 ]; then
            warn "kadai-a: '$ make kadai-a' produced warnings."
        fi

        if [ ! -f kadai-a ]; then
            warn "kadai-a: Failed to generate the binary(kadai-a) with '$ make kadai-a'"
        fi

        make clean > /dev/null 2>&1

        if [ -f kadai-a ]; then
            warn "kadai-a: Failed to remove the binary(kadai-a) with '$ make clean'."
        fi

        if [ ! -z "`find . -name \*.o`" ]; then
            warn "kadai-a: Failed to remove object files(*.o) with '$ make clean'."
        fi

        if [ `grep '\-Wall' Makefile | wc -l` -eq 0 ]; then
            warn "kadai-a: Missing '-Wall' option."
        fi

        popd > /dev/null 2>&1
    else
        warn "kadai-a: No 'kadai-a' directory!"
    fi
}

kadai-b() {
    if [ -d kadai-b ]; then
        cp -r kadai-b $dir
        pushd $dir/kadai-b > /dev/null 2>&1

        if [ ! -f sort.sh ]; then
            warn "kadai-b: Missing 'sort.sh'."
        fi

        ./sort.sh > /dev/null 2>&1

        if [ ! -f result.txt ]; then
            warn "kadai-b: Failed to generate 'result.txt' with '$ ./sort.sh'."
        elif [ `cat result.txt | wc -l` -eq 0 ]; then
            warn "kadai-b: 'result.txt' is empty!"
        else
            while read line; do
                if echo $line | grep -q " "; then
                    warn "kadai-b: the number of lines seems to be included."
                    break
                fi
            done < result.txt
        fi

        popd > /dev/null 2>&1
    else
        warn "kadai-b: No 'kadai-b' directory!"
    fi
}

kadai-c() {
    if [ -d kadai-c ]; then
        cp -r kadai-c $dir
        pushd $dir/kadai-c > /dev/null 2>&1

        if [ ! -f convert.sh ]; then
            warn "kadai-c: Missing 'convert.sh'."
        fi

        ./convert.sh > /dev/null 2>&1

        if [ ! -z "`find . -name \*.cpp`" ]; then
            warn "kadai-c: Did you convert *.cpp to *.cc?"
        else
            if [ `grep 'NEET the 3rd' *.cc | wc -l` -ne 0 ]; then
                warn "kadai-c: Did you replace 'NEET the 3rd' to your name?"
            fi
            if [ `grep 'neet3@example.com' *.cc | wc -l` -ne 0 ]; then
                warn "kadai-c: Did you replace 'neet3@example.com' to your email address?"
            fi
            if [ `grep " $" *.cc | wc -l` -ne 0 ]; then
                warn "kadai-c: Did you remove all trailing whitespaces?"
            fi
        fi

        popd > /dev/null 2>&1
    else
        warn "kadai-c: No 'kadai-c' directory!"
    fi
}

kadai-d() {
    if [ -d kadai-d ]; then
        cp -r kadai-d $dir
        pushd $dir/kadai-d > /dev/null 2>&1

        if [ ! -f output.sh ]; then
            warn "kadai-d: Missing 'output.sh'."
        fi

        ./output.sh > /dev/null 2>&1

        if [ ! -f cat.txt ]; then
            warn "kadai-d: Failed to generate 'cat.txt' with '$ ./output.sh'."
        fi

        if [ ! -f strace.txt ]; then
            warn "kadai-d: Failed to generate 'strace.txt' with '$ ./output.sh'."
        fi

        if [ ! -f all.txt ]; then
            warn "kadai-d: Failed to generate 'all.txt' with '$ ./output.sh'."
        fi

        popd > /dev/null 2>&1
    else
        warn "kadai-d: No 'kadai-d' directory!"
    fi
}

kadai-e() {
    if [ -d kadai-e ]; then
        cp -r kadai-e $dir
        pushd $dir/kadai-e > /dev/null 2>&1

        popd > /dev/null 2>&1
    else
        warn "kadai-e: No 'kadai-e' directory!"
    fi
}

if [ $# -eq 0 ]; then
    echo "#############################################"
    echo "Running tests..."
fi
for arg in {a..e}; do
    if [ $# -eq 0 ] || [[ "$@" == *"$arg"* ]]; then kadai-$arg; fi
done
if [ $# -eq 0 ]; then
    if [ $state -eq 0 ]; then echo "All tests have passed!"; fi
    echo "#############################################"
fi
exit $state
