function md_to_pdf
    # Check if correct number of arguments are provided
    if test (count $argv) -ne 2
        echo "Usage: md_to_pdf <input_markdown_file> <output_pdf_file>"
        return 1
    end

    # Perform the pandoc conversion
    pandoc $argv[1] -o $argv[2] --pdf-engine=xelatex -s
    echo "Converted $argv[1] to $argv[2]"
end
