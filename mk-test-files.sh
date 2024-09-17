# mk-test-files.sh
# Linux File Sorter By Vincent Tseng

#!/bin/bash

if [ ! -d "test-files" ]; then
	mkdir test-files

	touch test-files/egg1.txt
	touch test-files/egg2.txt
	touch test-files/egg3.txt
	touch test-files/hello-world.txt

	touch test-files/egg1.json
	touch test-files/egg-data.json

	touch test-files/egg1.jpg
	touch test-files/egg2.jpg

	touch test-files/egg1.png
	touch test-files/egg2.png

	mkdir test-files/egg1
	mkdir test-files/egg2
else
	echo "test-files already exist."
fi
