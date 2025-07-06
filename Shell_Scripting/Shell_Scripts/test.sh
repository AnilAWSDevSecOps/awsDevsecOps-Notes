<<COMMANDS

$ word=TELUGU
$ echo $word
TELUGU
$ echo ${word[@]}
TELUGU
$ echo ${word[@]:0:1}
T
$ echo ${word[@]:0:2}
TE
$ echo ${word[@]:0:3}
TEL
$ echo ${word[@]:0:4}
TELU
$ echo ${word[@]:0:5}
TELUG
$ echo ${word[@]:0:6}
TELUGU
$ echo ${#word}
6
$ for (( i=0; i<=10; i++ ))
> do
> echo $i
> done
0
1
2
3
4
5
6
7
8
9
10
$ for (( i=0; i<=10; i++ )); do echo $i; done
0
1
2
3
4
5
6
7
8
9
10

$ echo $word
TELUGU
$ for (( i=0; i<=6; i++ )); do echo ${word[@]:0:$i}; done

T
TE
TEL
TELU
TELUG
TELUGU
$ for (( i=0; i<=6; i++ )); do echo ${word[@]:$i:1}; done
T
E
L
U
G
U

$ for (( i=0; i<=5; i++ )); do echo ${word[@]:$i:1}; done
T
E
L
U
G
U

$ WORD='MADAM'
$ WORD_LEN=${#WORD}
$ LENGTH=$(expr $WORD_LEN - 1)
$ for ((i = $LENGTH; i >= 0; i--))
> do
> echo ${WORD[@]:$i:1}
> done
M
A
D
A
M


$ WORD='MADAMANIL'
$ WORD_LEN=${#WORD}
$ LENGTH=$(expr $WORD_LEN - 1)
$ REVERSE=' '
$ for ((i = $LENGTH; i >= 0; i--)); do REVERSE=${REVERSE}${WORD[@]:$i:1}; done
$ echo $REVERSE
LINAMADAM

COMMANDS
