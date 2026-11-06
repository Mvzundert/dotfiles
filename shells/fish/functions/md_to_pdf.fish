function md_to_pdf --description "Convert a Markdown file to PDF using pandoc and xelatex"
    # Check if correct number of arguments are provided
    if test (count $argv) -ne 2
        echo "Usage: md_to_pdf <input_markdown_file> <output_pdf_file>"
        return 1
    end

    # Check for pandoc
    if not command -q pandoc
        echo "Error: pandoc is required but not installed." >&2
        return 1
    end

    # Perform the pandoc conversion
    pandoc "$argv[1]" -o "$argv[2]" --pdf-engine=xelatex -V geometry:"margin=1in"
    echo "Converted $argv[1] to $argv[2]"
end
