#!/bin/zsh

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"

VAULT_NOTES="/Users/claylowe/Library/Mobile Documents/iCloud~md~obsidian/Documents/soulcruzer vault/Notes"
QUARTZ="/Users/claylowe/Sites/soulcruzer"

/usr/bin/rsync -a --delete \
  --exclude='.DS_Store' \
  --exclude='.obsidian' \
  "$VAULT_NOTES/" \
  "$QUARTZ/content/"

cd "$QUARTZ"
/usr/bin/git add content/
if ! /usr/bin/git diff --staged --quiet; then
  /usr/bin/git commit -m "sync: $(date '+%Y-%m-%d %H:%M')"
  /usr/bin/git push origin main
fi
