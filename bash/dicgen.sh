#!/bin/bash
# brute force dictonary generator in bash <sin@technophage.net>

bf_mnlen=1
bf_mxlen=3
bf_dictchrs="a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9"

otherFunc(){

        printf "%s\n" $1
}

bf(){
        for c in $bf_dictchrs ; do

                nc=$[$nc+1]
                ch[$nc]=$c
        done
        for x in `seq 1 $[$bf_mxlen+1]` ; do

                if [ $bf_mnlen -ge $x ] ; then
                        ci[$x]=1
                else
                        ci[$x]=0
                fi
        done
        for clen in `seq $bf_mnlen $bf_mxlen` ; do
                while [ ${ci[$[$clen+1]]} -ne 1 ] ; do
                        wrd=""
                        for x in `seq $clen -1 1` ; do
                                wrd=$wrd${ch[${ci[$x]}]}
                        done

                        # do something with the word..
                        otherFunc $wrd

                        ci[1]=$[${ci[1]}+1]
                        for x in `seq 1 $clen`; do
                                if [ ${ci[$x]} -gt $nc ] ; then
                                        ci[$x]=1
                                        ci[$[$x+1]]=$[${ci[$[$x+1]]}+1]
                                fi
                        done
                done
        done
}

bf
# @=X 
