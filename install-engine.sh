#!/bin/bash
#
###############################################################################
#    PBX-ASL-Engine v0.50
#    Copyright (C) 2022 Shane P Daley, M0VUB <support@gb7nr.co.uk>  
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software Foundation,
#   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
###############################################################################
echo "Are we up to date?"
                      apt-get update -y
clear
echo "Starting installer....."

echo Installing required packages...
                     apt-get -y install wget git docker docker-compose figlet

echo "Installing repositories....."
                     git clone https://github.com/ShaYmez/PBX-ASL-Engine.git
		     cd /opt/PBX-ASL-Engine

echo "Set userland-proxy to false..."
echo '{ "userland-proxy": false}' > /etc/docker/daemon.json

echo "Restart docker..."
systemctl restart docker

          echo Make config directories...
          mkdir /etc/asl
          mkdir /etc/asl/user1
          mkdir /etc/asl/user2
          mkdir /etc/asl/user3
          mkdir /etc/asl/user1/.ssh
          mkdir /etc/asl/user2/.ssh
          mkdir /etc/asl/user3/.shh

echo Install configuration ... 
cat << EOF > /etc/asl/user1/rpt.conf
; Radio Repeater configuration file (for use with app_rpt)
; Your Repeater
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; This is where you define your nodes which can be connected to.
;

[nodes]
; Note, if you are using automatic update for allstar link nodes,
; no allstar link nodes should be defined here. Only place a definition
; for your local nodes, and private (off of allstar link) nodes here.

1999 = radio@127.0.0.1:4569/1999,NONE	; This must be changed to your node number
                                        ; and iax port number if not the default

[1999]					; Change this to your assigned node number

                                        ; Must also be enabled in modules.conf
					; Rx audio/signalling channel. Choose ONLY 1 per node stanza

					; Enable the selected channel driver in modules.conf !!!
rxchannel = dahdi/pseudo	        ; No radio (hub)
; rxchannel = SimpleUSB/usb_1999	; SimpleUSB
; rxchannel = Pi/1                      ; Raspberry Pi PiTA
; rxchannel = Radio/usb_1999		; USBRadio (DSP)
; rxchannel = Dahdi/1			; PCI Quad card
; rxchannel = Beagle/1			; BeagleBoard
; rxchannel = USRP/127.0.0.1:34001:32001; GNU Radio interface USRP
; rxchannel = Voter/1999                ; RTCM device


duplex = 1                              ; 0 = Half duplex with no telemetry tones or hang time.
                                        ;     Special Case: Full duplex if linktolink is set to yes.
                                        ;     This mode is preferred when interfacing with an external multiport repeater controller.
					;     Comment out idrecording and idtalkover to suppress IDs also
                                        ; 1 = Half duplex with telemetry tones and hang time. Does not repeat audio.
                                        ;     This mode is preferred when interfacing a simplex node.
                                        ; 2 = Full Duplex with telemetry tones and hang time.
                                        ;     This mode is preferred when interfacing a repeater.
                                        ; 3 = Full Duplex with telemetry tones and hang time, but no repeated audio.
                                        ; 4 = Full Duplex with telemetry tones and hang time. Repeated audio only when the autopatch is down.

linktolink = no				; disables forcing physical half-duplex operation of main repeater while
					; still keeping half-duplex semantics (optional)

linkmongain = 0				; Link Monitor Gain adjusts the audio level of monitored nodes when a signal from another node or the local receiver is received.
					; If linkmongain is set to a negative number the monitored audio will decrease by the set amount in db.
					; If linkmongain set to a positive number monitored audio will increase by the set amount in db.
					; The value of linkmongain is in db. The default value is 0 db.

erxgain = -3				; Echolink receive gain adjustment
					; Note: Gain is in db-volts (20logVI/VO)
etxgain = 3				; Echolink transmit gain adjustment
					; Note: Gain is in db-volts (20logVI/VO)
;eannmode = 1                           ; 1 = Say only node number on echolink connects (default = 1)
                                        ; 2 = say phonetic call sign only on echolink connects
                                        ; 3 = say phonetic call sign and node number on echolink connects

;controlstates = controlstates		; system control state stanza

scheduler = schedule			; scheduler stanza
functions = functions			; Repeater Function stanza
phone_functions = functions		; Phone Function stanza
link_functions = functions		; Link Function stanza

telemetry = telemetry			; Telemetry stanza
morse = morse				; Morse stanza
wait_times = wait-times			; Wait times stanza

context = radio				; dialing context for phone
callerid = "Repeater" <0000000000>	; callerid for phone calls
accountcode = RADIO                     ; account code (optional)

hangtime = 1000				; squelch tail hang time (in ms) (optional, default 5 seconds, 5000 ms)
althangtime = 3000			; longer squelch tail
totime = 180000				; transmit time-out time (in ms) (optional, default 3 minutes 180000 ms)

idrecording = |iWB6NIL			; cording or morse string see https://wiki.allstarlink.org/wiki/Rpt.conf#idrecording.3D
idtalkover = |iWB6NIL                   ; Talkover ID (optional) default is none see https://wiki.allstarlink.org/wiki/Rpt.conf#idtalkover.3D
					; See Telemetry section Example: idrecording = rpt/nodenames/1999
idtime = 540000				; id interval time (in ms) (optional) Default 5 minutes (300000 ms)
politeid = 30000			; time in milliseconds before ID timer expires to try and ID in the tail. (optional, default 30000)

unlinkedct = ct2			; Send a this courtesy tone when the user unkeys if the node is not connected to any other nodes. (optional, default is none)
remotect = ct3				; remote linked courtesy tone (indicates a remote is in the list of links)
linkunkeyct = ct8			; sent when a transmission received over the link unkeys
;nolocallinkct = 0			; Send unlinkedct instead if another local node is connected to this node (hosted on the same PC).

; Supermon smlogger
connpgm=/usr/local/sbin/supermon/smlogger 1
discpgm=/usr/local/sbin/supermon/smlogger 0

;connpgm = yourconnectprogram		; Disabled. Execute a program you specify on connect. (default)
					; passes 2 command line arguments to your program:
					; 1. node number in this stanza (us)
					; 2. node number being connected to us (them)
;discpgm = yourdisconnectprogram	; Disabled. Execute a program you specify on disconnect. (default)
					; passes 2 command line arguments to your program:
					; 1. node number in this stanza (us)
					; 2. node number being disconnected from us (them)

;lnkactenable = 0			; Set to 1 to enable the link activity timer. Applicable to standard nodes only.

;lnkacttime = 1800			; Link activity timer time in seconds.
;lnkactmacro = *52			; Function to execute when link activity timer expires.
;lnkacttimerwarn = 30seconds		; Message to play when the link activity timer has 30 seconds left.

;remote_inact_timeout =			; Specifies the amount of time without keying from the link. Set to 0 to disable timeout. (15 * 60)
;remote_timeout =			; Session time out for remote base. Set to 0 to disable. (60 * 60)
;remote_timeout_warning_freq =		; 30
;remote_timeout_warning =		; (3 * 60)

;nounkeyct = 0				; Set to a 1 to eliminate courtesy tones and associated delays.

holdofftelem = 0			; Hold off all telemetry when signal is present on receiver or from connected nodes
					; except when an ID needs to be done and there is a signal coming from a connected node.

telemdefault = 1                        ; 0 = telemetry output off
                                        ; 1 = telemetry output on (default = 1)
                                        ; 2 = timed telemetry output on command execution and for a short time thereafter.

telemdynamic = 1                        ; 0 = disallow users to change the local telemetry setting with a COP command,
                                        ; 1 = Allow users to change the setting with a COP command. (default = 1)

;beaconing = 0				; Send ID regardless of repeater activity (Required in the UK, but probably illegal in the US)

parrotmode = 0				; 0 = Parrot Off (default = 0)
					; 1 = Parrot On Command
					; 2 = Parrot Always
					; 3 = Parrot Once by Command

parrottime = 1000			; Set the amount of time in milliseconds
					; to wait before parroting what was received

;rxnotch=1065,40                        ; (Optional) Notch a particular frequency for a specified
                                        ; b/w. app_rpt must have been compiled with
                                        ; the notch option

startup_macro =

; nodenames = /var/lib/asterisk/sounds/rpt/nodenames.callsign	; Point to alternate nodename sound directory

; Stream your node audio to Broadcastify or similar. See https://wiki.allstarlink.org/wiki/Stream_Node_Audio_to_Broadcastify
; outstreamcmd = /bin/sh,-c,/usr/bin/lame --preset cbr 16 -r -m m -s 8 --bitwidth 16 - - | /usr/bin/ezstream -qvc /etc/ezstream.xml

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Need more information on these

;extnodes = extnodes-different	; section in extnodefile containing dynamic node information (optional)
;extnodefile = /foo/nodes	; Points to nodelist file containing dynamic node info default = /var/lib/asterisk/rpt_extnodes (optional)
;extnodefile2 =			; Is this a list of node files? Possible a list of private nodes or a list of static IPs for known nodes????
;nodenames = /foo/names         ; locaton of node sound files default = /var/lib/asterisk/sounds/rpt/nodenames
;archivedir = /tmp              ; defines and enables activity recording into specified directory (optional)
;monminblocks = 2048            ; Min 1K blocks to be left on partition (will not save monitor output if disk too full)

;                               ; The tailmessagetime,tailsquashedtime, and tailmessagelist need to be set
;                               ; to support tail messages. They can be omitted otherwise.
;tailmessagetime = 300000       ; Play a tail message every 5 mins
;tailsquashedtime = 30000       ; If squashed by another user,
;                               ; try again after 30 seconds
;tailmessagelist = msg1,msg2    ; list of messages to be played for tail message

; alt_functions
; ctgroup
; dphone_functions
; idtime
; iobase
; iospeed
; locallist
; mars		Remote Base
; memory
; nobusyout
; nodes
; nolocallinkct
; notelemtx
; outxlat
; parrot
; propagate_phonedtmf
; rptnode
; rptinactmacro  Macro to execute when inactivity timer expires
; rptinacttime   Inactivity timer time in seconds  (0 seconds disables feature)
; rxnotch	Optional Audio notch
; simplexphonedelay
; tonemacro
; tonezone
; txlimits


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; *** Status Reporting ***

; Comment the following statpost line stop to reporting of the status of your node to stats.allstarlink.org
statpost_url = http://stats.allstarlink.org/uhandler ; Status updates

[functions]

; Prefix	Functions
; *1		Disconnect Link
; *2		Monitor Link
; *3		Connect Link
; *4		Command Mode
; *5		Macros
; *6		User Functions
; *7		Connection Status/Functions
; *8		User Functions
; *9		User Functions
; *0		User Functions

; *A		User Functions
; *B		User Functions
; *C		User Functions
; *D		User Functions


; Mandatory Command Codes
1 = ilink,1		; Disconnect specified link
2 = ilink,2		; Connect specified link -- monitor only
3 = ilink,3		; Connect specified link -- tranceive
4 = ilink,4		; Enter command mode on specified link
70 = ilink,5		; System status
99 = cop,6              ; PTT (phone mode only)

; End Mandatory Command Codes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Macro Commands
5 = macro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Autopatch Commands
; Note, This may be a good place for other 2 digit frequently used commands

61 = autopatchup,noct = 1,farenddisconnect = 1,dialtime = 20000  ; Autopatch up
62 = autopatchdn                                                 ; Autopatch down

; autopatchup can optionally take comma delimited setting=value pairs:

; context = string		; Override default context with "string"
; dialtime = ms			; Specify the max number of milliseconds between phone number digits (1000 milliseconds = 1 second)
; farenddisconnect = 1		; Automatically disconnect when called party hangs up
; noct = 1			; Don't send repeater courtesy tone during autopatch calls
; quiet = 1			; Don't send dial tone, or connect messages. Do not send patch down message when called party hangs up
				; Example: 123=autopatchup,dialtime=20000,noct=1,farenddisconnect=1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Status Commands

; 1 - Force ID (global)
; 2 - Give Time of Day (global)
; 3 - Give software Version (global)
; 4 - Give GPS location info
; 5 - Last (dtmf) user
; 11 - Force ID (local only)
; 12 - Give Time of Day (local only)

721 = status,1          ; Force ID (global)
722 = status,2          ; Give Time of Day (global)
723 = status,3          ; Give software Version (global)
724 = status,4          ; Give GPS location info
725 = status,5          ; Last (dtmf) user
711 = status,11         ; Force ID (local only)
712 = status,12         ; Give Time of Day (local only)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Link Commands

; 1 - Disconnect specified link
; 2 - Connect specified link -- monitor only
; 3 - Connect specified link -- tranceive
; 4 - Enter command mode on specified link
; 5 - System status
; 6 - Disconnect all links
; 7 - Last Node to Key Up
; 8 - Connect specified link -- local monitor only
; 9 - Send Text Message (9,<destnodeno or 0 (for all)>,Message Text, etc.
; 10 - Disconnect all RANGER links (except permalinks)
; 11 - Disconnect a previously permanently connected link
; 12 - Permanently connect specified link -- monitor only
; 13 - Permanently connect specified link -- tranceive
; 15 - Full system status (all nodes)
; 16 - Reconnect links disconnected with "disconnect all links"
; 17 - MDC test (for diag purposes)
; 18 - Permanently Connect specified link -- local monitor only

; ilink commands 1 through 5 are defined in the Mandatory Command section

76 = ilink,6
806 = ilink,6			; Disconnect all links
807 = ilink,7			; Last Node to Key Up
808 = ilink,8			; Connect specified link -- local monitor only
809 = ilink,9,1999,"Testing"	; would send a text message to node 1999 replace 1999 with 0 for all connected nodes
810 = ilink,10			; Disconnect all RANGER links (except permalinks)
811 = ilink,11			; Disconnect a previously permanently connected link
812 = ilink,12			; Permanently connect specified link -- monitor only
813 = ilink,13			; Permanently connect specified link -- tranceive
815 = ilink,15			; Full system status (all nodes)
816 = ilink,16			; Reconnect links disconnected with "disconnect all links"
817 = ilink,17			; MDC test (for diag purposes)
818 = ilink 18			; Permanently Connect specified link -- local monitor only

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Control operator (cop) functions.
; Change these to something other than these codes listed below!
; Uncomment as needed.

; 901 = cop,1				; System warm boot
; 902 = cop,2				; System enable
; 903 = cop,3				; System disable

; 904 = cop,4				; Test tone on/off (toggle)
; 905 = cop,5				; Dump system variables on console (debug use only)

; 907 = cop,7				; Time out timer enable
; 908 = cop,8				; Time out timer disable

; 909 = cop,9				; Autopatch enable
; 910 = cop,10				; Autopatch disable

; 911 = cop,11				; User linking functions enable
; 912 = cop,12				; User linking functions disable

; 913 = cop,13				; Query system control state
; 914 = cop,14				; Set system control state

; 915 = cop,15				; Scheduler enable
; 916 = cop,16				; Scheduler disable

; 917 = cop,17				; User functions enable (time, id, etc)
; 918 = cop,18				; User functions disable

; 919 = cop,19				; Select alternate hang time (althangtime)
; 920 = cop,20				; Select standard hangtime (hangtime)

; 921 = cop,21				; Enable Parrot Mode
; 922 = cop,22				; Disable Parrot Mode
; 923 = cop,23				; Birdbath (Current Parrot Cleanup/Flush)

; 924 = cop,24				; Flush all telemetry
; 925 = cop,25				; Query last node un-keyed
; 926 = cop,26				; Query all nodes keyed/unkeyed
; 927 = cop,27				; Reset DAQ minimum on a pin
; 928 = cop,28				; Reset DAQ maximum on a pin

; 930 = cop,30				; Recall Memory Setting in Attached Xcvr

; 931 = cop,31				; Channel Selector for Parallel Programmed Xcvr

; 932 = cop,32				; Touchtone pad test: command + Digit string + # to playback all digits pressed

; 933 = cop,33				; Local Telemetry Output Enable
; 934 = cop,34				; Local Telemetry Output Disable
; 935 = cop,35				; Local Telemetry Output on Demand

; 936 = cop,36				; Foreign Link Local Output Path Enable
; 937 = cop,37				; Foreign Link Local Output Path Disable
; 938 = cop,38				; Foreign Link Local Output Path Follows Local Telemetry
; 939 = cop,39				; Foreign Link Local Output Path on Demand

; 942 = cop,42				; Echolink announce node # only
; 943 = cop,43				; Echolink announce node Callsign only
; 944 = cop,44				; Echolink announce node # & Callsign

; 945 = cop,45				; Link Activity timer enable
; 945 = cop,46				; Link Activity timer disable
; 947 = cop,47				; Reset "Link Config Changed" Flag

; 948 = cop,48				; Send Page Tone (Tone specs separated by parenthesis)

; 949 = cop,49				; Disable incoming connections (control state noice)
; 950 = cop,50				; Enable incoming connections (control state noicd)

; 951 = cop,51				; Enable sleep mode
; 952 = cop,52				; Disable sleep mode
; 953 = cop,53				; Wake up from sleep
; 954 = cop,54				; Go to sleep
; 955 = cop,55				; Parrot Once if parrot mode is disabled

; 956 = cop,56                            ; Rx CTCSS Enable
; 957 = cop,57                            ; Rx CTCSS Disable

; 958 = cop.58                            ; Tx CTCSS On Input only Enable
; 959 = cop,59                            ; Tx CTCSS On Input only Disable

; 960 = cop,60                            ; Send MDC-1200 Burst (cop,60,type,UnitID[,DestID,SubCode])
;                                         ; Type is 'I' for PttID, 'E' for Emergency, and 'C' for Call
;                                         ; (SelCall or Alert), or 'SX' for STS (ststus), where X is 0-F.
;                                         ; DestID and subcode are only specified for  the 'C' type message.
;                                         ; UnitID is the local systems UnitID. DestID is the MDC1200 ID of
;                                         ; the radio being called, and the subcodes are as follows:
;                                         ; Subcode '8205' is Voice Selective Call for Spectra ('Call')
;                                         ; Subcode '8015' is Voice Selective Call for Maxtrac ('SC') or
;                                         ; Astro-Saber('Call')
;                                         ; Subcode '810D' is Call Alert (like Maxtrac 'CA')

; 961 = cop,61                            ; Send Message to USB to control GPIO pins (cop,61,GPIO1=0[,GPIO4=1].....)
; 962 = cop,62                            ; Send Message to USB to control GPIO pins, quietly (cop,62,GPIO1=0[,GPIO4=1].....)

; 963 = cop,63                            ; Send pre-configred APRSTT notification (cop,63,CALL[,OVERLAYCHR])
; 964 = cop,64                            ; Send pre-configred APRSTT notification, quietly (cop,64,CALL[,OVERLAYCHR])
; 965 = cop,65                            ; Send POCSAG page (equipped channel types only)

[functions-remote]

0 = remote,1                            ; Retrieve Memory
1 = remote,2                            ; Set freq.
2 = remote,3                            ; Set tx PL tone
3 = remote,4                            ; Set rx PL tone
40 = remote,100                         ; Rx PL off
41 = remote,101                         ; Rx PL on
42 = remote,102                         ; Tx PL off
43 = remote,103                         ; Tx PL on
44 = remote,104                         ; Low Power
45 = remote,105                         ; Medium Power
46 = remote,106                         ; High Power
711 = remote,107                        ; Bump -20
714 = remote,108                        ; Bump -100
717 = remote,109                        ; Bump -500
713 = remote,110                        ; Bump +20
716 = remote,111                        ; Bump +100
719 = remote,112                        ; Bump +500
721 = remote,113                        ; Scan - slow
724 = remote,114                        ; Scan - quick
727 = remote,115                        ; Scan - fast
723 = remote,116                        ; Scan + slow
726 = remote,117                        ; Scan + quick
729 = remote,118                        ; Scan + fast
79 = remote,119                         ; Tune
51 = remote,5                           ; Long status query
52 = remote,140				; Short status query
67 = remote,210				; Send a *
69 = remote,211				; Send a #
;91 = remote,99,CALLSIGN,LICENSETAG     ; Remote base login.
                                        ; Define a different dtmf sequence for each user which is
                                        ; authorized to use the remote base to control access to it.
                                        ; For examble 9139583=remote,99,WB6NIL,G would grant access to
                                        ; the remote base and announce WB6NIL as being logged in.
                                        ; Another entry, 9148351=remote,99,WA6ZFT,E would grant access to
                                        ; the remote base and announce WA6ZFT as being logged in.
                                        ; When the remote base is disconnected from the originating node, the
                                        ; user will be logged out. The LICENSETAG argument is used to enforce
					; tx frequency limits. See [txlimits] below.
85 = cop,6                              ; Remote base telephone key


[telemetry]

; Telemetry entries can be shared across all repeaters, or defined for each repeater.
; Can be a tone sequence, morse string, or a file
;
; |t - Tone escape sequence
;
; Tone sequences consist of 1 or more 4-tuple entries (freq1, freq2, duration, amplitude)
; Single frequencies are created by setting freq1 or freq2 to zero.
;
; |m - Morse escape sequence
;
; Sends Morse code at the telemetry amplitude and telemetry frequency as defined in the
; [morse] section.
;
; Follow with an alphanumeric string
;
; |i - Morse ID escape sequence
;
; Sends Morse code at the ID amplitude and ID frequency as defined in the
; [morse] section.
;
; path/to/sound/file/without/extension
;
; Send the sound if in place of a constructed tone. Do not include the file extension
; Example: ct8 = rpt/bloop
; Example: idrecording = rpt/nodenames/1999

ct1 = |t(350,0,100,2048)(500,0,100,2048)(660,0,100,2048)
ct2 = |t(660,880,150,2048)
ct3 = |t(440,0,150,4096)
ct4 = |t(550,0,150,2048)
ct5 = |t(660,0,150,2048)
ct6 = |t(880,0,150,2048)
ct7 = |t(660,440,150,2048)
ct8 = |t(700,1100,150,2048)
ranger = |t(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,150,0)
remotemon = |t(1209,0,50,2048)                                  ; local courtesy tone when receive only
remotetx = |t(1633,0,50,3000)(0,0,80,0)(1209,0,50,3000)		; local courtesy tone when linked Trancieve mode
cmdmode = |t(900,903,200,2048)
functcomplete = |t(1000,0,100,2048)(0,0,100,0)(1000,0,100,2048)
remcomplete = |t(650,0,100,2048)(0,0,100,0)(650,0,100,2048)(0,0,100,0)(650,0,100,2048)
pfxtone = |t(350,440,30000,3072)
patchup = rpt/callproceeding
patchdown = rpt/callterminated

; As far as what the numbers mean,
; (000,000,010,000)
;   |   |   |   |-------amplitude
;   |   |   |-------------duration
;   |   |-------------------Tone 2
;   |-------------------------Tone 1

; So, with 0,0,10,0 That says No Tone1, No Tone2, 10ms duration, 0 Amplitude.
; Use it for a delay.  Fine tuning for how long before telemetry is sent, in conjunction with the telemdelay parameter)
; The numbers, like 350,440,10,2048 are 350Hz, 440Hz, 10ms delay, amplitude of 2048.

