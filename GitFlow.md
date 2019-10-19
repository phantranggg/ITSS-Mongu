Git Flow

# Init
1. Fork upstream repository: https://github.com/phantranggg/ITSS-Mongu
2. Clone forked repository to local environment
```
git clone https://github.com/{yourName}/ITSS-Mongu.git
```
3. Add upstream remote
```
git remote add upstream https://github.com/phantranggg/ITSS-Mongu
```
3.1. Check current remote
```
git remote -v
```

# Workflow
4. Pull latest changes from upstream
```
git pull upstream develop
```
5. Create new branch for current task
```
git checkout -b {taskNumber}_your_task_name
```
6. Code, then push to origin repository
```
git push origin head
```
7. Create merge request to upstream repository (develop branch)