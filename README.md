# github_backup
Backup github repositories

## Usage notes
```github_backup.sh <GITHUB_USER> <OUTPUT_PATH>```

Where:
- <GITHUB_USER> - GitHub user name
- <OUTPUT_PATH> - Output directory path

### Execute Bash Script (Using Git Bash) from Windows Task Scheduler

```
cmd /c ""C:\Program Files\Git\bin\bash.exe" --login -i -- "<PATH_TO_SCRIPT>" <GITHUB_USER> <OUTPUT_PATH>"
```