; Morse code parameters, these are common to all repeaters.

[morse]
speed = 20				; Approximate speed in WPM
frequency = 800				; Morse Telemetry Frequency
amplitude = 4096			; Morse Telemetry Amplitude
idfrequency = 1065			; Morse ID Frequency
idamplitude = 1024			; Morse ID Amplitude

;
; This section allows wait times for telemetry events to be adjusted
; A section for wait times can be defined for every repeater
;

[wait-times]
telemwait = 2000                        ; Time to wait before sending most telemetry
idwait = 500                            ; Time to wait before starting ID
unkeywait = 2000                        ; Time to wait after unkey before sending CT's and link telemetry
calltermwait = 2000                     ; Time to wait before announcing "call terminated"

; Memories for remote bases

[memory]
;00 = 146.580,100.0,m
;01 = 147.030,103.5,m+t
;02 = 147.240,103.5,m+t
;03 = 147.765,79.7,m-t
;04 = 146.460,100.0,m
;05 = 146.550,100.0,m

; Place command macros here

[macro]
;1 = *32011#
;2 = *12001*12011*12043*12040*12050*12060*12009*12002*12003*12004*1113*12030#
;3 = *32001*32011*32050*32030*32060#


; Data Acquisition configuration

;[daq-list]
;device = device_name1
;device = device_name2

;Where: device_name1 and device_name2 are stanzas you define in this file

;device = daq-cham-1

; Device name

;[daq-cham-1]				; Defined in [daq-list]
;hwtype = uchameleon			; DAQ hardware type
;devnode = /dev/ttyUSB0			; DAQ device node (if required)
;1 = inadc				; Pin definition for an ADC channel
;2 = inadc
;3 = inadc
;4 = inadc
;5 = inadc
;6 = inadc
;7 = inadc
;8 = inadc
;9 = inp				; Pin definition for an input with a weak pullup resistor
;10 = inp
;11 = inp
;12 = inp
;13 = in				; Pin definition for an input without a weak pullup resistor
;14 = out				; Pin definition for an output
;15 = out
;16 = out
;17 = out
;18 = out

;[meter-faces]

;face = scale(scalepre,scalediv,scalepost),word/?,...
;
; scalepre = offset to add before dividing with scalediv
; scalediv = full scale/number of whole units (e.g. 256/20 or 12.8 for 20 volts).
; scalepost = offset to add after dividing with scalediv
;
;face = range(X-Y:word,X2-Y2:word,...),word/?,...
;face = bit(low-word,high-word),word/?,...
;
; word/? is either a word in /var/lib/asterisk/sounds or one of its subdirectories,
; or a question mark which is  a placeholder for the measured value.
;
;
; Battery voltage 0-20 volts
;batvolts = scale(0,12.8,0),rpt/thevoltageis,?,ha/volts
; 4 quadrant wind direction
;winddir = range(0-33:north,34-96:west,97-160:south,161-224:east,225-255:north),rpt/thewindis,?
; LM34 temperature sensor with 130 deg. F full scale
;lm34f = scale(0,1.969,0),rpt/thetemperatureis,?,degrees,fahrenheit
; Status poll (non alarmed)
;light = bit(ha/off,ha/on),ha/light,?

;[alarms]
;
;tag = device,pin,node,ignorefirst,func-low,func-hi
;
;tag = a unique name for the alarm
;device = daq device to poll
;pin = the device pin to be monitored
;ignorefirstalarm = set to 1 to throwaway first alarm event, or 0 to report it
;node = the node number to execute the function on
;func-low = the DTMF function to execute on a high to low transition
;func-high = the DTMF function to execute on a low to high transition
;
; a  '-' as a function name is shorthand for no-operation
;
;door = daq-cham-1,9,1,2017,*7,-
;pwrfail = daq-cham-1,10,0,2017,*911111,-
;
; Control states
; Allow several control operator functions to be changed at once using one command (good for scheduling)
;
;[controlstates]
;statenum = copcmd,[copcmd]...
;0 = rptena,lnkena,apena,totena,ufena,noicd  ; Normal operation
;1 = rptena,lnkena,apdis,totdis,ufena,noice  ; Net and news operation
;2 = rptena,lnkdis,apdis,totena,ufdis,noice  ; Repeater only operation

; Scheduler - execute a macro at a given time

[schedule]
;dtmf_function =  m h dom mon dow  ; ala cron, star is implied
;2 = 00 00 * * *   ; at midnight, execute macro 2.

; See https://wiki.allstarlink.org/wiki/Event_Management
[events]

#includeifexists custom/rpt.conf
EOF

cat << EOF > /etc/asl/user2/rpt.conf
; Radio Repeater configuration file (for use with app_rpt)
; Your Repeater
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; This is where you define your nodes which can be connected to.
;

[nodes]
; Note, if you are using automatic update for allstar link nodes,
; no allstar link nodes should be defined here. Only place a definition
; for your local nodes, and private (off of allstar link) nodes here.

1999 = radio@127.0.0.1:4569/1999,NONE	; This must be changed to your node number
                                        ; and iax port number if not the default

[1999]					; Change this to your assigned node number

                                        ; Must also be enabled in modules.conf
					; Rx audio/signalling channel. Choose ONLY 1 per node stanza

					; Enable the selected channel driver in modules.conf !!!
rxchannel = dahdi/pseudo	        ; No radio (hub)
; rxchannel = SimpleUSB/usb_1999	; SimpleUSB
; rxchannel = Pi/1                      ; Raspberry Pi PiTA
; rxchannel = Radio/usb_1999		; USBRadio (DSP)
; rxchannel = Dahdi/1			; PCI Quad card
; rxchannel = Beagle/1			; BeagleBoard
; rxchannel = USRP/127.0.0.1:34001:32001; GNU Radio interface USRP
; rxchannel = Voter/1999                ; RTCM device


duplex = 1                              ; 0 = Half duplex with no telemetry tones or hang time.
                                        ;     Special Case: Full duplex if linktolink is set to yes.
                                        ;     This mode is preferred when interfacing with an external multiport repeater controller.
					;     Comment out idrecording and idtalkover to suppress IDs also
                                        ; 1 = Half duplex with telemetry tones and hang time. Does not repeat audio.
                                        ;     This mode is preferred when interfacing a simplex node.
                                        ; 2 = Full Duplex with telemetry tones and hang time.
                                        ;     This mode is preferred when interfacing a repeater.
                                        ; 3 = Full Duplex with telemetry tones and hang time, but no repeated audio.
                                        ; 4 = Full Duplex with telemetry tones and hang time. Repeated audio only when the autopatch is down.

linktolink = no				; disables forcing physical half-duplex operation of main repeater while
					; still keeping half-duplex semantics (optional)

linkmongain = 0				; Link Monitor Gain adjusts the audio level of monitored nodes when a signal from another node or the local receiver is received.
					; If linkmongain is set to a negative number the monitored audio will decrease by the set amount in db.
					; If linkmongain set to a positive number monitored audio will increase by the set amount in db.
					; The value of linkmongain is in db. The default value is 0 db.

erxgain = -3				; Echolink receive gain adjustment
					; Note: Gain is in db-volts (20logVI/VO)
etxgain = 3				; Echolink transmit gain adjustment
					; Note: Gain is in db-volts (20logVI/VO)
;eannmode = 1                           ; 1 = Say only node number on echolink connects (default = 1)
                                        ; 2 = say phonetic call sign only on echolink connects
                                        ; 3 = say phonetic call sign and node number on echolink connects

;controlstates = controlstates		; system control state stanza

scheduler = schedule			; scheduler stanza
functions = functions			; Repeater Function stanza
phone_functions = functions		; Phone Function stanza
link_functions = functions		; Link Function stanza

telemetry = telemetry			; Telemetry stanza
morse = morse				; Morse stanza
wait_times = wait-times			; Wait times stanza

context = radio				; dialing context for phone
callerid = "Repeater" <0000000000>	; callerid for phone calls
accountcode = RADIO                     ; account code (optional)

hangtime = 1000				; squelch tail hang time (in ms) (optional, default 5 seconds, 5000 ms)
althangtime = 3000			; longer squelch tail
totime = 180000				; transmit time-out time (in ms) (optional, default 3 minutes 180000 ms)

idrecording = |iWB6NIL			; cording or morse string see https://wiki.allstarlink.org/wiki/Rpt.conf#idrecording.3D
idtalkover = |iWB6NIL                   ; Talkover ID (optional) default is none see https://wiki.allstarlink.org/wiki/Rpt.conf#idtalkover.3D
					; See Telemetry section Example: idrecording = rpt/nodenames/1999
idtime = 540000				; id interval time (in ms) (optional) Default 5 minutes (300000 ms)
politeid = 30000			; time in milliseconds before ID timer expires to try and ID in the tail. (optional, default 30000)

unlinkedct = ct2			; Send a this courtesy tone when the user unkeys if the node is not connected to any other nodes. (optional, default is none)
remotect = ct3				; remote linked courtesy tone (indicates a remote is in the list of links)
linkunkeyct = ct8			; sent when a transmission received over the link unkeys
;nolocallinkct = 0			; Send unlinkedct instead if another local node is connected to this node (hosted on the same PC).

; Supermon smlogger
connpgm=/usr/local/sbin/supermon/smlogger 1
discpgm=/usr/local/sbin/supermon/smlogger 0

;connpgm = yourconnectprogram		; Disabled. Execute a program you specify on connect. (default)
					; passes 2 command line arguments to your program:
					; 1. node number in this stanza (us)
					; 2. node number being connected to us (them)
;discpgm = yourdisconnectprogram	; Disabled. Execute a program you specify on disconnect. (default)
					; passes 2 command line arguments to your program:
					; 1. node number in this stanza (us)
					; 2. node number being disconnected from us (them)

;lnkactenable = 0			; Set to 1 to enable the link activity timer. Applicable to standard nodes only.

;lnkacttime = 1800			; Link activity timer time in seconds.
;lnkactmacro = *52			; Function to execute when link activity timer expires.
;lnkacttimerwarn = 30seconds		; Message to play when the link activity timer has 30 seconds left.

;remote_inact_timeout =			; Specifies the amount of time without keying from the link. Set to 0 to disable timeout. (15 * 60)
;remote_timeout =			; Session time out for remote base. Set to 0 to disable. (60 * 60)
;remote_timeout_warning_freq =		; 30
;remote_timeout_warning =		; (3 * 60)

;nounkeyct = 0				; Set to a 1 to eliminate courtesy tones and associated delays.

holdofftelem = 0			; Hold off all telemetry when signal is present on receiver or from connected nodes
					; except when an ID needs to be done and there is a signal coming from a connected node.

telemdefault = 1                        ; 0 = telemetry output off
                                        ; 1 = telemetry output on (default = 1)
                                        ; 2 = timed telemetry output on command execution and for a short time thereafter.

telemdynamic = 1                        ; 0 = disallow users to change the local telemetry setting with a COP command,
                                        ; 1 = Allow users to change the setting with a COP command. (default = 1)

;beaconing = 0				; Send ID regardless of repeater activity (Required in the UK, but probably illegal in the US)

parrotmode = 0				; 0 = Parrot Off (default = 0)
					; 1 = Parrot On Command
					; 2 = Parrot Always
					; 3 = Parrot Once by Command

parrottime = 1000			; Set the amount of time in milliseconds
					; to wait before parroting what was received

;rxnotch=1065,40                        ; (Optional) Notch a particular frequency for a specified
                                        ; b/w. app_rpt must have been compiled with
                                        ; the notch option

startup_macro =

; nodenames = /var/lib/asterisk/sounds/rpt/nodenames.callsign	; Point to alternate nodename sound directory

; Stream your node audio to Broadcastify or similar. See https://wiki.allstarlink.org/wiki/Stream_Node_Audio_to_Broadcastify
; outstreamcmd = /bin/sh,-c,/usr/bin/lame --preset cbr 16 -r -m m -s 8 --bitwidth 16 - - | /usr/bin/ezstream -qvc /etc/ezstream.xml

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Need more information on these

;extnodes = extnodes-different	; section in extnodefile containing dynamic node information (optional)
;extnodefile = /foo/nodes	; Points to nodelist file containing dynamic node info default = /var/lib/asterisk/rpt_extnodes (optional)
;extnodefile2 =			; Is this a list of node files? Possible a list of private nodes or a list of static IPs for known nodes????
;nodenames = /foo/names         ; locaton of node sound files default = /var/lib/asterisk/sounds/rpt/nodenames
;archivedir = /tmp              ; defines and enables activity recording into specified directory (optional)
;monminblocks = 2048            ; Min 1K blocks to be left on partition (will not save monitor output if disk too full)

;                               ; The tailmessagetime,tailsquashedtime, and tailmessagelist need to be set
;                               ; to support tail messages. They can be omitted otherwise.
;tailmessagetime = 300000       ; Play a tail message every 5 mins
;tailsquashedtime = 30000       ; If squashed by another user,
;                               ; try again after 30 seconds
;tailmessagelist = msg1,msg2    ; list of messages to be played for tail message

