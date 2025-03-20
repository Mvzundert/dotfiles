function phptest
    set -l vendor_dir "vendor"

    # Check if vendor directory exists
    if not test -d $vendor_dir
        echo "Error: '$vendor_dir' directory not found. Is this a valid Laravel or Composer project?"
        return 1
    end

    # Check if PHPUnit, ParaTest, or Pest is installed
    set -l has_phpunit (test -f "$vendor_dir/bin/phpunit"; and echo true)
    set -l has_paratest (test -f "$vendor_dir/bin/paratest"; and echo true)
    set -l has_pest (test -f "$vendor_dir/bin/pest"; and echo true)

    # Run Pest if it's found
    if test "$has_pest" = "true"
        echo "Running Pest..."
        "$vendor_dir/bin/pest" $argv
    # Otherwise, run ParaTest if it's found
    else if test "$has_paratest" = "true"
        echo "Running ParaTest (parallel testing)..."
        "$vendor_dir/bin/paratest" $argv
    # Otherwise, run PHPUnit if it's found
    else if test "$has_phpunit" = "true"
        echo "Running PHPUnit..."
        "$vendor_dir/bin/phpunit" $argv
    else
        echo "Error: PHPUnit, ParaTest, or Pest not found in the vendor directory!"
        return 1
    end
end
