#!/bin/bash

echo "Text File Concatenator"



# Display help info
if [ "$1" = "-h" ]; then
    echo "Usage: bash ./text_file_concat.sh <output_file> <input_file1> [<input_file2> ... <input_fileN>]"
    echo "Combines multiple text files into one output file."
    exit 0
fi

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Error: Not enough arguments."
    echo "Use -h for help."
    exit 1
fi
#Get output file name
output_file="$1"
shift


# check that all in files are .txt files
for file in "$@"; do
    if 
    [[ ! "$file" =~ \.txt$ ]]; then
        echo "Error: $file is not a .txt file."
        exit 1
    fi

    if 
    [[ ! -f "$file" ]]; then
        echo "Error: $file does not exist."
         exit 1
    fi

done


# Combine the files into an output file
cat "$@" > "$output_file"
echo "Files have been concatenated into $output_file"