; alt_functions
; ctgroup
; dphone_functions
; idtime
; iobase
; iospeed
; locallist
; mars		Remote Base
; memory
; nobusyout
; nodes
; nolocallinkct
; notelemtx
; outxlat
; parrot
; propagate_phonedtmf
; rptnode
; rptinactmacro  Macro to execute when inactivity timer expires
; rptinacttime   Inactivity timer time in seconds  (0 seconds disables feature)
; rxnotch	Optional Audio notch
; simplexphonedelay
; tonemacro
; tonezone
; txlimits


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; *** Status Reporting ***

; Comment the following statpost line stop to reporting of the status of your node to stats.allstarlink.org
statpost_url = http://stats.allstarlink.org/uhandler ; Status updates

[functions]

; Prefix	Functions
; *1		Disconnect Link
; *2		Monitor Link
; *3		Connect Link
; *4		Command Mode
; *5		Macros
; *6		User Functions
; *7		Connection Status/Functions
; *8		User Functions
; *9		User Functions
; *0		User Functions

; *A		User Functions
; *B		User Functions
; *C		User Functions
; *D		User Functions


; Mandatory Command Codes
1 = ilink,1		; Disconnect specified link
2 = ilink,2		; Connect specified link -- monitor only
3 = ilink,3		; Connect specified link -- tranceive
4 = ilink,4		; Enter command mode on specified link
70 = ilink,5		; System status
99 = cop,6              ; PTT (phone mode only)

; End Mandatory Command Codes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Macro Commands
5 = macro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Autopatch Commands
; Note, This may be a good place for other 2 digit frequently used commands

61 = autopatchup,noct = 1,farenddisconnect = 1,dialtime = 20000  ; Autopatch up
62 = autopatchdn                                                 ; Autopatch down

; autopatchup can optionally take comma delimited setting=value pairs:

; context = string		; Override default context with "string"
; dialtime = ms			; Specify the max number of milliseconds between phone number digits (1000 milliseconds = 1 second)
; farenddisconnect = 1		; Automatically disconnect when called party hangs up
; noct = 1			; Don't send repeater courtesy tone during autopatch calls
; quiet = 1			; Don't send dial tone, or connect messages. Do not send patch down message when called party hangs up
				; Example: 123=autopatchup,dialtime=20000,noct=1,farenddisconnect=1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Status Commands

; 1 - Force ID (global)
; 2 - Give Time of Day (global)
; 3 - Give software Version (global)
; 4 - Give GPS location info
; 5 - Last (dtmf) user
; 11 - Force ID (local only)
; 12 - Give Time of Day (local only)

721 = status,1          ; Force ID (global)
722 = status,2          ; Give Time of Day (global)
723 = status,3          ; Give software Version (global)
724 = status,4          ; Give GPS location info
725 = status,5          ; Last (dtmf) user
711 = status,11         ; Force ID (local only)
712 = status,12         ; Give Time of Day (local only)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Link Commands

; 1 - Disconnect specified link
; 2 - Connect specified link -- monitor only
; 3 - Connect specified link -- tranceive
; 4 - Enter command mode on specified link
; 5 - System status
; 6 - Disconnect all links
; 7 - Last Node to Key Up
; 8 - Connect specified link -- local monitor only
; 9 - Send Text Message (9,<destnodeno or 0 (for all)>,Message Text, etc.
; 10 - Disconnect all RANGER links (except permalinks)
; 11 - Disconnect a previously permanently connected link
; 12 - Permanently connect specified link -- monitor only
; 13 - Permanently connect specified link -- tranceive
; 15 - Full system status (all nodes)
; 16 - Reconnect links disconnected with "disconnect all links"
; 17 - MDC test (for diag purposes)
; 18 - Permanently Connect specified link -- local monitor only

; ilink commands 1 through 5 are defined in the Mandatory Command section

76 = ilink,6
806 = ilink,6			; Disconnect all links
807 = ilink,7			; Last Node to Key Up
808 = ilink,8			; Connect specified link -- local monitor only
809 = ilink,9,1999,"Testing"	; would send a text message to node 1999 replace 1999 with 0 for all connected nodes
810 = ilink,10			; Disconnect all RANGER links (except permalinks)
811 = ilink,11			; Disconnect a previously permanently connected link
812 = ilink,12			; Permanently connect specified link -- monitor only
813 = ilink,13			; Permanently connect specified link -- tranceive
815 = ilink,15			; Full system status (all nodes)
816 = ilink,16			; Reconnect links disconnected with "disconnect all links"
817 = ilink,17			; MDC test (for diag purposes)
818 = ilink 18			; Permanently Connect specified link -- local monitor only

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Control operator (cop) functions.
; Change these to something other than these codes listed below!
; Uncomment as needed.

; 901 = cop,1				; System warm boot
; 902 = cop,2				; System enable
; 903 = cop,3				; System disable

; 904 = cop,4				; Test tone on/off (toggle)
; 905 = cop,5				; Dump system variables on console (debug use only)

; 907 = cop,7				; Time out timer enable
; 908 = cop,8				; Time out timer disable

; 909 = cop,9				; Autopatch enable
; 910 = cop,10				; Autopatch disable

; 911 = cop,11				; User linking functions enable
; 912 = cop,12				; User linking functions disable

; 913 = cop,13				; Query system control state
; 914 = cop,14				; Set system control state

; 915 = cop,15				; Scheduler enable
; 916 = cop,16				; Scheduler disable

; 917 = cop,17				; User functions enable (time, id, etc)
; 918 = cop,18				; User functions disable

; 919 = cop,19				; Select alternate hang time (althangtime)
; 920 = cop,20				; Select standard hangtime (hangtime)

; 921 = cop,21				; Enable Parrot Mode
; 922 = cop,22				; Disable Parrot Mode
; 923 = cop,23				; Birdbath (Current Parrot Cleanup/Flush)

; 924 = cop,24				; Flush all telemetry
; 925 = cop,25				; Query last node un-keyed
; 926 = cop,26				; Query all nodes keyed/unkeyed
; 927 = cop,27				; Reset DAQ minimum on a pin
; 928 = cop,28				; Reset DAQ maximum on a pin

; 930 = cop,30				; Recall Memory Setting in Attached Xcvr

; 931 = cop,31				; Channel Selector for Parallel Programmed Xcvr

; 932 = cop,32				; Touchtone pad test: command + Digit string + # to playback all digits pressed

; 933 = cop,33				; Local Telemetry Output Enable
; 934 = cop,34				; Local Telemetry Output Disable
; 935 = cop,35				; Local Telemetry Output on Demand

; 936 = cop,36				; Foreign Link Local Output Path Enable
; 937 = cop,37				; Foreign Link Local Output Path Disable
; 938 = cop,38				; Foreign Link Local Output Path Follows Local Telemetry
; 939 = cop,39				; Foreign Link Local Output Path on Demand

; 942 = cop,42				; Echolink announce node # only
; 943 = cop,43				; Echolink announce node Callsign only
; 944 = cop,44				; Echolink announce node # & Callsign

; 945 = cop,45				; Link Activity timer enable
; 945 = cop,46				; Link Activity timer disable
; 947 = cop,47				; Reset "Link Config Changed" Flag

; 948 = cop,48				; Send Page Tone (Tone specs separated by parenthesis)

; 949 = cop,49				; Disable incoming connections (control state noice)
; 950 = cop,50				; Enable incoming connections (control state noicd)

; 951 = cop,51				; Enable sleep mode
; 952 = cop,52				; Disable sleep mode
; 953 = cop,53				; Wake up from sleep
; 954 = cop,54				; Go to sleep
; 955 = cop,55				; Parrot Once if parrot mode is disabled

; 956 = cop,56                            ; Rx CTCSS Enable
; 957 = cop,57                            ; Rx CTCSS Disable

; 958 = cop.58                            ; Tx CTCSS On Input only Enable
; 959 = cop,59                            ; Tx CTCSS On Input only Disable

; 960 = cop,60                            ; Send MDC-1200 Burst (cop,60,type,UnitID[,DestID,SubCode])
;                                         ; Type is 'I' for PttID, 'E' for Emergency, and 'C' for Call
;                                         ; (SelCall or Alert), or 'SX' for STS (ststus), where X is 0-F.
;                                         ; DestID and subcode are only specified for  the 'C' type message.
;                                         ; UnitID is the local systems UnitID. DestID is the MDC1200 ID of
;                                         ; the radio being called, and the subcodes are as follows:
;                                         ; Subcode '8205' is Voice Selective Call for Spectra ('Call')
;                                         ; Subcode '8015' is Voice Selective Call for Maxtrac ('SC') or
;                                         ; Astro-Saber('Call')
;                                         ; Subcode '810D' is Call Alert (like Maxtrac 'CA')

; 961 = cop,61                            ; Send Message to USB to control GPIO pins (cop,61,GPIO1=0[,GPIO4=1].....)
; 962 = cop,62                            ; Send Message to USB to control GPIO pins, quietly (cop,62,GPIO1=0[,GPIO4=1].....)

; 963 = cop,63                            ; Send pre-configred APRSTT notification (cop,63,CALL[,OVERLAYCHR])
; 964 = cop,64                            ; Send pre-configred APRSTT notification, quietly (cop,64,CALL[,OVERLAYCHR])
; 965 = cop,65                            ; Send POCSAG page (equipped channel types only)

[functions-remote]

0 = remote,1                            ; Retrieve Memory
1 = remote,2                            ; Set freq.
2 = remote,3                            ; Set tx PL tone
3 = remote,4                            ; Set rx PL tone
40 = remote,100                         ; Rx PL off
41 = remote,101                         ; Rx PL on
42 = remote,102                         ; Tx PL off
43 = remote,103                         ; Tx PL on
44 = remote,104                         ; Low Power
45 = remote,105                         ; Medium Power
46 = remote,106                         ; High Power
711 = remote,107                        ; Bump -20
714 = remote,108                        ; Bump -100
717 = remote,109                        ; Bump -500
713 = remote,110                        ; Bump +20
716 = remote,111                        ; Bump +100
719 = remote,112                        ; Bump +500
721 = remote,113                        ; Scan - slow
724 = remote,114                        ; Scan - quick
727 = remote,115                        ; Scan - fast
723 = remote,116                        ; Scan + slow
726 = remote,117                        ; Scan + quick
729 = remote,118                        ; Scan + fast
79 = remote,119                         ; Tune
51 = remote,5                           ; Long status query
52 = remote,140				; Short status query
67 = remote,210				; Send a *
69 = remote,211				; Send a #
;91 = remote,99,CALLSIGN,LICENSETAG     ; Remote base login.
                                        ; Define a different dtmf sequence for each user which is
                                        ; authorized to use the remote base to control access to it.
                                        ; For examble 9139583=remote,99,WB6NIL,G would grant access to
                                        ; the remote base and announce WB6NIL as being logged in.
                                        ; Another entry, 9148351=remote,99,WA6ZFT,E would grant access to
                                        ; the remote base and announce WA6ZFT as being logged in.
                                        ; When the remote base is disconnected from the originating node, the
                                        ; user will be logged out. The LICENSETAG argument is used to enforce
					; tx frequency limits. See [txlimits] below.
85 = cop,6                              ; Remote base telephone key


[telemetry]

; Telemetry entries can be shared across all repeaters, or defined for each repeater.
; Can be a tone sequence, morse string, or a file
;
; |t - Tone escape sequence
;
; Tone sequences consist of 1 or more 4-tuple entries (freq1, freq2, duration, amplitude)
; Single frequencies are created by setting freq1 or freq2 to zero.
;
; |m - Morse escape sequence
;
; Sends Morse code at the telemetry amplitude and telemetry frequency as defined in the
; [morse] section.
;
; Follow with an alphanumeric string
;
; |i - Morse ID escape sequence
;
; Sends Morse code at the ID amplitude and ID frequency as defined in the
; [morse] section.
;
; path/to/sound/file/without/extension
;
; Send the sound if in place of a constructed tone. Do not include the file extension
; Example: ct8 = rpt/bloop
; Example: idrecording = rpt/nodenames/1999

ct1 = |t(350,0,100,2048)(500,0,100,2048)(660,0,100,2048)
ct2 = |t(660,880,150,2048)
ct3 = |t(440,0,150,4096)
ct4 = |t(550,0,150,2048)
ct5 = |t(660,0,150,2048)
ct6 = |t(880,0,150,2048)
ct7 = |t(660,440,150,2048)
ct8 = |t(700,1100,150,2048)
ranger = |t(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,150,0)
remotemon = |t(1209,0,50,2048)                                  ; local courtesy tone when receive only
remotetx = |t(1633,0,50,3000)(0,0,80,0)(1209,0,50,3000)		; local courtesy tone when linked Trancieve mode
cmdmode = |t(900,903,200,2048)
functcomplete = |t(1000,0,100,2048)(0,0,100,0)(1000,0,100,2048)
remcomplete = |t(650,0,100,2048)(0,0,100,0)(650,0,100,2048)(0,0,100,0)(650,0,100,2048)
pfxtone = |t(350,440,30000,3072)
patchup = rpt/callproceeding
patchdown = rpt/callterminated

; As far as what the numbers mean,
; (000,000,010,000)
;   |   |   |   |-------amplitude
;   |   |   |-------------duration
;   |   |-------------------Tone 2
;   |-------------------------Tone 1

; So, with 0,0,10,0 That says No Tone1, No Tone2, 10ms duration, 0 Amplitude.
; Use it for a delay.  Fine tuning for how long before telemetry is sent, in conjunction with the telemdelay parameter)
; The numbers, like 350,440,10,2048 are 350Hz, 440Hz, 10ms delay, amplitude of 2048.

; Morse code parameters, these are common to all repeaters.

[morse]
speed = 20				; Approximate speed in WPM
frequency = 800				; Morse Telemetry Frequency
amplitude = 4096			; Morse Telemetry Amplitude
idfrequency = 1065			; Morse ID Frequency
idamplitude = 1024			; Morse ID Amplitude

;
; This section allows wait times for telemetry events to be adjusted
; A section for wait times can be defined for every repeater
;

[wait-times]
telemwait = 2000                        ; Time to wait before sending most telemetry
idwait = 500                            ; Time to wait before starting ID
unkeywait = 2000                        ; Time to wait after unkey before sending CT's and link telemetry
calltermwait = 2000                     ; Time to wait before announcing "call terminated"

; Memories for remote bases

[memory]
;00 = 146.580,100.0,m
;01 = 147.030,103.5,m+t
;02 = 147.240,103.5,m+t
;03 = 147.765,79.7,m-t
;04 = 146.460,100.0,m
;05 = 146.550,100.0,m

; Place command macros here

[macro]
;1 = *32011#
;2 = *12001*12011*12043*12040*12050*12060*12009*12002*12003*12004*1113*12030#
;3 = *32001*32011*32050*32030*32060#


; Data Acquisition configuration

;[daq-list]
;device = device_name1
;device = device_name2

;Where: device_name1 and device_name2 are stanzas you define in this file

;device = daq-cham-1

; Device name

;[daq-cham-1]				; Defined in [daq-list]
;hwtype = uchameleon			; DAQ hardware type
;devnode = /dev/ttyUSB0			; DAQ device node (if required)
;1 = inadc				; Pin definition for an ADC channel
;2 = inadc
;3 = inadc
;4 = inadc
;5 = inadc
;6 = inadc
;7 = inadc
;8 = inadc
;9 = inp				; Pin definition for an input with a weak pullup resistor
;10 = inp
;11 = inp
;12 = inp
;13 = in				; Pin definition for an input without a weak pullup resistor
;14 = out				; Pin definition for an output
;15 = out
;16 = out
;17 = out
;18 = out

;[meter-faces]

;face = scale(scalepre,scalediv,scalepost),word/?,...
;
; scalepre = offset to add before dividing with scalediv
; scalediv = full scale/number of whole units (e.g. 256/20 or 12.8 for 20 volts).
; scalepost = offset to add after dividing with scalediv
;
;face = range(X-Y:word,X2-Y2:word,...),word/?,...
;face = bit(low-word,high-word),word/?,...
;
; word/? is either a word in /var/lib/asterisk/sounds or one of its subdirectories,
; or a question mark which is  a placeholder for the measured value.
;
;
; Battery voltage 0-20 volts
;batvolts = scale(0,12.8,0),rpt/thevoltageis,?,ha/volts
; 4 quadrant wind direction
;winddir = range(0-33:north,34-96:west,97-160:south,161-224:east,225-255:north),rpt/thewindis,?
; LM34 temperature sensor with 130 deg. F full scale
;lm34f = scale(0,1.969,0),rpt/thetemperatureis,?,degrees,fahrenheit
; Status poll (non alarmed)
;light = bit(ha/off,ha/on),ha/light,?

;[alarms]
;
;tag = device,pin,node,ignorefirst,func-low,func-hi
;
;tag = a unique name for the alarm
;device = daq device to poll
;pin = the device pin to be monitored
;ignorefirstalarm = set to 1 to throwaway first alarm event, or 0 to report it
;node = the node number to execute the function on
;func-low = the DTMF function to execute on a high to low transition
;func-high = the DTMF function to execute on a low to high transition
;
; a  '-' as a function name is shorthand for no-operation
;
;door = daq-cham-1,9,1,2017,*7,-
;pwrfail = daq-cham-1,10,0,2017,*911111,-
;
; Control states
; Allow several control operator functions to be changed at once using one command (good for scheduling)
;
;[controlstates]
;statenum = copcmd,[copcmd]...
;0 = rptena,lnkena,apena,totena,ufena,noicd  ; Normal operation
;1 = rptena,lnkena,apdis,totdis,ufena,noice  ; Net and news operation
;2 = rptena,lnkdis,apdis,totena,ufdis,noice  ; Repeater only operation

; Scheduler - execute a macro at a given time

[schedule]
;dtmf_function =  m h dom mon dow  ; ala cron, star is implied
;2 = 00 00 * * *   ; at midnight, execute macro 2.

; See https://wiki.allstarlink.org/wiki/Event_Management
[events]

#includeifexists custom/rpt.conf
EOF

cat << EOF > /etc/asl/user3/rpt.conf
; Radio Repeater configuration file (for use with app_rpt)
; Your Repeater
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; This is where you define your nodes which can be connected to.
;

[nodes]
; Note, if you are using automatic update for allstar link nodes,
; no allstar link nodes should be defined here. Only place a definition
; for your local nodes, and private (off of allstar link) nodes here.

