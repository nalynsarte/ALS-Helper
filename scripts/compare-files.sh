# Scenario: You have one folder that contain files and another folder that contain files
# Output: Display filenames of the file that does not exists on the other folder

for file1 in folder001/*; do
	for file2 in folder002/*; do
		if [[ "$(basename "$file1")" != "$(basename "$file2")" ]]; then
			echo "$(basename "$file1")"
		fi
	done
done
