#!/bin/sh

DATA=$(jira list -q "worklogAuthor = $1 and worklogDate >= \"$(date -d 'last monday -7 days' +%Y-%m-%d)\"" | \
       cut -d ':' -f1 | \
       xargs -n1 jira worklog list -t debug | \
       #sed -e's/\(\\r\?\\n\)\+/. /g' -e's/\*//g' | \
       jq -M -s "[[.[].worklogs[] | \
               select(.author.name == \"$1\")| \
               select(.started  | strptime(\"%Y-%m-%dT%H:%M:%S.000%z\") | mktime | select(. > $(date -d 'last monday -7 days' +%s)))] | sort_by(.started) | .[] | {issueId, comment, started, timeSpent}]")

function parseDuration {
    awk '{
            MINUTE=0
            for (i=1; i<=NF; i++) {
                if (substr($i, length($i), 1) == "d") 
                    MINUTE+=substr($i, 1, length($i)-1) * 8 * 60;
                else if (substr($i, length($i), 1) == "h") 
                    MINUTE+=substr($i, 1, length($i)-1) * 60;
                else if (substr($i, length($i), 1) == "m") 
                    MINUTE+=substr($i, 1, length($i)-1);
            }
            print "DURATION " MINUTE
         }'
}
export -f parseDuration

function parseIssueId {
    xargs -i'%' jira list -q'issuekey = %' | cut -d':' -f1
}
export -f parseIssueId

for I in $(seq 0 $(($(echo $DATA | jq 'length')-1))); do
    echo -n $(echo $DATA | jq -r ".[$I]| \"REM \(.started | strptime(\"%Y-%m-%dT%H:%M:%S.000%z\")| strftime(\"%d %b AT %H:%M\")) \""); echo -n " "
    echo -n $(echo $DATA | jq -r ".[$I]| .timeSpent" | parseDuration); echo -n " "
    echo -n "SPECIAL COLOR 128 128 255 {"
    echo -n $(echo $DATA | jq -r ".[$I]| .issueId" | parseIssueId); echo -n "} "
    echo $(echo $DATA | jq -r ".[$I]| \"\(.comment) \"" | tr [] ' ')
done
