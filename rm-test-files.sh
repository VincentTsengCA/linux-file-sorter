# rm-test-files.sh
# Linux File Sorter By Vincent Tseng

#!/bin/bash

if [ -d "test-files" ]; then
	rm test-files/egg1.txt
	rm test-files/egg2.txt
	rm test-files/egg3.txt
	rm test-files/hello-world.txt

	rm test-files/egg1.json
	rm test-files/egg-data.json

	rm test-files/egg1.jpg
	rm test-files/egg2.jpg

	rm test-files/egg1.png
	rm test-files/egg2.png

	rmdir test-files/egg1
	rmdir test-files/egg2

	rmdir test-files
else
	echo "test-files have not been made."
fi
