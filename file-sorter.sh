# file-sorter.sh
# Linux File Sorter By Vincent Tseng

#!/bin/bash

printf "\n-------------------------\n*** Linux File Sorter ***\n-------------------------\n\n"

# General types sort method
readonly images=(".jpg" ".jpeg" ".png" ".svg" ".gif" ".webp" ".heic")
readonly documents=(".pdf" ".txt" ".doc" ".docx")
readonly data=(".json" ".csv" ".xlsx")
readonly music=(".mp3" ".m4a" ".wav")
readonly videos=(".mp4" ".wmv" ".avi")
readonly programs=(".exe" ".sh")
readonly compressed=(".zip" ".rar")
readonly code=(".py" ".c" ".cpp" ".cs" ".java" ".js" ".ts" ".html" ".css" ".php" ".asm" ".rs" ".rb" ".lua" ".go" ".ex" ".exs")

exitProgram=0

while [ $exitProgram != 1 ]; do
	dirToSort=""
	absDirToSort=""

	# Loop for getting directory path
	while : ; do
		read -p "Enter a directory path to sort (or empty for current directory): " dirToSort

		if [ "$dirToSort" == "" ]; then
			dirToSort=$(pwd)
		fi

		absDirToSort=$(realpath $dirToSort)

		if [ -d $absDirToSort ]; then
			break

		else
			printf "Invalid directory path, please try again.\n\n"

		fi
	done

	printf "\nDirectory selected: $absDirToSort\n"
	ls -lhspX "$dirToSort"

	# Loop for choosing sort method
	while : ; do
		printf "\nHow do you want to sort these files?\n[1] By Extension\n[2] By General Type\n[3] Exit Program\n\n"
		read -p "Input your choice: " sortMethod

		if [ "$sortMethod" == "1" ]; then
                        printf "\n-------------------\n...Sorting Files...\n-------------------\n\n"

			for file in "$absDirToSort"/*; do
				if [ -d $file ]; then
					if [ ! -d $absDirToSort/folders ]; then
                                                mkdir $absDirToSort/folders
                                        fi

                                        mv $file $absDirToSort/folders

				else
					if [ ! -d $absDirToSort/"${file##*.}" ]; then
						mkdir $absDirToSort/"${file##*.}"
					fi

					mv $file $absDirToSort/"${file##*.}"
				fi
			done

			ls -lhspRX "$dirToSort"

                        printf "\nThe files at $absDirToSort have been successfully sorted!\n\n"

			break

		elif [ "$sortMethod" == "2" ]; then
			printf "\n-------------------\n...Sorting Files...\n-------------------\n\n"

			for file in "$absDirToSort"/*; do
				typeFound=0

				if [ -d $file ]; then
					if [ ! -d $absDirToSort/folders ]; then
						mkdir $absDirToSort/folders
					fi

					mv $file $absDirToSort/folders

					typeFound=1
				fi

				for generalType in images documents data music videos programs compressed code; do
					if [ $typeFound == 1 ]; then
                                                break
                                        fi

					typeVarName=${generalType}[@]

					for extension in ${!typeVarName}; do
						if [[ "$file" == *"$extension" ]]; then
	                                                if [ ! -d $absDirToSort/$generalType ]; then
	                                                        mkdir $absDirToSort/$generalType
	                                                fi

	                                                mv $file $absDirToSort/$generalType

							typeFound=1
							break
	                                        fi
					done
				done

				if [ $typeFound == 0 ]; then
					if [ ! -d $absDirToSort/misc ]; then
						mkdir $absDirToSort/misc
					fi

					mv $file $absDirToSort/misc
				fi
			done

			ls -lhspRX "$dirToSort"

			printf "\nThe files at $absDirToSort have been successfully sorted!\n\n"

			break

		elif [ "$sortMethod" == "3" ]; then
			break

		else
			printf "Invalid choice, please try again.\n"

		fi
	done

	# Exit program
	read -p "Exit program? (y/n): " exitProgram

	if [ "$exitProgram" == "n" ]; then
		exitProgram=0

	else
		exitProgram=1

	fi

	printf "\n"
done