1999 = radio@127.0.0.1:4569/1999,NONE	; This must be changed to your node number
                                        ; and iax port number if not the default

[1999]					; Change this to your assigned node number

                                        ; Must also be enabled in modules.conf
					; Rx audio/signalling channel. Choose ONLY 1 per node stanza

					; Enable the selected channel driver in modules.conf !!!
rxchannel = dahdi/pseudo	        ; No radio (hub)
; rxchannel = SimpleUSB/usb_1999	; SimpleUSB
; rxchannel = Pi/1                      ; Raspberry Pi PiTA
; rxchannel = Radio/usb_1999		; USBRadio (DSP)
; rxchannel = Dahdi/1			; PCI Quad card
; rxchannel = Beagle/1			; BeagleBoard
; rxchannel = USRP/127.0.0.1:34001:32001; GNU Radio interface USRP
; rxchannel = Voter/1999                ; RTCM device


duplex = 1                              ; 0 = Half duplex with no telemetry tones or hang time.
                                        ;     Special Case: Full duplex if linktolink is set to yes.
                                        ;     This mode is preferred when interfacing with an external multiport repeater controller.
					;     Comment out idrecording and idtalkover to suppress IDs also
                                        ; 1 = Half duplex with telemetry tones and hang time. Does not repeat audio.
                                        ;     This mode is preferred when interfacing a simplex node.
                                        ; 2 = Full Duplex with telemetry tones and hang time.
                                        ;     This mode is preferred when interfacing a repeater.
                                        ; 3 = Full Duplex with telemetry tones and hang time, but no repeated audio.
                                        ; 4 = Full Duplex with telemetry tones and hang time. Repeated audio only when the autopatch is down.

linktolink = no				; disables forcing physical half-duplex operation of main repeater while
					; still keeping half-duplex semantics (optional)

linkmongain = 0				; Link Monitor Gain adjusts the audio level of monitored nodes when a signal from another node or the local receiver is received.
					; If linkmongain is set to a negative number the monitored audio will decrease by the set amount in db.
					; If linkmongain set to a positive number monitored audio will increase by the set amount in db.
					; The value of linkmongain is in db. The default value is 0 db.

erxgain = -3				; Echolink receive gain adjustment
					; Note: Gain is in db-volts (20logVI/VO)
etxgain = 3				; Echolink transmit gain adjustment
					; Note: Gain is in db-volts (20logVI/VO)
;eannmode = 1                           ; 1 = Say only node number on echolink connects (default = 1)
                                        ; 2 = say phonetic call sign only on echolink connects
                                        ; 3 = say phonetic call sign and node number on echolink connects

;controlstates = controlstates		; system control state stanza

scheduler = schedule			; scheduler stanza
functions = functions			; Repeater Function stanza
phone_functions = functions		; Phone Function stanza
link_functions = functions		; Link Function stanza

telemetry = telemetry			; Telemetry stanza
morse = morse				; Morse stanza
wait_times = wait-times			; Wait times stanza

context = radio				; dialing context for phone
callerid = "Repeater" <0000000000>	; callerid for phone calls
accountcode = RADIO                     ; account code (optional)

hangtime = 1000				; squelch tail hang time (in ms) (optional, default 5 seconds, 5000 ms)
althangtime = 3000			; longer squelch tail
totime = 180000				; transmit time-out time (in ms) (optional, default 3 minutes 180000 ms)

idrecording = |iWB6NIL			; cording or morse string see https://wiki.allstarlink.org/wiki/Rpt.conf#idrecording.3D
idtalkover = |iWB6NIL                   ; Talkover ID (optional) default is none see https://wiki.allstarlink.org/wiki/Rpt.conf#idtalkover.3D
					; See Telemetry section Example: idrecording = rpt/nodenames/1999
idtime = 540000				; id interval time (in ms) (optional) Default 5 minutes (300000 ms)
politeid = 30000			; time in milliseconds before ID timer expires to try and ID in the tail. (optional, default 30000)

unlinkedct = ct2			; Send a this courtesy tone when the user unkeys if the node is not connected to any other nodes. (optional, default is none)
remotect = ct3				; remote linked courtesy tone (indicates a remote is in the list of links)
linkunkeyct = ct8			; sent when a transmission received over the link unkeys
;nolocallinkct = 0			; Send unlinkedct instead if another local node is connected to this node (hosted on the same PC).

; Supermon smlogger
connpgm=/usr/local/sbin/supermon/smlogger 1
discpgm=/usr/local/sbin/supermon/smlogger 0

;connpgm = yourconnectprogram		; Disabled. Execute a program you specify on connect. (default)
					; passes 2 command line arguments to your program:
					; 1. node number in this stanza (us)
					; 2. node number being connected to us (them)
;discpgm = yourdisconnectprogram	; Disabled. Execute a program you specify on disconnect. (default)
					; passes 2 command line arguments to your program:
					; 1. node number in this stanza (us)
					; 2. node number being disconnected from us (them)

;lnkactenable = 0			; Set to 1 to enable the link activity timer. Applicable to standard nodes only.

;lnkacttime = 1800			; Link activity timer time in seconds.
;lnkactmacro = *52			; Function to execute when link activity timer expires.
;lnkacttimerwarn = 30seconds		; Message to play when the link activity timer has 30 seconds left.

;remote_inact_timeout =			; Specifies the amount of time without keying from the link. Set to 0 to disable timeout. (15 * 60)
;remote_timeout =			; Session time out for remote base. Set to 0 to disable. (60 * 60)
;remote_timeout_warning_freq =		; 30
;remote_timeout_warning =		; (3 * 60)

;nounkeyct = 0				; Set to a 1 to eliminate courtesy tones and associated delays.

holdofftelem = 0			; Hold off all telemetry when signal is present on receiver or from connected nodes
					; except when an ID needs to be done and there is a signal coming from a connected node.

telemdefault = 1                        ; 0 = telemetry output off
                                        ; 1 = telemetry output on (default = 1)
                                        ; 2 = timed telemetry output on command execution and for a short time thereafter.

telemdynamic = 1                        ; 0 = disallow users to change the local telemetry setting with a COP command,
                                        ; 1 = Allow users to change the setting with a COP command. (default = 1)

;beaconing = 0				; Send ID regardless of repeater activity (Required in the UK, but probably illegal in the US)

parrotmode = 0				; 0 = Parrot Off (default = 0)
					; 1 = Parrot On Command
					; 2 = Parrot Always
					; 3 = Parrot Once by Command

parrottime = 1000			; Set the amount of time in milliseconds
					; to wait before parroting what was received

;rxnotch=1065,40                        ; (Optional) Notch a particular frequency for a specified
                                        ; b/w. app_rpt must have been compiled with
                                        ; the notch option

startup_macro =

; nodenames = /var/lib/asterisk/sounds/rpt/nodenames.callsign	; Point to alternate nodename sound directory

; Stream your node audio to Broadcastify or similar. See https://wiki.allstarlink.org/wiki/Stream_Node_Audio_to_Broadcastify
; outstreamcmd = /bin/sh,-c,/usr/bin/lame --preset cbr 16 -r -m m -s 8 --bitwidth 16 - - | /usr/bin/ezstream -qvc /etc/ezstream.xml

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Need more information on these

;extnodes = extnodes-different	; section in extnodefile containing dynamic node information (optional)
;extnodefile = /foo/nodes	; Points to nodelist file containing dynamic node info default = /var/lib/asterisk/rpt_extnodes (optional)
;extnodefile2 =			; Is this a list of node files? Possible a list of private nodes or a list of static IPs for known nodes????
;nodenames = /foo/names         ; locaton of node sound files default = /var/lib/asterisk/sounds/rpt/nodenames
;archivedir = /tmp              ; defines and enables activity recording into specified directory (optional)
;monminblocks = 2048            ; Min 1K blocks to be left on partition (will not save monitor output if disk too full)

;                               ; The tailmessagetime,tailsquashedtime, and tailmessagelist need to be set
;                               ; to support tail messages. They can be omitted otherwise.
;tailmessagetime = 300000       ; Play a tail message every 5 mins
;tailsquashedtime = 30000       ; If squashed by another user,
;                               ; try again after 30 seconds
;tailmessagelist = msg1,msg2    ; list of messages to be played for tail message

; alt_functions
; ctgroup
; dphone_functions
; idtime
; iobase
; iospeed
; locallist
; mars		Remote Base
; memory
; nobusyout
; nodes
; nolocallinkct
; notelemtx
; outxlat
; parrot
; propagate_phonedtmf
; rptnode
; rptinactmacro  Macro to execute when inactivity timer expires
; rptinacttime   Inactivity timer time in seconds  (0 seconds disables feature)
; rxnotch	Optional Audio notch
; simplexphonedelay
; tonemacro
; tonezone
; txlimits


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; *** Status Reporting ***

; Comment the following statpost line stop to reporting of the status of your node to stats.allstarlink.org
statpost_url = http://stats.allstarlink.org/uhandler ; Status updates

[functions]

; Prefix	Functions
; *1		Disconnect Link
; *2		Monitor Link
; *3		Connect Link
; *4		Command Mode
; *5		Macros
; *6		User Functions
; *7		Connection Status/Functions
; *8		User Functions
; *9		User Functions
; *0		User Functions

; *A		User Functions
; *B		User Functions
; *C		User Functions
; *D		User Functions


; Mandatory Command Codes
1 = ilink,1		; Disconnect specified link
2 = ilink,2		; Connect specified link -- monitor only
3 = ilink,3		; Connect specified link -- tranceive
4 = ilink,4		; Enter command mode on specified link
70 = ilink,5		; System status
99 = cop,6              ; PTT (phone mode only)

; End Mandatory Command Codes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Macro Commands
5 = macro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Autopatch Commands
; Note, This may be a good place for other 2 digit frequently used commands

61 = autopatchup,noct = 1,farenddisconnect = 1,dialtime = 20000  ; Autopatch up
62 = autopatchdn                                                 ; Autopatch down

; autopatchup can optionally take comma delimited setting=value pairs:

; context = string		; Override default context with "string"
; dialtime = ms			; Specify the max number of milliseconds between phone number digits (1000 milliseconds = 1 second)
; farenddisconnect = 1		; Automatically disconnect when called party hangs up
; noct = 1			; Don't send repeater courtesy tone during autopatch calls
; quiet = 1			; Don't send dial tone, or connect messages. Do not send patch down message when called party hangs up
				; Example: 123=autopatchup,dialtime=20000,noct=1,farenddisconnect=1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Status Commands

; 1 - Force ID (global)
; 2 - Give Time of Day (global)
; 3 - Give software Version (global)
; 4 - Give GPS location info
; 5 - Last (dtmf) user
; 11 - Force ID (local only)
; 12 - Give Time of Day (local only)

721 = status,1          ; Force ID (global)
722 = status,2          ; Give Time of Day (global)
723 = status,3          ; Give software Version (global)
724 = status,4          ; Give GPS location info
725 = status,5          ; Last (dtmf) user
711 = status,11         ; Force ID (local only)
712 = status,12         ; Give Time of Day (local only)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Link Commands

; 1 - Disconnect specified link
; 2 - Connect specified link -- monitor only
; 3 - Connect specified link -- tranceive
; 4 - Enter command mode on specified link
; 5 - System status
; 6 - Disconnect all links
; 7 - Last Node to Key Up
; 8 - Connect specified link -- local monitor only
; 9 - Send Text Message (9,<destnodeno or 0 (for all)>,Message Text, etc.
; 10 - Disconnect all RANGER links (except permalinks)
; 11 - Disconnect a previously permanently connected link
; 12 - Permanently connect specified link -- monitor only
; 13 - Permanently connect specified link -- tranceive
; 15 - Full system status (all nodes)
; 16 - Reconnect links disconnected with "disconnect all links"
; 17 - MDC test (for diag purposes)
; 18 - Permanently Connect specified link -- local monitor only

; ilink commands 1 through 5 are defined in the Mandatory Command section

76 = ilink,6
806 = ilink,6			; Disconnect all links
807 = ilink,7			; Last Node to Key Up
808 = ilink,8			; Connect specified link -- local monitor only
809 = ilink,9,1999,"Testing"	; would send a text message to node 1999 replace 1999 with 0 for all connected nodes
810 = ilink,10			; Disconnect all RANGER links (except permalinks)
811 = ilink,11			; Disconnect a previously permanently connected link
812 = ilink,12			; Permanently connect specified link -- monitor only
813 = ilink,13			; Permanently connect specified link -- tranceive
815 = ilink,15			; Full system status (all nodes)
816 = ilink,16			; Reconnect links disconnected with "disconnect all links"
817 = ilink,17			; MDC test (for diag purposes)
818 = ilink 18			; Permanently Connect specified link -- local monitor only

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Control operator (cop) functions.
; Change these to something other than these codes listed below!
; Uncomment as needed.

; 901 = cop,1				; System warm boot
; 902 = cop,2				; System enable
; 903 = cop,3				; System disable

; 904 = cop,4				; Test tone on/off (toggle)
; 905 = cop,5				; Dump system variables on console (debug use only)

; 907 = cop,7				; Time out timer enable
; 908 = cop,8				; Time out timer disable

; 909 = cop,9				; Autopatch enable
; 910 = cop,10				; Autopatch disable

; 911 = cop,11				; User linking functions enable
; 912 = cop,12				; User linking functions disable

; 913 = cop,13				; Query system control state
; 914 = cop,14				; Set system control state

; 915 = cop,15				; Scheduler enable
; 916 = cop,16				; Scheduler disable

; 917 = cop,17				; User functions enable (time, id, etc)
; 918 = cop,18				; User functions disable

; 919 = cop,19				; Select alternate hang time (althangtime)
; 920 = cop,20				; Select standard hangtime (hangtime)

; 921 = cop,21				; Enable Parrot Mode
; 922 = cop,22				; Disable Parrot Mode
; 923 = cop,23				; Birdbath (Current Parrot Cleanup/Flush)

; 924 = cop,24				; Flush all telemetry
; 925 = cop,25				; Query last node un-keyed
; 926 = cop,26				; Query all nodes keyed/unkeyed
; 927 = cop,27				; Reset DAQ minimum on a pin
; 928 = cop,28				; Reset DAQ maximum on a pin

; 930 = cop,30				; Recall Memory Setting in Attached Xcvr

; 931 = cop,31				; Channel Selector for Parallel Programmed Xcvr

; 932 = cop,32				; Touchtone pad test: command + Digit string + # to playback all digits pressed

; 933 = cop,33				; Local Telemetry Output Enable
; 934 = cop,34				; Local Telemetry Output Disable
; 935 = cop,35				; Local Telemetry Output on Demand

; 936 = cop,36				; Foreign Link Local Output Path Enable
; 937 = cop,37				; Foreign Link Local Output Path Disable
; 938 = cop,38				; Foreign Link Local Output Path Follows Local Telemetry
; 939 = cop,39				; Foreign Link Local Output Path on Demand

; 942 = cop,42				; Echolink announce node # only
; 943 = cop,43				; Echolink announce node Callsign only
; 944 = cop,44				; Echolink announce node # & Callsign

; 945 = cop,45				; Link Activity timer enable
; 945 = cop,46				; Link Activity timer disable
; 947 = cop,47				; Reset "Link Config Changed" Flag

; 948 = cop,48				; Send Page Tone (Tone specs separated by parenthesis)

; 949 = cop,49				; Disable incoming connections (control state noice)
; 950 = cop,50				; Enable incoming connections (control state noicd)

; 951 = cop,51				; Enable sleep mode
; 952 = cop,52				; Disable sleep mode
; 953 = cop,53				; Wake up from sleep
; 954 = cop,54				; Go to sleep
; 955 = cop,55				; Parrot Once if parrot mode is disabled

; 956 = cop,56                            ; Rx CTCSS Enable
; 957 = cop,57                            ; Rx CTCSS Disable

; 958 = cop.58                            ; Tx CTCSS On Input only Enable
; 959 = cop,59                            ; Tx CTCSS On Input only Disable

; 960 = cop,60                            ; Send MDC-1200 Burst (cop,60,type,UnitID[,DestID,SubCode])
;                                         ; Type is 'I' for PttID, 'E' for Emergency, and 'C' for Call
;                                         ; (SelCall or Alert), or 'SX' for STS (ststus), where X is 0-F.
;                                         ; DestID and subcode are only specified for  the 'C' type message.
;                                         ; UnitID is the local systems UnitID. DestID is the MDC1200 ID of
;                                         ; the radio being called, and the subcodes are as follows:
;                                         ; Subcode '8205' is Voice Selective Call for Spectra ('Call')
;                                         ; Subcode '8015' is Voice Selective Call for Maxtrac ('SC') or
;                                         ; Astro-Saber('Call')
;                                         ; Subcode '810D' is Call Alert (like Maxtrac 'CA')

; 961 = cop,61                            ; Send Message to USB to control GPIO pins (cop,61,GPIO1=0[,GPIO4=1].....)
; 962 = cop,62                            ; Send Message to USB to control GPIO pins, quietly (cop,62,GPIO1=0[,GPIO4=1].....)

; 963 = cop,63                            ; Send pre-configred APRSTT notification (cop,63,CALL[,OVERLAYCHR])
; 964 = cop,64                            ; Send pre-configred APRSTT notification, quietly (cop,64,CALL[,OVERLAYCHR])
; 965 = cop,65                            ; Send POCSAG page (equipped channel types only)

[functions-remote]

0 = remote,1                            ; Retrieve Memory
1 = remote,2                            ; Set freq.
2 = remote,3                            ; Set tx PL tone
3 = remote,4                            ; Set rx PL tone
40 = remote,100                         ; Rx PL off
41 = remote,101                         ; Rx PL on
42 = remote,102                         ; Tx PL off
43 = remote,103                         ; Tx PL on
44 = remote,104                         ; Low Power
45 = remote,105                         ; Medium Power
46 = remote,106                         ; High Power
711 = remote,107                        ; Bump -20
714 = remote,108                        ; Bump -100
717 = remote,109                        ; Bump -500
713 = remote,110                        ; Bump +20
716 = remote,111                        ; Bump +100
719 = remote,112                        ; Bump +500
721 = remote,113                        ; Scan - slow
724 = remote,114                        ; Scan - quick
727 = remote,115                        ; Scan - fast
723 = remote,116                        ; Scan + slow
726 = remote,117                        ; Scan + quick
729 = remote,118                        ; Scan + fast
79 = remote,119                         ; Tune
51 = remote,5                           ; Long status query
52 = remote,140				; Short status query
67 = remote,210				; Send a *
69 = remote,211				; Send a #
;91 = remote,99,CALLSIGN,LICENSETAG     ; Remote base login.
                                        ; Define a different dtmf sequence for each user which is
                                        ; authorized to use the remote base to control access to it.
                                        ; For examble 9139583=remote,99,WB6NIL,G would grant access to
                                        ; the remote base and announce WB6NIL as being logged in.
                                        ; Another entry, 9148351=remote,99,WA6ZFT,E would grant access to
                                        ; the remote base and announce WA6ZFT as being logged in.
                                        ; When the remote base is disconnected from the originating node, the
                                        ; user will be logged out. The LICENSETAG argument is used to enforce
					; tx frequency limits. See [txlimits] below.
85 = cop,6                              ; Remote base telephone key


[telemetry]

; Telemetry entries can be shared across all repeaters, or defined for each repeater.
; Can be a tone sequence, morse string, or a file
;
; |t - Tone escape sequence
;
; Tone sequences consist of 1 or more 4-tuple entries (freq1, freq2, duration, amplitude)
; Single frequencies are created by setting freq1 or freq2 to zero.
;
; |m - Morse escape sequence
;
; Sends Morse code at the telemetry amplitude and telemetry frequency as defined in the
; [morse] section.
;
; Follow with an alphanumeric string
;
; |i - Morse ID escape sequence
;
; Sends Morse code at the ID amplitude and ID frequency as defined in the
; [morse] section.
;
; path/to/sound/file/without/extension
;
; Send the sound if in place of a constructed tone. Do not include the file extension
; Example: ct8 = rpt/bloop
; Example: idrecording = rpt/nodenames/1999

ct1 = |t(350,0,100,2048)(500,0,100,2048)(660,0,100,2048)
ct2 = |t(660,880,150,2048)
ct3 = |t(440,0,150,4096)
ct4 = |t(550,0,150,2048)
ct5 = |t(660,0,150,2048)
ct6 = |t(880,0,150,2048)
ct7 = |t(660,440,150,2048)
ct8 = |t(700,1100,150,2048)
ranger = |t(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,50,0)(1800,0,60,3072)(0,0,150,0)
remotemon = |t(1209,0,50,2048)                                  ; local courtesy tone when receive only
remotetx = |t(1633,0,50,3000)(0,0,80,0)(1209,0,50,3000)		; local courtesy tone when linked Trancieve mode
cmdmode = |t(900,903,200,2048)
functcomplete = |t(1000,0,100,2048)(0,0,100,0)(1000,0,100,2048)
remcomplete = |t(650,0,100,2048)(0,0,100,0)(650,0,100,2048)(0,0,100,0)(650,0,100,2048)
pfxtone = |t(350,440,30000,3072)
patchup = rpt/callproceeding
patchdown = rpt/callterminated

; As far as what the numbers mean,
; (000,000,010,000)
;   |   |   |   |-------amplitude
;   |   |   |-------------duration
;   |   |-------------------Tone 2
;   |-------------------------Tone 1

; So, with 0,0,10,0 That says No Tone1, No Tone2, 10ms duration, 0 Amplitude.
; Use it for a delay.  Fine tuning for how long before telemetry is sent, in conjunction with the telemdelay parameter)
; The numbers, like 350,440,10,2048 are 350Hz, 440Hz, 10ms delay, amplitude of 2048.

