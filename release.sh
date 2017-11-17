
# semantic version tag as argument, MUST match /v\d+\.\d+\.\d+/ and MUST be at least
# one minor increment above the current highest git tag version.
TAGVERSION=$1
if [ -z "$1" ]; then 
	echo "Need varsion tag as argument. Must match /v\d+\.\d+\.\d+/"
	exit 0;
fi

# set tag as travis environment variable
travis env set TRAVIS_TAG v$TAGVERSION

# make git tag and push
git tag -a v$TAGVERSION -m "Release v$TAGVERSION"
git push --tags

# unset environment variable
travis env unset TRAVIS_TAG
