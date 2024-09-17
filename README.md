# Linux File Sorter
**By Vincent Tseng [(VincentTsengCA)](https://github.com/VincentTsengCA)**

## Contents
- [Description](#description)
- [Download Instructions](#download-instructions)
- [Usage Instructions](#usage-instructions)

## Description
A simple file sorter for Linux that organizes the files of a specified directory into separate folders. Files can be sorted either by extension or general type (e.g. images, documents).

## Download Instructions
To download this program, perform a git clone:
```
git clone https://github.com/VincentTsengCA/linux-file-sorter.git
```

The actual program is located in the [file-sorter.sh](file-sorter.sh) file.

## Usage Instructions
In a terminal, enter this command to run the program:
```
bash file-sorter.sh
```

> Note: If [file-sorter.sh](file-sorter.sh) is not in your current working directory, you will have to cd into the folder that contains it.

You will be prompted to enter the directory path (relative to the current directory) you want to sort.

Then, enter the way you want your files to be sorted:
- \[1\] By Extension
- \[2\] By General Type

After the sorting finishes, your files will be organized into multiple new folders.

You will also be prompted to exit the program (y/n).

To check your new sorted directory, you can run a command like this:
```
ls -lR
```