; Morse code parameters, these are common to all repeaters.

[morse]
speed = 20				; Approximate speed in WPM
frequency = 800				; Morse Telemetry Frequency
amplitude = 4096			; Morse Telemetry Amplitude
idfrequency = 1065			; Morse ID Frequency
idamplitude = 1024			; Morse ID Amplitude

;
; This section allows wait times for telemetry events to be adjusted
; A section for wait times can be defined for every repeater
;

[wait-times]
telemwait = 2000                        ; Time to wait before sending most telemetry
idwait = 500                            ; Time to wait before starting ID
unkeywait = 2000                        ; Time to wait after unkey before sending CT's and link telemetry
calltermwait = 2000                     ; Time to wait before announcing "call terminated"

; Memories for remote bases

[memory]
;00 = 146.580,100.0,m
;01 = 147.030,103.5,m+t
;02 = 147.240,103.5,m+t
;03 = 147.765,79.7,m-t
;04 = 146.460,100.0,m
;05 = 146.550,100.0,m

; Place command macros here

[macro]
;1 = *32011#
;2 = *12001*12011*12043*12040*12050*12060*12009*12002*12003*12004*1113*12030#
;3 = *32001*32011*32050*32030*32060#


; Data Acquisition configuration

;[daq-list]
;device = device_name1
;device = device_name2

;Where: device_name1 and device_name2 are stanzas you define in this file

;device = daq-cham-1

; Device name

;[daq-cham-1]				; Defined in [daq-list]
;hwtype = uchameleon			; DAQ hardware type
;devnode = /dev/ttyUSB0			; DAQ device node (if required)
;1 = inadc				; Pin definition for an ADC channel
;2 = inadc
;3 = inadc
;4 = inadc
;5 = inadc
;6 = inadc
;7 = inadc
;8 = inadc
;9 = inp				; Pin definition for an input with a weak pullup resistor
;10 = inp
;11 = inp
;12 = inp
;13 = in				; Pin definition for an input without a weak pullup resistor
;14 = out				; Pin definition for an output
;15 = out
;16 = out
;17 = out
;18 = out

;[meter-faces]

;face = scale(scalepre,scalediv,scalepost),word/?,...
;
; scalepre = offset to add before dividing with scalediv
; scalediv = full scale/number of whole units (e.g. 256/20 or 12.8 for 20 volts).
; scalepost = offset to add after dividing with scalediv
;
;face = range(X-Y:word,X2-Y2:word,...),word/?,...
;face = bit(low-word,high-word),word/?,...
;
; word/? is either a word in /var/lib/asterisk/sounds or one of its subdirectories,
; or a question mark which is  a placeholder for the measured value.
;
;
; Battery voltage 0-20 volts
;batvolts = scale(0,12.8,0),rpt/thevoltageis,?,ha/volts
; 4 quadrant wind direction
;winddir = range(0-33:north,34-96:west,97-160:south,161-224:east,225-255:north),rpt/thewindis,?
; LM34 temperature sensor with 130 deg. F full scale
;lm34f = scale(0,1.969,0),rpt/thetemperatureis,?,degrees,fahrenheit
; Status poll (non alarmed)
;light = bit(ha/off,ha/on),ha/light,?

;[alarms]
;
;tag = device,pin,node,ignorefirst,func-low,func-hi
;
;tag = a unique name for the alarm
;device = daq device to poll
;pin = the device pin to be monitored
;ignorefirstalarm = set to 1 to throwaway first alarm event, or 0 to report it
;node = the node number to execute the function on
;func-low = the DTMF function to execute on a high to low transition
;func-high = the DTMF function to execute on a low to high transition
;
; a  '-' as a function name is shorthand for no-operation
;
;door = daq-cham-1,9,1,2017,*7,-
;pwrfail = daq-cham-1,10,0,2017,*911111,-
;
; Control states
; Allow several control operator functions to be changed at once using one command (good for scheduling)
;
;[controlstates]
;statenum = copcmd,[copcmd]...
;0 = rptena,lnkena,apena,totena,ufena,noicd  ; Normal operation
;1 = rptena,lnkena,apdis,totdis,ufena,noice  ; Net and news operation
;2 = rptena,lnkdis,apdis,totena,ufdis,noice  ; Repeater only operation

; Scheduler - execute a macro at a given time

[schedule]
;dtmf_function =  m h dom mon dow  ; ala cron, star is implied
;2 = 00 00 * * *   ; at midnight, execute macro 2.

; See https://wiki.allstarlink.org/wiki/Event_Management
[events]

#includeifexists custom/rpt.conf
EOF

cat << EOF > /etc/asl/user1/iax.conf
; Inter-Asterisk eXchange driver definition

[general]
; !!! Change this to match your node registration !!!
; register=1999:123456@register.allstarlink.org    ; This must be changed to your node number, password 
; remove the leading ";"

bindport = 4569    ; bindport and bindaddr may be specified

; NOTE: bindport must be specified BEFORE
; bindaddr or may be specified on a specific
; bindaddr if followed by colon and port
;  (e.g. bindaddr=192.168.0.1:4569)

; bindaddr = 192.168.0.1    ; more than once to bind to multiple
                                ; addresses, but the first will be the 
                                ; default

disallow = all    ; The permitted codecs for outgoing connections 
    ; Audio Quality    Bandwidth
;allow = ulaw    ; best    87 kbps
;allow = adpcm    ; good    55 kbps
;allow = gsm    ; medicore    36 kbps
allow = ulaw
allow = adpcm
allow = g722
allow = g726aal2
allow = gsm
allow = ilbc


jitterbuffer = yes                                                                
forcejitterbuffer = yes                                                           
dropcount = 2                                                                     
maxjitterbuffer = 4000                                                            
maxjitterinterps = 10                                                             
resyncthreshold = 1000                                                            
maxexcessbuffer = 80                                                              
minexcessbuffer = 10                                                              
jittershrinkrate = 1                                                              
tos = 0x1E                                                                  
autokill = yes                                                                    
delayreject = yes                                                                 
; iaxthreadcount = 30                                                              
; iaxmaxthreadcount = 150   


; Incoming radio connections

[radio]
type = user
disallow = all
allow = ulaw
allow = adpcm
allow = g722
allow = g726aal2
allow = gsm
allow = ilbc
codecpriority = host
context = radio-secure
transfer = no

[iaxrpt]                            ; Connect from iaxrpt Username field (PC AllStar Client)
type = user                           ; Notice type is user here <---------------
context = iaxrpt    ; Context to jump to in extensions.conf
auth = md5
secret = Your_Secret_Pasword_Here
host = dynamic
disallow = all                    
allow = ulaw
allow = adpcm
allow = gsm                       
transfer = no

[iaxclient]                         ; Connect from iax client (Zoiper...)
type = friend                         ; Notice type here is friend <--------------
context = iax-client                  ; Context to jump to in extensions.conf
auth = md5
secret = Your_Secret_Password_Here
host = dynamic
disallow = all
allow = ulaw
allow = adpcm
allow = gsm
transfer = no

[allstar-sys]
type = user
context = allstar-sys
auth = rsa
inkeys = allstar
disallow = all
allow = ulaw

[allstar-public]
type = user
context = allstar-public
auth = md5
secret = allstar
disallow = all
allow = ulaw
allow = gsm

; The following should be un-commented to support Allstar Autopatch service
; [allstar-autopatch]
; type = peer
; host = register.allstarlink.org
; username = <One of the Node numbers on this server>
; secret = <The node password for the above node>
; auth = md5
; disallow = all
; allow = ulaw
; transfer = no

#includeifexists custom/iax.conf
EOF

cat << EOF > /etc/asl/user2/iax.conf
; Inter-Asterisk eXchange driver definition

[general]
; !!! Change this to match your node registration !!!
; register=1999:123456@register.allstarlink.org    ; This must be changed to your node number, password 
; remove the leading ";"

bindport = 4569    ; bindport and bindaddr may be specified

; NOTE: bindport must be specified BEFORE
; bindaddr or may be specified on a specific
; bindaddr if followed by colon and port
;  (e.g. bindaddr=192.168.0.1:4569)

; bindaddr = 192.168.0.1    ; more than once to bind to multiple
                                ; addresses, but the first will be the 
                                ; default

disallow = all    ; The permitted codecs for outgoing connections 
    ; Audio Quality    Bandwidth
;allow = ulaw    ; best    87 kbps
;allow = adpcm    ; good    55 kbps
;allow = gsm    ; medicore    36 kbps
allow = ulaw
allow = adpcm
allow = g722
allow = g726aal2
allow = gsm
allow = ilbc


jitterbuffer = yes                                                                
forcejitterbuffer = yes                                                           
dropcount = 2                                                                     
maxjitterbuffer = 4000                                                            
maxjitterinterps = 10                                                             
resyncthreshold = 1000                                                            
maxexcessbuffer = 80                                                              
minexcessbuffer = 10                                                              
jittershrinkrate = 1                                                              
tos = 0x1E                                                                  
autokill = yes                                                                    
delayreject = yes                                                                 
; iaxthreadcount = 30                                                              
; iaxmaxthreadcount = 150   


; Incoming radio connections

[radio]
type = user
disallow = all
allow = ulaw
allow = adpcm
allow = g722
allow = g726aal2
allow = gsm
allow = ilbc
codecpriority = host
context = radio-secure
transfer = no

[iaxrpt]                            ; Connect from iaxrpt Username field (PC AllStar Client)
type = user                           ; Notice type is user here <---------------
context = iaxrpt    ; Context to jump to in extensions.conf
auth = md5
secret = Your_Secret_Pasword_Here
host = dynamic
disallow = all                    
allow = ulaw
allow = adpcm
allow = gsm                       
transfer = no

[iaxclient]                         ; Connect from iax client (Zoiper...)
type = friend                         ; Notice type here is friend <--------------
context = iax-client                  ; Context to jump to in extensions.conf
auth = md5
secret = Your_Secret_Password_Here
host = dynamic
disallow = all
allow = ulaw
allow = adpcm
allow = gsm
transfer = no

[allstar-sys]
type = user
context = allstar-sys
auth = rsa
inkeys = allstar
disallow = all
allow = ulaw

[allstar-public]
type = user
context = allstar-public
auth = md5
secret = allstar
disallow = all
allow = ulaw
allow = gsm

; The following should be un-commented to support Allstar Autopatch service
; [allstar-autopatch]
; type = peer
; host = register.allstarlink.org
; username = <One of the Node numbers on this server>
; secret = <The node password for the above node>
; auth = md5
; disallow = all
; allow = ulaw
; transfer = no

#includeifexists custom/iax.conf
EOF

cat << EOF > /etc/asl/user2/iax.conf
; Inter-Asterisk eXchange driver definition

[general]
; !!! Change this to match your node registration !!!
; register=1999:123456@register.allstarlink.org    ; This must be changed to your node number, password 
; remove the leading ";"

bindport = 4569    ; bindport and bindaddr may be specified

; NOTE: bindport must be specified BEFORE
; bindaddr or may be specified on a specific
; bindaddr if followed by colon and port
;  (e.g. bindaddr=192.168.0.1:4569)

; bindaddr = 192.168.0.1    ; more than once to bind to multiple
                                ; addresses, but the first will be the 
                                ; default

disallow = all    ; The permitted codecs for outgoing connections 
    ; Audio Quality    Bandwidth
;allow = ulaw    ; best    87 kbps
;allow = adpcm    ; good    55 kbps
;allow = gsm    ; medicore    36 kbps
allow = ulaw
allow = adpcm
allow = g722
allow = g726aal2
allow = gsm
allow = ilbc


jitterbuffer = yes                                                                
forcejitterbuffer = yes                                                           
dropcount = 2                                                                     
maxjitterbuffer = 4000                                                            
maxjitterinterps = 10                                                             
resyncthreshold = 1000                                                            
maxexcessbuffer = 80                                                              
minexcessbuffer = 10                                                              
jittershrinkrate = 1                                                              
tos = 0x1E                                                                  
autokill = yes                                                                    
delayreject = yes                                                                 
; iaxthreadcount = 30                                                              
; iaxmaxthreadcount = 150   


; Incoming radio connections

[radio]
type = user
disallow = all
allow = ulaw
allow = adpcm
allow = g722
allow = g726aal2
allow = gsm
allow = ilbc
codecpriority = host
context = radio-secure
transfer = no

[iaxrpt]                            ; Connect from iaxrpt Username field (PC AllStar Client)
type = user                           ; Notice type is user here <---------------
context = iaxrpt    ; Context to jump to in extensions.conf
auth = md5
secret = Your_Secret_Pasword_Here
host = dynamic
disallow = all                    
allow = ulaw
allow = adpcm
allow = gsm                       
transfer = no

[iaxclient]                         ; Connect from iax client (Zoiper...)
type = friend                         ; Notice type here is friend <--------------
context = iax-client                  ; Context to jump to in extensions.conf
auth = md5
secret = Your_Secret_Password_Here
host = dynamic
disallow = all
allow = ulaw
allow = adpcm
allow = gsm
transfer = no

[allstar-sys]
type = user
context = allstar-sys
auth = rsa
inkeys = allstar
disallow = all
allow = ulaw

[allstar-public]
type = user
context = allstar-public
auth = md5
secret = allstar
disallow = all
allow = ulaw
allow = gsm

; The following should be un-commented to support Allstar Autopatch service
; [allstar-autopatch]
; type = peer
; host = register.allstarlink.org
; username = <One of the Node numbers on this server>
; secret = <The node password for the above node>
; auth = md5
; disallow = all
; allow = ulaw
; transfer = no

#includeifexists custom/iax.conf
EOF

cat << EOF > /etc/asl/user1/extensions.conf
[general]

static = yes       ; These two lines prevent the command-line interface
writeprotect = yes ; from overwriting the config file. Leave them here.

[globals]
HOMENPA = 999 ; change this to your Area Code
NODE = 1999   ; change this to your node number

[default]

exten => i,1,Hangup

[radio-secure]
exten => ${NODE},1,rpt,${NODE}

[iaxrpt]                                ; entered from iaxrpt in iax.conf
exten => ${NODE},1,rpt(${NODE}|X)       ; NODE is the Name field in iaxrpt
                                        ; Info: The X option passed to the Rpt application
                                        ; disables the normal security checks.
                                        ; Because incoming connections are validated in iax.conf,
                                        ; and we don't know where the user will be coming from in advance,
                                        ; the X option is required.

