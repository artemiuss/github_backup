scriptname=$(basename "$0")

usage() {
  echo "Usage: $scriptname <GITHUB_USER> <OUTPUT_PATH>"
  echo "All argument values MUST be supplied:"
  echo "  <GITHUB_USER> - GitHub user name"
  echo "  <OUTPUT_PATH> - Output directory path"
  exit 1;
}

# Check arguments. If the arguments are not provided then show Usage Notes
NUMARGS=$#
[ $NUMARGS -lt 2 ] && usage
# Get config ath from the first argument
USER=$1
OUTPUT_PATH=$2

# get jq
curl -L -o /usr/bin/jq.exe https://github.com/stedolan/jq/releases/latest/download/jq-win64.exe

cd "${OUTPUT_PATH}"
mkdir "${USER}"
cd "${USER}"
curl -s "https://api.github.com/users/${USER}/repos" | jq '.[]|.html_url' -r > repo_list.txt

PREFIX="https://github.com/${USER}/"

while read p; do
  REPO_URL="$p"
  REPO_NAME=$(echo "${REPO_URL}" | awk -F "${PREFIX}" '{print $2}')
  rm -f -r "${REPO_NAME}"
  git clone "${REPO_URL}"
  echo -e "\n"
done <repo_list.txt