page=1
while : ; do
	response="$(echo | curl -H "Authorization: Bearer $GITHUB_TOKEN" -s "https://api.github.com/users/nalynsarte/repos?per_page=50&page=$page")"
	repos="$(jq -r '.[] | .html_url' <<< "$response")"
	for repo in $repos
	do
	if [[ "$repo" == *"Ignore"* ]]
	then
		continue
	fi

	git clone $repo.git >/dev/null 2>&1;
	code=$?;
	
	done
	page=$((page+1))
	len=${#response}
	if [ $len == 4 ]
	then
	break
	fi
done