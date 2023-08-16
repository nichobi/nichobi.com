#!/bin/sh

blogpostid="$1"
inputfile="blog/$blogpostid.md"
outputfile="blog/$blogpostid-comments.html"

mastodonpost=$(grep -Po '^mastodonpost: "\K[^"]+' "$inputfile" | head -n1 | sed 's/\\//g')
if [ -z "$mastodonpost" ]; then
  echo '<div class="comments">' "You'll be able to comment here by replying to a Mastodon post, as soon as I've posted it." '</div>' > "$outputfile"
  exit
fi

postedoninstance=$(echo "$mastodonpost" | grep -Po 'https://\K[^/]+')
postid=$(echo "$mastodonpost" | grep -Po '[^/]+$')

echo '<div class="comments">
To leave a comment, reply to <a href="'"$mastodonpost"'">this Mastodon post</a> using your fediverse client of choice and it will show up here (after some delay).' > "$outputfile"
curl -s "https://$postedoninstance/api/v1/statuses/$postid/context" | jq '.descendants[]' -c | while read -r i; do
  name=$(echo "$i" | jq -r '.account.display_name')
  account=$(echo "$i" | jq -r '.account.acct')
  accounturl=$(echo "$i" | jq -r '.account.url')
  url=$(echo "$i" | jq -r '.url')
  if (echo "$i" | jq -r '.account.url' | grep "https://$postedoninstance" >/dev/null); then
    account="$account@$postedoninstance"
  fi
  if [ "$(echo "$i" | jq -r '.in_reply_to_id')" = "$postid" ]; then
    indentlevel=1
  else
    indentlevel=2
  fi
  postdate=$(echo "$i" | jq -r '.created_at' | cut -c1-10)
  content=$(echo "$i" | jq -r '.content')

  echo \ '
  <div class="hdivider">----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</div>
  <div class="comment indent'"$indentlevel"'">
    <div class="hflex">
      <div class="commentauth">'"$name"' (<a href="'"$accounturl"'">'"$account"'</a>)</div>
      <a href="'"$url"'">'"$postdate"'</a>
    </div>
    '"$content"'
  </div>' >> "$outputfile"
done
echo '</div>' >> "$outputfile"

