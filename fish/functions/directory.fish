# take creates a directory and changes to it
function take
  mkdir -p $argv[1] && cd $argv[1]
end