[iax-client]				; for IAX VIOP clients.				
exten => ${NODE},1,Ringing
exten => ${NODE},n,Wait(3)
exten => ${NODE},n,Answer
exten => ${NODE},n,Set(NODENUM=${CALLERID(number)})
exten => ${NODE},n,Playback(rpt/node|noanswer)
exten => ${NODE},n,SayDigits(${EXTEN})
exten => ${NODE},n,Set(CALLERID(num)=0)
exten => ${NODE},n,Rpt,${NODE}|P|${CALLERID(name)}
exten => ${NODE},n,Hangup
exten => ${NODE},n(hangit),Answer
exten => ${NODE},n(hangit),Wait(1)
exten => ${NODE},n(hangit),Hangup

; Comment-out the following clause if you want Allstar Autopatch service
[pstn-out]
exten = _NXXNXXXXXX,1,playback(ss-noservice)
exten = _NXXNXXXXXX,2,Congestion

; Un-comment out the following clause if you want Allstar Autopatch service
;[pstn-out]
;exten = _NXXNXXXXXX,1,Dial(IAX2/allstar-autopatch/\${EXTEN})
;exten = _NXXNXXXXXX,2,Busy

[invalidnum]
exten = s,1,Wait,3
exten = s,n,Playback,ss-noservice
exten = s,n,Wait,1
exten =  s,n,Hangup

[radio]
exten = _X11,1,Goto(check_route|${EXTEN}|1);
exten = _NXXXXXX,1,Goto(check_route|1${HOMENPA}${EXTEN}|1)
exten = _1XXXXXXXXXX,1,Goto(check_route|${EXTEN}|1)
exten = _07XX,1,Goto(parkedcalls|${EXTEN:1}|1)
exten = 00,1,Goto(my-ip|s|1)

[check_route]
exten =_X.,1,Noop(${EXTEN})
; no 800
exten = _1800NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1888NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1877NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1866NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1855NXXXXXX,2,Goto(invalidnum|s|1)
; no X00 NPA
exten = _1X00XXXXXXX,2,Goto(invalidnum|s|1)
; no X11 NPA
exten = _1X11XXXXXXX,2,Goto(invalidnum|s|1)
; no X11 
exten = _X11,2,Goto(invalidnum|s|1)
; no 555 Prefix in any NPA
exten = _1NXX555XXXX,2,Goto(invalidnum|s|1)
; no 976 Prefix in any NPA
exten = _1NXX976XXXX,2,Goto(invalidnum|s|1)
; no NPA=809
exten = _1809XXXXXXX,2,Goto(invalidnum|s|1)
; no NPA=900
exten = _1900XXXXXXX,2,Goto(invalidnum|s|1)

; okay, route it
exten = _1NXXXXXXXXX,2,Goto(pstn-out|${EXTEN:1}|1)
exten = _X.,2,Goto(invalidnum|s|1)

