#!/bin/sh

sed \
	-e 's/^METHOD:REQUEST/METHOD:REPLY/' \
	-e '/^ORGANIZER;.*/ d' \
	-e 's/^ATTENDEE;.*;CN=/ATTENDEE;PARTSTAT=ACCEPTED;CN=/' \
	-e '/^DESCRIPTION;/,/^SUMMARY/ {/^SUMMARY/! d;}' \
	-e 's/^SUMMARY;LANGUAGE\(.*\):/SUMMARY;LANGUAGE\1:Accepted: /' \
	-e 's/^X-MICROSOFT-CDO-BUSYSTATUS:TENTATIVE/X-MICROSOFT-CDO-BUSYSTATUS:BUSY/' \
	-e 's/^DTSTAMP:\d\+Z/DTSTAMP:$(date +%s)Z/' \
	-e '/^BEGIN:VALARM/,/^END:VALARM/ d' \
	> /tmp/vcalReply

DTSTART=$(sed -nr '/BEGIN:VEVENT/,/END:VEVENT/ {/DTSTART/ { s/^.*:(.*)T(..)(..)(..)/\1 \2:\3:\4/ p}}' /tmp/vcalReply | xargs -i date -d '{}' +%s)
DTEND=$(  sed -nr '/BEGIN:VEVENT/,/END:VEVENT/ {/DTEND/   { s/^.*:(.*)T(..)(..)(..)/\1 \2:\3:\4/ p}}' /tmp/vcalReply | xargs -i date -d '{}' +%s)
SUMMARY=$(sed -nr '/BEGIN:VEVENT/,/END:VEVENT/ {/SUMMARY/ { s/^.*:// p}}'                             /tmp/vcalReply)
echo REM $(date -d @$DTSTART +'%_d %b %Y AT %_H:%M') DURATION $(date -d @$(($DTEND - $DTSTART)) +%_H:%M) MSG "$SUMMARY" >> $XDG_DATA_HOME/remind/addi.rem

