---
name: Bug report
about: Create a report to help us improve
title: "[BUG / Error]"
labels: ''
assignees: ''

---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.


**Additional context**
Add any other context about the problem here.

**Pterodactyl error log **
tail -n 1000 /var/www/pterodactyl/storage/logs/laravel-$(date +%F).log | grep "\[$(date +%Y)"
