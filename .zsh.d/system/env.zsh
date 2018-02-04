# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]] ; then
  export EDITOR='EMACS'
fi

if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi
