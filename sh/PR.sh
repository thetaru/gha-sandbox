#!/bin/bash

# PR対象のブランチ名を指定する
BRANCH="develop"

# ブランチが存在しなければ作成し、チェックアウトする
git checkout "${BRANCH}" 2>/dev/null || git checkout -b "${BRANCH}"

# 現在のブランチ名を表示する
git branch --show-current

# 空コミットを作成する
git commit --allow-empty -m "$(date +%Y/%m/%d-%H:%M:%S) empty commit"

# 空コミットをプッシュする
git push --set-upstream origin "${BRANCH}"

# プルリクエストを作成する
gh pr create --base main --head "${BRANCH}" --title "PR $(date +%Y/%m/%d-%H:%M:%S)" --body "PR $(date +%Y/%m/%d-%H:%M:%S)"

# ブランチをmainに切り替える
git checkout main