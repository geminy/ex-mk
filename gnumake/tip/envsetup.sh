# function name format: [a-z_]+
function help() {
cat <<EOF
Invoke ". envsetup.sh from your shell to make a basic environment setup."
EOF

	T=$(gettop)
	local A=() C=0
	for i in `cat $T/envsetup.sh | sed -n "/^[[:blank:]]*function /s/function \([a-z_]*\).*/\1/p" | sort | uniq`; do
		A=(${A[@]} $i)
		C=$((C+1))
	done

	echo "There are $C functions here:"
	C=1
	for func in ${A[@]}
	do
		echo "	$C. $func"
		C=$((C+1))
	done
	echo
}

function set_stuff_for_environment()
{
	export TOPDIR=$(gettop)
	export SRC_DIR="$TOPDIR/src"
	export OUT_DIR="$TOPDIR/out"
}

# Tab completion for lunch, just a test.
LUNCH_MENU_CHOICES=(debug release)
function lunch()
{
	set_stuff_for_environment	
}

function _lunch()
{
	local cur="${COMP_WORDS[COMP_CWORD]}"
	COMPREPLY=($(compgen -W "${LUNCH_MENU_CHOICES[*]}" -- ${cur}))
    return 0
}
complete -F _lunch lunch

# TODO
# too simple here
function gettop
{
	echo `pwd`
}

function get_make_command()
{
  echo command make
}

function make()
{
    local start_time=$(date +"%s")
    $(get_make_command) "$@"
    local ret=$?
    local end_time=$(date +"%s")
    local tdiff=$(($end_time-$start_time))
    local hours=$(($tdiff / 3600 ))
    local mins=$((($tdiff % 3600) / 60))
    local secs=$(($tdiff % 60))
    local ncolors=$(tput colors 2>/dev/null)
    if [ -n "$ncolors" ] && [ $ncolors -ge 8 ]; then
        color_failed=$'\E'"[0;31m"
        color_success=$'\E'"[0;32m"
        color_reset=$'\E'"[00m"
    else
        color_failed=""
        color_success=""
        color_reset=""
    fi
    echo
    if [ $ret -eq 0 ] ; then
        echo -n "${color_success}#### make completed successfully "
    else
        echo -n "${color_failed}#### make failed to build some targets "
    fi
    if [ $hours -gt 0 ] ; then
        printf "(%02g:%02g:%02g (hh:mm:ss))" $hours $mins $secs
    elif [ $mins -gt 0 ] ; then
        printf "(%02g:%02g (mm:ss))" $mins $secs
    elif [ $secs -gt 0 ] ; then
        printf "(%s seconds)" $secs
    fi
    echo " ####${color_reset}"
    echo
    return $ret
}
