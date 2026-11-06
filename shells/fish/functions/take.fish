# take creates a directory and changes to it
function take --description "Create a directory and change into it"
  mkdir -p $argv[1] && cd $argv[1]
end