[my-ip]
exten = s,1,Set(MYADDR=${CURL(http://myip.vg)})
exten = s,2,Wait,1
exten = s,3,SayAlpha(${MYADDR})
exten = s,4,Hangup

[allstar-sys]
exten => _1.,1,Rpt(${EXTEN:1}|Rrpt/node:NODE:rpt/in-call:digits/0:PARKED|120)
exten => _1.,n,Hangup

exten => _2.,1,Ringing
exten => _2.,n,Wait(3)
exten => _2.,n,Answer
exten => _2.,n,Playback(rpt/node)
exten => _2.,n,Saydigits(${EXTEN:1})
exten => _2.,n,Rpt(${EXTEN:1}|P|${CALLERID(name)}-P)
exten => _2.,n,Hangup

exten => _3.,1,Ringing
exten => _3.,n,Wait(3)
exten => _3.,n,Answer
exten => _3.,n,Playback(rpt/node)
exten => _3.,n,Saydigits(${EXTEN:1})
exten => _3.,n,Rpt(${EXTEN:1}|Pv|${CALLERID(name)}-P)
exten => _3.,n,Hangup

exten => _4.,1,Ringing
exten => _4.,n,Wait(3)
exten => _4.,n,Answer
exten => _4.,n,Playback(rpt/node)
exten => _4.,n,Saydigits(${EXTEN:1})
exten => _4.,n,Rpt(${EXTEN:1}|D|${CALLERID(name)}-P)
exten => _4.,n,Hangup

exten => _5.,1,Ringing
exten => _5.,n,Wait(3)
exten => _5.,n,Answer
exten => _5.,n,Playback(rpt/node)
exten => _5.,n,Saydigits(${EXTEN:1})
exten => _5.,n,Rpt(${EXTEN:1}|Dv|${CALLERID(name)}-P)
exten => _5.,n,Hangup

[allstar-public]

exten => s,1,Ringing
exten => s,n,Set(RESP=${CURL(https://register.allstarlink.org/cgi-bin/authwebphone.pl?${CALLERID(name)})})
exten => s,n,Set(NODENUM=${CALLERID(number)})
exten => s,n,GotoIf($["${RESP:0:1}" = "?"]?hangit)
exten => s,n,GotoIf($["${RESP:0:1}" = ""]?hangit)
exten => s,n,GotoIf($["${RESP:0:5}" != "OHYES"]?hangit)
exten => s,n,Set(CALLSIGN=${RESP:5})
exten => s,n,Wait(3)
exten => s,n,Playback(rpt/node|noanswer)
exten => s,n,Saydigits(${NODENUM})
exten => s,n,Set(CALLERID(name)=${CALLSIGN})
exten => s,n,Set(CALLERID(num)=0)
exten => s,n,Rpt(${NODENUM}|X)
exten => s,n,Hangup
exten => s,n(hangit),Answer
exten => s,n(hangit),Wait(1)
exten => s,n(hangit),Hangup

#includeifexists custom/extensions.conf
EOF

cat << EOF > /etc/asl/user2/extensions.conf
[general]

static = yes       ; These two lines prevent the command-line interface
writeprotect = yes ; from overwriting the config file. Leave them here.

[globals]
HOMENPA = 999 ; change this to your Area Code
NODE = 1999   ; change this to your node number

[default]

exten => i,1,Hangup

[radio-secure]
exten => ${NODE},1,rpt,${NODE}

[iaxrpt]                                ; entered from iaxrpt in iax.conf
exten => ${NODE},1,rpt(${NODE}|X)       ; NODE is the Name field in iaxrpt
                                        ; Info: The X option passed to the Rpt application
                                        ; disables the normal security checks.
                                        ; Because incoming connections are validated in iax.conf,
                                        ; and we don't know where the user will be coming from in advance,
                                        ; the X option is required.

[iax-client]				; for IAX VIOP clients.				
exten => ${NODE},1,Ringing
exten => ${NODE},n,Wait(3)
exten => ${NODE},n,Answer
exten => ${NODE},n,Set(NODENUM=${CALLERID(number)})
exten => ${NODE},n,Playback(rpt/node|noanswer)
exten => ${NODE},n,SayDigits(${EXTEN})
exten => ${NODE},n,Set(CALLERID(num)=0)
exten => ${NODE},n,Rpt,${NODE}|P|${CALLERID(name)}
exten => ${NODE},n,Hangup
exten => ${NODE},n(hangit),Answer
exten => ${NODE},n(hangit),Wait(1)
exten => ${NODE},n(hangit),Hangup

; Comment-out the following clause if you want Allstar Autopatch service
[pstn-out]
exten = _NXXNXXXXXX,1,playback(ss-noservice)
exten = _NXXNXXXXXX,2,Congestion

; Un-comment out the following clause if you want Allstar Autopatch service
;[pstn-out]
;exten = _NXXNXXXXXX,1,Dial(IAX2/allstar-autopatch/\${EXTEN})
;exten = _NXXNXXXXXX,2,Busy

[invalidnum]
exten = s,1,Wait,3
exten = s,n,Playback,ss-noservice
exten = s,n,Wait,1
exten =  s,n,Hangup

[radio]
exten = _X11,1,Goto(check_route|${EXTEN}|1);
exten = _NXXXXXX,1,Goto(check_route|1${HOMENPA}${EXTEN}|1)
exten = _1XXXXXXXXXX,1,Goto(check_route|${EXTEN}|1)
exten = _07XX,1,Goto(parkedcalls|${EXTEN:1}|1)
exten = 00,1,Goto(my-ip|s|1)

[check_route]
exten =_X.,1,Noop(${EXTEN})
; no 800
exten = _1800NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1888NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1877NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1866NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1855NXXXXXX,2,Goto(invalidnum|s|1)
; no X00 NPA
exten = _1X00XXXXXXX,2,Goto(invalidnum|s|1)
; no X11 NPA
exten = _1X11XXXXXXX,2,Goto(invalidnum|s|1)
; no X11 
exten = _X11,2,Goto(invalidnum|s|1)
; no 555 Prefix in any NPA
exten = _1NXX555XXXX,2,Goto(invalidnum|s|1)
; no 976 Prefix in any NPA
exten = _1NXX976XXXX,2,Goto(invalidnum|s|1)
; no NPA=809
exten = _1809XXXXXXX,2,Goto(invalidnum|s|1)
; no NPA=900
exten = _1900XXXXXXX,2,Goto(invalidnum|s|1)

; okay, route it
exten = _1NXXXXXXXXX,2,Goto(pstn-out|${EXTEN:1}|1)
exten = _X.,2,Goto(invalidnum|s|1)

[my-ip]
exten = s,1,Set(MYADDR=${CURL(http://myip.vg)})
exten = s,2,Wait,1
exten = s,3,SayAlpha(${MYADDR})
exten = s,4,Hangup

[allstar-sys]
exten => _1.,1,Rpt(${EXTEN:1}|Rrpt/node:NODE:rpt/in-call:digits/0:PARKED|120)
exten => _1.,n,Hangup

exten => _2.,1,Ringing
exten => _2.,n,Wait(3)
exten => _2.,n,Answer
exten => _2.,n,Playback(rpt/node)
exten => _2.,n,Saydigits(${EXTEN:1})
exten => _2.,n,Rpt(${EXTEN:1}|P|${CALLERID(name)}-P)
exten => _2.,n,Hangup

exten => _3.,1,Ringing
exten => _3.,n,Wait(3)
exten => _3.,n,Answer
exten => _3.,n,Playback(rpt/node)
exten => _3.,n,Saydigits(${EXTEN:1})
exten => _3.,n,Rpt(${EXTEN:1}|Pv|${CALLERID(name)}-P)
exten => _3.,n,Hangup

exten => _4.,1,Ringing
exten => _4.,n,Wait(3)
exten => _4.,n,Answer
exten => _4.,n,Playback(rpt/node)
exten => _4.,n,Saydigits(${EXTEN:1})
exten => _4.,n,Rpt(${EXTEN:1}|D|${CALLERID(name)}-P)
exten => _4.,n,Hangup

exten => _5.,1,Ringing
exten => _5.,n,Wait(3)
exten => _5.,n,Answer
exten => _5.,n,Playback(rpt/node)
exten => _5.,n,Saydigits(${EXTEN:1})
exten => _5.,n,Rpt(${EXTEN:1}|Dv|${CALLERID(name)}-P)
exten => _5.,n,Hangup

[allstar-public]

exten => s,1,Ringing
exten => s,n,Set(RESP=${CURL(https://register.allstarlink.org/cgi-bin/authwebphone.pl?${CALLERID(name)})})
exten => s,n,Set(NODENUM=${CALLERID(number)})
exten => s,n,GotoIf($["${RESP:0:1}" = "?"]?hangit)
exten => s,n,GotoIf($["${RESP:0:1}" = ""]?hangit)
exten => s,n,GotoIf($["${RESP:0:5}" != "OHYES"]?hangit)
exten => s,n,Set(CALLSIGN=${RESP:5})
exten => s,n,Wait(3)
exten => s,n,Playback(rpt/node|noanswer)
exten => s,n,Saydigits(${NODENUM})
exten => s,n,Set(CALLERID(name)=${CALLSIGN})
exten => s,n,Set(CALLERID(num)=0)
exten => s,n,Rpt(${NODENUM}|X)
exten => s,n,Hangup
exten => s,n(hangit),Answer
exten => s,n(hangit),Wait(1)
exten => s,n(hangit),Hangup

#includeifexists custom/extensions.conf
EOF

cat << EOF > /etc/asl/user3/extensions.conf
[general]

static = yes       ; These two lines prevent the command-line interface
writeprotect = yes ; from overwriting the config file. Leave them here.

[globals]
HOMENPA = 999 ; change this to your Area Code
NODE = 1999   ; change this to your node number

[default]

exten => i,1,Hangup

[radio-secure]
exten => ${NODE},1,rpt,${NODE}

[iaxrpt]                                ; entered from iaxrpt in iax.conf
exten => ${NODE},1,rpt(${NODE}|X)       ; NODE is the Name field in iaxrpt
                                        ; Info: The X option passed to the Rpt application
                                        ; disables the normal security checks.
                                        ; Because incoming connections are validated in iax.conf,
                                        ; and we don't know where the user will be coming from in advance,
                                        ; the X option is required.

[iax-client]				; for IAX VIOP clients.				
exten => ${NODE},1,Ringing
exten => ${NODE},n,Wait(3)
exten => ${NODE},n,Answer
exten => ${NODE},n,Set(NODENUM=${CALLERID(number)})
exten => ${NODE},n,Playback(rpt/node|noanswer)
exten => ${NODE},n,SayDigits(${EXTEN})
exten => ${NODE},n,Set(CALLERID(num)=0)
exten => ${NODE},n,Rpt,${NODE}|P|${CALLERID(name)}
exten => ${NODE},n,Hangup
exten => ${NODE},n(hangit),Answer
exten => ${NODE},n(hangit),Wait(1)
exten => ${NODE},n(hangit),Hangup

; Comment-out the following clause if you want Allstar Autopatch service
[pstn-out]
exten = _NXXNXXXXXX,1,playback(ss-noservice)
exten = _NXXNXXXXXX,2,Congestion

; Un-comment out the following clause if you want Allstar Autopatch service
;[pstn-out]
;exten = _NXXNXXXXXX,1,Dial(IAX2/allstar-autopatch/\${EXTEN})
;exten = _NXXNXXXXXX,2,Busy

[invalidnum]
exten = s,1,Wait,3
exten = s,n,Playback,ss-noservice
exten = s,n,Wait,1
exten =  s,n,Hangup

[radio]
exten = _X11,1,Goto(check_route|${EXTEN}|1);
exten = _NXXXXXX,1,Goto(check_route|1${HOMENPA}${EXTEN}|1)
exten = _1XXXXXXXXXX,1,Goto(check_route|${EXTEN}|1)
exten = _07XX,1,Goto(parkedcalls|${EXTEN:1}|1)
exten = 00,1,Goto(my-ip|s|1)

[check_route]
exten =_X.,1,Noop(${EXTEN})
; no 800
exten = _1800NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1888NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1877NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1866NXXXXXX,2,Goto(invalidnum|s|1)
exten = _1855NXXXXXX,2,Goto(invalidnum|s|1)
; no X00 NPA
exten = _1X00XXXXXXX,2,Goto(invalidnum|s|1)
; no X11 NPA
exten = _1X11XXXXXXX,2,Goto(invalidnum|s|1)
; no X11 
exten = _X11,2,Goto(invalidnum|s|1)
; no 555 Prefix in any NPA
exten = _1NXX555XXXX,2,Goto(invalidnum|s|1)
; no 976 Prefix in any NPA
exten = _1NXX976XXXX,2,Goto(invalidnum|s|1)
; no NPA=809
exten = _1809XXXXXXX,2,Goto(invalidnum|s|1)
; no NPA=900
exten = _1900XXXXXXX,2,Goto(invalidnum|s|1)

; okay, route it
exten = _1NXXXXXXXXX,2,Goto(pstn-out|${EXTEN:1}|1)
exten = _X.,2,Goto(invalidnum|s|1)

[my-ip]
exten = s,1,Set(MYADDR=${CURL(http://myip.vg)})
exten = s,2,Wait,1
exten = s,3,SayAlpha(${MYADDR})
exten = s,4,Hangup

[allstar-sys]
exten => _1.,1,Rpt(${EXTEN:1}|Rrpt/node:NODE:rpt/in-call:digits/0:PARKED|120)
exten => _1.,n,Hangup

exten => _2.,1,Ringing
exten => _2.,n,Wait(3)
exten => _2.,n,Answer
exten => _2.,n,Playback(rpt/node)
exten => _2.,n,Saydigits(${EXTEN:1})
exten => _2.,n,Rpt(${EXTEN:1}|P|${CALLERID(name)}-P)
exten => _2.,n,Hangup

exten => _3.,1,Ringing
exten => _3.,n,Wait(3)
exten => _3.,n,Answer
exten => _3.,n,Playback(rpt/node)
exten => _3.,n,Saydigits(${EXTEN:1})
exten => _3.,n,Rpt(${EXTEN:1}|Pv|${CALLERID(name)}-P)
exten => _3.,n,Hangup

exten => _4.,1,Ringing
exten => _4.,n,Wait(3)
exten => _4.,n,Answer
exten => _4.,n,Playback(rpt/node)
exten => _4.,n,Saydigits(${EXTEN:1})
exten => _4.,n,Rpt(${EXTEN:1}|D|${CALLERID(name)}-P)
exten => _4.,n,Hangup

exten => _5.,1,Ringing
exten => _5.,n,Wait(3)
exten => _5.,n,Answer
exten => _5.,n,Playback(rpt/node)
exten => _5.,n,Saydigits(${EXTEN:1})
exten => _5.,n,Rpt(${EXTEN:1}|Dv|${CALLERID(name)}-P)
exten => _5.,n,Hangup

[allstar-public]

exten => s,1,Ringing
exten => s,n,Set(RESP=${CURL(https://register.allstarlink.org/cgi-bin/authwebphone.pl?${CALLERID(name)})})
exten => s,n,Set(NODENUM=${CALLERID(number)})
exten => s,n,GotoIf($["${RESP:0:1}" = "?"]?hangit)
exten => s,n,GotoIf($["${RESP:0:1}" = ""]?hangit)
exten => s,n,GotoIf($["${RESP:0:5}" != "OHYES"]?hangit)
exten => s,n,Set(CALLSIGN=${RESP:5})
exten => s,n,Wait(3)
exten => s,n,Playback(rpt/node|noanswer)
exten => s,n,Saydigits(${NODENUM})
exten => s,n,Set(CALLERID(name)=${CALLSIGN})
exten => s,n,Set(CALLERID(num)=0)
exten => s,n,Rpt(${NODENUM}|X)
exten => s,n,Hangup
exten => s,n(hangit),Answer
exten => s,n(hangit),Wait(1)
exten => s,n(hangit),Hangup

#includeifexists custom/extensions.conf
EOF

cat << EOF > /etc/asl/user1/modules.conf
;
; Asterisk configuration file
;
; Module Loader configuration file
;
; By default AllStarLink does NOT load every module, only what is needed

; You can enable or disable any of the asterisk modules
; All modules are compiled and installed.

; These are examples ONLY DO NOT UNCOMMENT them here. 

; You will want to enable the channel driver modules you will be using.
; They are below in the Channel Driver section
; The most common Channel drivers for app_rpt are:
; chan_echolink.so   echolink channel driver
; chan_simpleusb.so  Simple USB Radio Interface Channel Drive
; chan_usbradio.so   USB Console Channel Driver
; chan_usrp.so       USRP Channel Module
; chan_voter.so      radio Voter channel driver

; To enable a module: load => module_name.so
; To disable a module: noload => module_name.so


[modules]

autoload=no

; Applications

noload => app_adsiprog.so ;			Asterisk ADSI Programming Application             
noload => app_alarmreceiver.so ;		Alarm Receiver for Asterisk                       
noload => app_amd.so ;				Answering Machine Detection Application           
load => app_authenticate.so ;            	Authentication Application                        
noload => app_cdr.so ;				Tell Asterisk to not maintain a CDR for           
noload => app_chanisavail.so ;			Check channel availability                        
noload => app_channelredirect.so ;		Channel Redirect                                  
noload => app_chanspy.so ;			Listen to the audio of an active channel          
noload => app_controlplayback.so ;		Control Playback Application                      
noload => app_dahdibarge.so ;			Barge in on channel application                   
noload => app_dahdiras.so ;			DAHDI RAS Application                             
noload => app_dahdiscan.so ;			Scan Zap channels application                     
noload => app_db.so ;				Database Access Functions                         
load => app_dial.so ;				Dialing Application                               
noload => app_dictate.so ;			Virtual Dictation Machine                         
noload => app_directed_pickup.so ;		Directed Call Pickup Application                  
noload => app_directory.so ;			Extension Directory                               
noload => app_disa.so ;				DISA (Direct Inward System Access) Appli          
noload => app_dumpchan.so ;			Dump Info About The Calling Channel               
noload => app_echo.so ;				Simple Echo Application                           
load => app_exec.so ;				Executes dialplan applications                    
noload => app_externalivr.so ;			External IVR Interface Application                
noload => app_festival.so ;			Simple Festival Interface                         
noload => app_flash.so ;			Flash channel application                         
noload => app_followme.so ;			Find-Me/Follow-Me Application                     
noload => app_forkcdr.so ;			Fork The CDR into 2 separate entities             
noload => app_getcpeid.so ;			Get ADSI CPE ID                                   
noload => app_gps.so ;				GPS interface module                              
noload => app_hasnewvoicemail.so ;		Indicator for whether a voice mailbox ha          
noload => app_ices.so ;				Encode and Stream via icecast and ices            
noload => app_image.so ;			Image Transmission Application                    
noload => app_lookupblacklist.so ;		Look up Caller*ID name/number from black          
noload => app_lookupcidname.so ;		Look up CallerID Name from local databas          
load => app_macro.so ;				Extension Macros                                  
noload => app_meetme.so ;			MeetMe conference bridge                          
noload => app_milliwatt.so ;			Digital Milliwatt (mu-law) Test Applicat          
noload => app_mixmonitor.so ;			Mixed Audio Monitoring Application                
noload => app_morsecode.so ;			Morse code                                        
noload => app_mp3.so ;				Silly MP3 Application                             
noload => app_nbscat.so ;			Silly NBS Stream Application                      
noload => app_page.so ;				Page Multiple Phones                              
noload => app_parkandannounce.so ;		Call Parking and Announce Application             
load => app_playback.so ;			Sound File Playback Application                   
noload => app_privacy.so ;			Require phone number to be entered, if n          
noload => app_queue.so ;			True Call Queueing                                
noload => app_radbridge.so ;			Radio Bridging interface module                   
noload => app_random.so ;			Random goto                                       
noload => app_readfile.so ;			Stores output of file into a variable             
noload => app_read.so ;				Read Variable Application                         
noload => app_realtime.so ;			Realtime Data Lookup/Rewrite                      
noload => app_record.so ;			Trivial Record Application                        
load => app_rpt.so ;				Radio Repeater/Remote Base Application            
noload => app_sayunixtime.so ;			Say time                                          
noload => app_senddtmf.so ;			Send DTMF digits Application                      
load => app_sendtext.so ;			Send Text Applications                            
noload => app_setcallerid.so ;			Set CallerID Application                          
noload => app_setcdruserfield.so ;		CDR user field apps                               
noload => app_settransfercapability.so ;	Set ISDN Transfer Capability                      
noload => app_sms.so ;				SMS/PSTN handler                                  
noload => app_softhangup.so ;			Hangs up the requested channel                    
noload => app_speech_utils.so ;			Dialplan Speech Applications                      
noload => app_stack.so ;			Stack Routines                                    
load => app_system.so ;				Generic System() application                      
noload => app_talkdetect.so ;			Playback with Talk Detection                      
noload => app_test.so ;				Interface Test Application                        
load => app_transfer.so ;			Transfer                                          
noload => app_url.so ;				Send URL Applications                             
noload => app_userevent.so ;			Custom User Event Application                     
noload => app_verbose.so ;			Send verbose output                               
noload => app_voicemail.so ;			Comedian Mail (Voicemail System)                  
noload => app_waitforring.so ;			Waits until first ring after time                 
noload => app_waitforsilence.so ;		Wait For Silence                                  
noload => app_while.so ;			While Loops and Conditional Execution             
noload => app_zapateller.so ;			Block Telemarketers with Special Informa          

; CDR

noload => cdr_csv.so ;				Comma Separated Values CDR Backend                
noload => cdr_custom.so ;			Customizable Comma Separated Values CDR           
noload => cdr_manager.so ;			Asterisk Manager Interface CDR Backend            

; Channels

noload => chan_agent.so ;			Agent Proxy Channel                               
noload => chan_alsa.so ;			ALSA Console Channel Driver
noload => chan_beagle.so ;			Beagleboard Radio Interface Channel Driver          
load => chan_dahdi.so ;				DAHDI Telephony                                   
noload => chan_echolink.so ;			echolink Channel Driver                           
noload => chan_features.so ;			Feature Proxy Channel                             
noload => chan_gtalk.so ;			Gtalk Channel Driver                              
load => chan_iax2.so ;				Inter Asterisk eXchange (Ver 2)                   
load => chan_local.so ;				Local Proxy Channel (Note: used internal          
noload => chan_oss.so ;				Channel driver for OSS sound cards
noload => chan_phone.so ;			Generic Linux Telephony Interface driver
noload => chan_pi.so ;				DMK Engineering "PITA" Board on Rpi2/3 Channel Driver
noload => chan_simpleusb.so ;			CM1xx USB Cards with Radio Interface Channel Driver (No DSP)          
noload => chan_sip.so ;				Session Initiation Protocol (SIP)                 
noload => chan_tlb.so ;				TheLinkBox Channel Driver                         
noload => chan_usbradio.so ;			CM1xx USB Cards with Radio Interface Channel Driver (DSP)                        
noload => chan_usrp.so ;			GNU Radio interface USRP Channel Driver                              
noload => chan_voter.so ;			Radio Voter Channel Driver                        

; Codecs

; CODEC          AUDIO QUALITY   BANDWIDTH (including IP and Ethernet headers)
; ULAW           best            87 kilobits per second (kbps)
; ADPCM          good            55 kbps
; GSM            mediocre        36 kbps
; g726aal2
; ilbc				 28 kbps
; g722



load => codec_adpcm.so ;			Adaptive Differential PCM Coder/Decoder           
load => codec_alaw.so ;				A-law Coder/Decoder                               
load => codec_a_mu.so ;				A-law and Mulaw direct Coder/Decoder              
noload => codec_dahdi.so ;			Generic DAHDI Transcoder Codec Translato          
load => codec_g722.so ;
load => codec_g726.so ;				ITU G.726-32kbps G726 Transcoder                  
load => codec_gsm.so ;				GSM Coder/Decoder                                 
load => codec_ulaw.so ;				mu-Law Coder/Decoder                              
load => codec_ilbc.so ;				http://en.wikipedia.org/wiki/Internet_Low_Bitrate_Codec
; Formats

load => format_g723.so ;			G.723.1 Simple Timestamp File Format     
load => format_g726.so ;			Raw G.726 (16/24/32/40kbps) data                  
load => format_g729.so ;			Raw G729 data                                     
load => format_gsm.so ;				Raw GSM data                                      
load => format_h263.so ;			Raw H.263 data                                    
load => format_h264.so ;			Raw H.264 data                                    
load => format_ilbc.so ;			Raw iLBC data                                     
noload => format_jpeg.so ;			JPEG (Joint Picture Experts Group) Image          
load => format_pcm.so ;				Raw/Sun uLaw/ALaw 8KHz (PCM,PCMA,AU), G.          
load => format_sln.so ;				Raw Signed Linear Audio support (SLN)             
load => format_vox.so ;				Dialogic VOX (ADPCM) File Format                  
load => format_wav_gsm.so ;			Microsoft WAV format (Proprietary GSM)            
load => format_wav.so ;				Microsoft WAV format (8000Hz Signed Line          

; Functions

load => func_base64.so ;			base64 encode/decode dialplan functions           
load => func_callerid.so ;			Caller ID related dialplan function               
load => func_cdr.so ;				CDR dialplan function                             
load => func_channel.so ;			Channel information dialplan function             
load => func_curl.so ;				Load external URL                                 
load => func_cut.so ;				Cut out information from a string                 
load => func_db.so ;				Database (astdb) related dialplan functi          
load => func_enum.so ;				ENUM related dialplan functions                   
load => func_env.so ;				Environment/filesystem dialplan function          
load => func_global.so ;			Global variable dialplan functions                
load => func_groupcount.so ;			Channel group dialplan functions                  
load => func_language.so ;			Channel language dialplan function                
load => func_logic.so ;				Logical dialplan functions                        
load => func_math.so ;				Mathematical dialplan function                    
load => func_md5.so ;				MD5 digest dialplan functions                     
load => func_moh.so ;				Music-on-hold dialplan function                   
load => func_rand.so ;				Random number dialplan function                   
load => func_realtime.so ;			Read/Write values from a RealTime reposi          
noload => func_sha1.so ;			SHA-1 computation dialplan function               
noload => func_strings.so ;			String handling dialplan functions                
noload => func_timeout.so ;			Channel timeout dialplan functions                
noload => func_uri.so ;				URI encode/decode dialplan functions              

; PBX

noload => pbx_ael.so ;				Asterisk Extension Language Compiler              
load => pbx_config.so ;				Text Extension Configuration                      
noload => pbx_dundi.so ;			Distributed Universal Number Discovery (          
noload => pbx_loopback.so ;			Loopback Switch                                   
noload => pbx_realtime.so ;			Realtime Switch                                   
noload => pbx_spool.so ;			Outgoing Spool Support                            

; Resources

load => res_adsi.so ;				ADSI Resource                                     
noload => res_agi.so ;				Asterisk Gateway Interface (AGI)                  
noload => res_clioriginate.so ;			Call origination from the CLI                     
noload => res_convert.so ;			File format conversion CLI command                
load => res_crypto.so ;				Cryptographic Digital Signatures                  
load => res_features.so ;			Call Features Resource                            
load => res_indications.so ;			Indications Resource                              
noload => res_jabber.so ;			AJI - Asterisk Jabber Interface                   
noload => res_monitor.so ;			Call Monitoring Resource                          
noload => res_musiconhold.so ;			Music On Hold Resource                            
load => res_smdi.so ;				Simplified Message Desk Interface (SMDI)          
noload => res_snmp.so ;				SNMP [Sub]Agent for Asterisk                      
noload => res_speech.so ;			Generic Speech Recognition API                    

[global]
EOF

cat << EOF > /etc/asl/user2/modules.conf
;
; Asterisk configuration file
;
; Module Loader configuration file
;
; By default AllStarLink does NOT load every module, only what is needed

; You can enable or disable any of the asterisk modules
; All modules are compiled and installed.

; These are examples ONLY DO NOT UNCOMMENT them here. 

; You will want to enable the channel driver modules you will be using.
; They are below in the Channel Driver section
; The most common Channel drivers for app_rpt are:
; chan_echolink.so   echolink channel driver
; chan_simpleusb.so  Simple USB Radio Interface Channel Drive
; chan_usbradio.so   USB Console Channel Driver
; chan_usrp.so       USRP Channel Module
; chan_voter.so      radio Voter channel driver

; To enable a module: load => module_name.so
; To disable a module: noload => module_name.so


[modules]

autoload=no

; Applications

noload => app_adsiprog.so ;			Asterisk ADSI Programming Application             
noload => app_alarmreceiver.so ;		Alarm Receiver for Asterisk                       
noload => app_amd.so ;				Answering Machine Detection Application           
load => app_authenticate.so ;            	Authentication Application                        
noload => app_cdr.so ;				Tell Asterisk to not maintain a CDR for           
noload => app_chanisavail.so ;			Check channel availability                        
noload => app_channelredirect.so ;		Channel Redirect                                  
noload => app_chanspy.so ;			Listen to the audio of an active channel          
noload => app_controlplayback.so ;		Control Playback Application                      
noload => app_dahdibarge.so ;			Barge in on channel application                   
noload => app_dahdiras.so ;			DAHDI RAS Application                             
noload => app_dahdiscan.so ;			Scan Zap channels application                     
noload => app_db.so ;				Database Access Functions                         
load => app_dial.so ;				Dialing Application                               
noload => app_dictate.so ;			Virtual Dictation Machine                         
noload => app_directed_pickup.so ;		Directed Call Pickup Application                  
noload => app_directory.so ;			Extension Directory                               
noload => app_disa.so ;				DISA (Direct Inward System Access) Appli          
noload => app_dumpchan.so ;			Dump Info About The Calling Channel               
noload => app_echo.so ;				Simple Echo Application                           
load => app_exec.so ;				Executes dialplan applications                    
noload => app_externalivr.so ;			External IVR Interface Application                
noload => app_festival.so ;			Simple Festival Interface                         
noload => app_flash.so ;			Flash channel application                         
noload => app_followme.so ;			Find-Me/Follow-Me Application                     
noload => app_forkcdr.so ;			Fork The CDR into 2 separate entities             
noload => app_getcpeid.so ;			Get ADSI CPE ID                                   
noload => app_gps.so ;				GPS interface module                              
noload => app_hasnewvoicemail.so ;		Indicator for whether a voice mailbox ha          
noload => app_ices.so ;				Encode and Stream via icecast and ices            
noload => app_image.so ;			Image Transmission Application                    
noload => app_lookupblacklist.so ;		Look up Caller*ID name/number from black          
noload => app_lookupcidname.so ;		Look up CallerID Name from local databas          
load => app_macro.so ;				Extension Macros                                  
noload => app_meetme.so ;			MeetMe conference bridge                          
noload => app_milliwatt.so ;			Digital Milliwatt (mu-law) Test Applicat          
noload => app_mixmonitor.so ;			Mixed Audio Monitoring Application                
noload => app_morsecode.so ;			Morse code                                        
noload => app_mp3.so ;				Silly MP3 Application                             
noload => app_nbscat.so ;			Silly NBS Stream Application                      
noload => app_page.so ;				Page Multiple Phones                              
noload => app_parkandannounce.so ;		Call Parking and Announce Application             
load => app_playback.so ;			Sound File Playback Application                   
noload => app_privacy.so ;			Require phone number to be entered, if n          
noload => app_queue.so ;			True Call Queueing                                
noload => app_radbridge.so ;			Radio Bridging interface module                   
noload => app_random.so ;			Random goto                                       
noload => app_readfile.so ;			Stores output of file into a variable             
noload => app_read.so ;				Read Variable Application                         
noload => app_realtime.so ;			Realtime Data Lookup/Rewrite                      
noload => app_record.so ;			Trivial Record Application                        
load => app_rpt.so ;				Radio Repeater/Remote Base Application            
noload => app_sayunixtime.so ;			Say time                                          
noload => app_senddtmf.so ;			Send DTMF digits Application                      
load => app_sendtext.so ;			Send Text Applications                            
noload => app_setcallerid.so ;			Set CallerID Application                          
noload => app_setcdruserfield.so ;		CDR user field apps                               
noload => app_settransfercapability.so ;	Set ISDN Transfer Capability                      
noload => app_sms.so ;				SMS/PSTN handler                                  
noload => app_softhangup.so ;			Hangs up the requested channel                    
noload => app_speech_utils.so ;			Dialplan Speech Applications                      
noload => app_stack.so ;			Stack Routines                                    
load => app_system.so ;				Generic System() application                      
noload => app_talkdetect.so ;			Playback with Talk Detection                      
noload => app_test.so ;				Interface Test Application                        
load => app_transfer.so ;			Transfer                                          
noload => app_url.so ;				Send URL Applications                             
noload => app_userevent.so ;			Custom User Event Application                     
noload => app_verbose.so ;			Send verbose output                               
noload => app_voicemail.so ;			Comedian Mail (Voicemail System)                  
noload => app_waitforring.so ;			Waits until first ring after time                 
noload => app_waitforsilence.so ;		Wait For Silence                                  
noload => app_while.so ;			While Loops and Conditional Execution             
noload => app_zapateller.so ;			Block Telemarketers with Special Informa          

; CDR

noload => cdr_csv.so ;				Comma Separated Values CDR Backend                
noload => cdr_custom.so ;			Customizable Comma Separated Values CDR           
noload => cdr_manager.so ;			Asterisk Manager Interface CDR Backend            

; Channels

noload => chan_agent.so ;			Agent Proxy Channel                               
noload => chan_alsa.so ;			ALSA Console Channel Driver
noload => chan_beagle.so ;			Beagleboard Radio Interface Channel Driver          
load => chan_dahdi.so ;				DAHDI Telephony                                   
noload => chan_echolink.so ;			echolink Channel Driver                           
noload => chan_features.so ;			Feature Proxy Channel                             
noload => chan_gtalk.so ;			Gtalk Channel Driver                              
load => chan_iax2.so ;				Inter Asterisk eXchange (Ver 2)                   
load => chan_local.so ;				Local Proxy Channel (Note: used internal          
noload => chan_oss.so ;				Channel driver for OSS sound cards
noload => chan_phone.so ;			Generic Linux Telephony Interface driver
noload => chan_pi.so ;				DMK Engineering "PITA" Board on Rpi2/3 Channel Driver
noload => chan_simpleusb.so ;			CM1xx USB Cards with Radio Interface Channel Driver (No DSP)          
noload => chan_sip.so ;				Session Initiation Protocol (SIP)                 
noload => chan_tlb.so ;				TheLinkBox Channel Driver                         
noload => chan_usbradio.so ;			CM1xx USB Cards with Radio Interface Channel Driver (DSP)                        
noload => chan_usrp.so ;			GNU Radio interface USRP Channel Driver                              
noload => chan_voter.so ;			Radio Voter Channel Driver                        

; Codecs

; CODEC          AUDIO QUALITY   BANDWIDTH (including IP and Ethernet headers)
; ULAW           best            87 kilobits per second (kbps)
; ADPCM          good            55 kbps
; GSM            mediocre        36 kbps
; g726aal2
; ilbc				 28 kbps
; g722



load => codec_adpcm.so ;			Adaptive Differential PCM Coder/Decoder           
load => codec_alaw.so ;				A-law Coder/Decoder                               
load => codec_a_mu.so ;				A-law and Mulaw direct Coder/Decoder              
noload => codec_dahdi.so ;			Generic DAHDI Transcoder Codec Translato          
load => codec_g722.so ;
load => codec_g726.so ;				ITU G.726-32kbps G726 Transcoder                  
load => codec_gsm.so ;				GSM Coder/Decoder                                 
load => codec_ulaw.so ;				mu-Law Coder/Decoder                              
load => codec_ilbc.so ;				http://en.wikipedia.org/wiki/Internet_Low_Bitrate_Codec
; Formats

load => format_g723.so ;			G.723.1 Simple Timestamp File Format     
load => format_g726.so ;			Raw G.726 (16/24/32/40kbps) data                  
load => format_g729.so ;			Raw G729 data                                     
load => format_gsm.so ;				Raw GSM data                                      
load => format_h263.so ;			Raw H.263 data                                    
load => format_h264.so ;			Raw H.264 data                                    
load => format_ilbc.so ;			Raw iLBC data                                     
noload => format_jpeg.so ;			JPEG (Joint Picture Experts Group) Image          
load => format_pcm.so ;				Raw/Sun uLaw/ALaw 8KHz (PCM,PCMA,AU), G.          
load => format_sln.so ;				Raw Signed Linear Audio support (SLN)             
load => format_vox.so ;				Dialogic VOX (ADPCM) File Format                  
load => format_wav_gsm.so ;			Microsoft WAV format (Proprietary GSM)            
load => format_wav.so ;				Microsoft WAV format (8000Hz Signed Line          

; Functions

load => func_base64.so ;			base64 encode/decode dialplan functions           
load => func_callerid.so ;			Caller ID related dialplan function               
load => func_cdr.so ;				CDR dialplan function                             
load => func_channel.so ;			Channel information dialplan function             
load => func_curl.so ;				Load external URL                                 
load => func_cut.so ;				Cut out information from a string                 
load => func_db.so ;				Database (astdb) related dialplan functi          
load => func_enum.so ;				ENUM related dialplan functions                   
load => func_env.so ;				Environment/filesystem dialplan function          
load => func_global.so ;			Global variable dialplan functions                
load => func_groupcount.so ;			Channel group dialplan functions                  
load => func_language.so ;			Channel language dialplan function                
load => func_logic.so ;				Logical dialplan functions                        
load => func_math.so ;				Mathematical dialplan function                    
load => func_md5.so ;				MD5 digest dialplan functions                     
load => func_moh.so ;				Music-on-hold dialplan function                   
load => func_rand.so ;				Random number dialplan function                   
load => func_realtime.so ;			Read/Write values from a RealTime reposi          
noload => func_sha1.so ;			SHA-1 computation dialplan function               
noload => func_strings.so ;			String handling dialplan functions                
noload => func_timeout.so ;			Channel timeout dialplan functions                
noload => func_uri.so ;				URI encode/decode dialplan functions              

; PBX

noload => pbx_ael.so ;				Asterisk Extension Language Compiler              
load => pbx_config.so ;				Text Extension Configuration                      
noload => pbx_dundi.so ;			Distributed Universal Number Discovery (          
noload => pbx_loopback.so ;			Loopback Switch                                   
noload => pbx_realtime.so ;			Realtime Switch                                   
noload => pbx_spool.so ;			Outgoing Spool Support                            

; Resources

load => res_adsi.so ;				ADSI Resource                                     
noload => res_agi.so ;				Asterisk Gateway Interface (AGI)                  
noload => res_clioriginate.so ;			Call origination from the CLI                     
noload => res_convert.so ;			File format conversion CLI command                
load => res_crypto.so ;				Cryptographic Digital Signatures                  
load => res_features.so ;			Call Features Resource                            
load => res_indications.so ;			Indications Resource                              
noload => res_jabber.so ;			AJI - Asterisk Jabber Interface                   
noload => res_monitor.so ;			Call Monitoring Resource                          
noload => res_musiconhold.so ;			Music On Hold Resource                            
load => res_smdi.so ;				Simplified Message Desk Interface (SMDI)          
noload => res_snmp.so ;				SNMP [Sub]Agent for Asterisk                      
noload => res_speech.so ;			Generic Speech Recognition API                    

[global]
EOF

cat << EOF > /etc/asl/user3/modules.conf
;
; Asterisk configuration file
;
; Module Loader configuration file
;
; By default AllStarLink does NOT load every module, only what is needed

; You can enable or disable any of the asterisk modules
; All modules are compiled and installed.

; These are examples ONLY DO NOT UNCOMMENT them here. 

; You will want to enable the channel driver modules you will be using.
; They are below in the Channel Driver section
; The most common Channel drivers for app_rpt are:
; chan_echolink.so   echolink channel driver
; chan_simpleusb.so  Simple USB Radio Interface Channel Drive
; chan_usbradio.so   USB Console Channel Driver
; chan_usrp.so       USRP Channel Module
; chan_voter.so      radio Voter channel driver

; To enable a module: load => module_name.so
; To disable a module: noload => module_name.so


[modules]

autoload=no

; Applications

noload => app_adsiprog.so ;			Asterisk ADSI Programming Application             
noload => app_alarmreceiver.so ;		Alarm Receiver for Asterisk                       
noload => app_amd.so ;				Answering Machine Detection Application           
load => app_authenticate.so ;            	Authentication Application                        
noload => app_cdr.so ;				Tell Asterisk to not maintain a CDR for           
noload => app_chanisavail.so ;			Check channel availability                        
noload => app_channelredirect.so ;		Channel Redirect                                  
noload => app_chanspy.so ;			Listen to the audio of an active channel          
noload => app_controlplayback.so ;		Control Playback Application                      
noload => app_dahdibarge.so ;			Barge in on channel application                   
noload => app_dahdiras.so ;			DAHDI RAS Application                             
noload => app_dahdiscan.so ;			Scan Zap channels application                     
noload => app_db.so ;				Database Access Functions                         
load => app_dial.so ;				Dialing Application                               
noload => app_dictate.so ;			Virtual Dictation Machine                         
noload => app_directed_pickup.so ;		Directed Call Pickup Application                  
noload => app_directory.so ;			Extension Directory                               
noload => app_disa.so ;				DISA (Direct Inward System Access) Appli          
noload => app_dumpchan.so ;			Dump Info About The Calling Channel               
noload => app_echo.so ;				Simple Echo Application                           
load => app_exec.so ;				Executes dialplan applications                    
noload => app_externalivr.so ;			External IVR Interface Application                
noload => app_festival.so ;			Simple Festival Interface                         
noload => app_flash.so ;			Flash channel application                         
noload => app_followme.so ;			Find-Me/Follow-Me Application                     
noload => app_forkcdr.so ;			Fork The CDR into 2 separate entities             
noload => app_getcpeid.so ;			Get ADSI CPE ID                                   
noload => app_gps.so ;				GPS interface module                              
noload => app_hasnewvoicemail.so ;		Indicator for whether a voice mailbox ha          
noload => app_ices.so ;				Encode and Stream via icecast and ices            
noload => app_image.so ;			Image Transmission Application                    
noload => app_lookupblacklist.so ;		Look up Caller*ID name/number from black          
noload => app_lookupcidname.so ;		Look up CallerID Name from local databas          
load => app_macro.so ;				Extension Macros                                  
noload => app_meetme.so ;			MeetMe conference bridge                          
noload => app_milliwatt.so ;			Digital Milliwatt (mu-law) Test Applicat          
noload => app_mixmonitor.so ;			Mixed Audio Monitoring Application                
noload => app_morsecode.so ;			Morse code                                        
noload => app_mp3.so ;				Silly MP3 Application                             
noload => app_nbscat.so ;			Silly NBS Stream Application                      
noload => app_page.so ;				Page Multiple Phones                              
noload => app_parkandannounce.so ;		Call Parking and Announce Application             
load => app_playback.so ;			Sound File Playback Application                   
noload => app_privacy.so ;			Require phone number to be entered, if n          
noload => app_queue.so ;			True Call Queueing                                
noload => app_radbridge.so ;			Radio Bridging interface module                   
noload => app_random.so ;			Random goto                                       
noload => app_readfile.so ;			Stores output of file into a variable             
noload => app_read.so ;				Read Variable Application                         
noload => app_realtime.so ;			Realtime Data Lookup/Rewrite                      
noload => app_record.so ;			Trivial Record Application                        
load => app_rpt.so ;				Radio Repeater/Remote Base Application            
noload => app_sayunixtime.so ;			Say time                                          
noload => app_senddtmf.so ;			Send DTMF digits Application                      
load => app_sendtext.so ;			Send Text Applications                            
noload => app_setcallerid.so ;			Set CallerID Application                          
noload => app_setcdruserfield.so ;		CDR user field apps                               
noload => app_settransfercapability.so ;	Set ISDN Transfer Capability                      
noload => app_sms.so ;				SMS/PSTN handler                                  
noload => app_softhangup.so ;			Hangs up the requested channel                    
noload => app_speech_utils.so ;			Dialplan Speech Applications                      
noload => app_stack.so ;			Stack Routines                                    
load => app_system.so ;				Generic System() application                      
noload => app_talkdetect.so ;			Playback with Talk Detection                      
noload => app_test.so ;				Interface Test Application                        
load => app_transfer.so ;			Transfer                                          
noload => app_url.so ;				Send URL Applications                             
noload => app_userevent.so ;			Custom User Event Application                     
noload => app_verbose.so ;			Send verbose output                               
noload => app_voicemail.so ;			Comedian Mail (Voicemail System)                  
noload => app_waitforring.so ;			Waits until first ring after time                 
noload => app_waitforsilence.so ;		Wait For Silence                                  
noload => app_while.so ;			While Loops and Conditional Execution             
noload => app_zapateller.so ;			Block Telemarketers with Special Informa          

; CDR

noload => cdr_csv.so ;				Comma Separated Values CDR Backend                
noload => cdr_custom.so ;			Customizable Comma Separated Values CDR           
noload => cdr_manager.so ;			Asterisk Manager Interface CDR Backend            

; Channels

noload => chan_agent.so ;			Agent Proxy Channel                               
noload => chan_alsa.so ;			ALSA Console Channel Driver
noload => chan_beagle.so ;			Beagleboard Radio Interface Channel Driver          
load => chan_dahdi.so ;				DAHDI Telephony                                   
noload => chan_echolink.so ;			echolink Channel Driver                           
noload => chan_features.so ;			Feature Proxy Channel                             
noload => chan_gtalk.so ;			Gtalk Channel Driver                              
load => chan_iax2.so ;				Inter Asterisk eXchange (Ver 2)                   
load => chan_local.so ;				Local Proxy Channel (Note: used internal          
noload => chan_oss.so ;				Channel driver for OSS sound cards
noload => chan_phone.so ;			Generic Linux Telephony Interface driver
noload => chan_pi.so ;				DMK Engineering "PITA" Board on Rpi2/3 Channel Driver
noload => chan_simpleusb.so ;			CM1xx USB Cards with Radio Interface Channel Driver (No DSP)          
noload => chan_sip.so ;				Session Initiation Protocol (SIP)                 
noload => chan_tlb.so ;				TheLinkBox Channel Driver                         
noload => chan_usbradio.so ;			CM1xx USB Cards with Radio Interface Channel Driver (DSP)                        
noload => chan_usrp.so ;			GNU Radio interface USRP Channel Driver                              
noload => chan_voter.so ;			Radio Voter Channel Driver                        

; Codecs

; CODEC          AUDIO QUALITY   BANDWIDTH (including IP and Ethernet headers)
; ULAW           best            87 kilobits per second (kbps)
; ADPCM          good            55 kbps
; GSM            mediocre        36 kbps
; g726aal2
; ilbc				 28 kbps
; g722



load => codec_adpcm.so ;			Adaptive Differential PCM Coder/Decoder           
load => codec_alaw.so ;				A-law Coder/Decoder                               
load => codec_a_mu.so ;				A-law and Mulaw direct Coder/Decoder              
noload => codec_dahdi.so ;			Generic DAHDI Transcoder Codec Translato          
load => codec_g722.so ;
load => codec_g726.so ;				ITU G.726-32kbps G726 Transcoder                  
load => codec_gsm.so ;				GSM Coder/Decoder                                 
load => codec_ulaw.so ;				mu-Law Coder/Decoder                              
load => codec_ilbc.so ;				http://en.wikipedia.org/wiki/Internet_Low_Bitrate_Codec
; Formats

load => format_g723.so ;			G.723.1 Simple Timestamp File Format     
load => format_g726.so ;			Raw G.726 (16/24/32/40kbps) data                  
load => format_g729.so ;			Raw G729 data                                     
load => format_gsm.so ;				Raw GSM data                                      
load => format_h263.so ;			Raw H.263 data                                    
load => format_h264.so ;			Raw H.264 data                                    
load => format_ilbc.so ;			Raw iLBC data                                     
noload => format_jpeg.so ;			JPEG (Joint Picture Experts Group) Image          
load => format_pcm.so ;				Raw/Sun uLaw/ALaw 8KHz (PCM,PCMA,AU), G.          
load => format_sln.so ;				Raw Signed Linear Audio support (SLN)             
load => format_vox.so ;				Dialogic VOX (ADPCM) File Format                  
load => format_wav_gsm.so ;			Microsoft WAV format (Proprietary GSM)            
load => format_wav.so ;				Microsoft WAV format (8000Hz Signed Line          

; Functions

load => func_base64.so ;			base64 encode/decode dialplan functions           
load => func_callerid.so ;			Caller ID related dialplan function               
load => func_cdr.so ;				CDR dialplan function                             
load => func_channel.so ;			Channel information dialplan function             
load => func_curl.so ;				Load external URL                                 
load => func_cut.so ;				Cut out information from a string                 
load => func_db.so ;				Database (astdb) related dialplan functi          
load => func_enum.so ;				ENUM related dialplan functions                   
load => func_env.so ;				Environment/filesystem dialplan function          
load => func_global.so ;			Global variable dialplan functions                
load => func_groupcount.so ;			Channel group dialplan functions                  
load => func_language.so ;			Channel language dialplan function                
load => func_logic.so ;				Logical dialplan functions                        
load => func_math.so ;				Mathematical dialplan function                    
load => func_md5.so ;				MD5 digest dialplan functions                     
load => func_moh.so ;				Music-on-hold dialplan function                   
load => func_rand.so ;				Random number dialplan function                   
load => func_realtime.so ;			Read/Write values from a RealTime reposi          
noload => func_sha1.so ;			SHA-1 computation dialplan function               
noload => func_strings.so ;			String handling dialplan functions                
noload => func_timeout.so ;			Channel timeout dialplan functions                
noload => func_uri.so ;				URI encode/decode dialplan functions              

; PBX

noload => pbx_ael.so ;				Asterisk Extension Language Compiler              
load => pbx_config.so ;				Text Extension Configuration                      
noload => pbx_dundi.so ;			Distributed Universal Number Discovery (          
noload => pbx_loopback.so ;			Loopback Switch                                   
noload => pbx_realtime.so ;			Realtime Switch                                   
noload => pbx_spool.so ;			Outgoing Spool Support                            

; Resources

load => res_adsi.so ;				ADSI Resource                                     
noload => res_agi.so ;				Asterisk Gateway Interface (AGI)                  
noload => res_clioriginate.so ;			Call origination from the CLI                     
noload => res_convert.so ;			File format conversion CLI command                
load => res_crypto.so ;				Cryptographic Digital Signatures                  
load => res_features.so ;			Call Features Resource                            
load => res_indications.so ;			Indications Resource                              
noload => res_jabber.so ;			AJI - Asterisk Jabber Interface                   
noload => res_monitor.so ;			Call Monitoring Resource                          
noload => res_musiconhold.so ;			Music On Hold Resource                            
load => res_smdi.so ;				Simplified Message Desk Interface (SMDI)          
noload => res_snmp.so ;				SNMP [Sub]Agent for Asterisk                      
noload => res_speech.so ;			Generic Speech Recognition API                    

[global]
EOF

sleep 3
echo "Done."
sleep 3

echo "Install docker-compose.yml
                     cp docker-compose.yml /etc/asl/docker-compose.yml
echo "Done"
echo "Folder permissions?"
                     chmod -R 755 /etc/asl
echo "Start the containers!"
sleep 2
figlet "AllStarLink'"
sleep 2
                     cd /etc/asl
		     docker-compose up -d
		     


echo "ASL-PBX-Engine is installed. Use docker compose commands to control containers!. AKA ShaYmez"
exit 0
