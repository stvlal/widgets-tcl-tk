#!/bin/sh
#The next line executes wish - wherever it is \
exec wish "$0" "$@"

package require Tk

# text = Hello
set text Hello

# done = 1
set done 1

proc hseparator path { # Making a frame for widgets
    frame $path -relief flat -borderwidth 3 -height 0 -pady 0
    pack [frame $path.inner -relief groove -borderwidth 2 -height 2 -width 5 -pady 0] -expand yes -fill x
    set path
}

proc vseparator {path} { # Making a frame for widgets
    frame $path -relief flat -borderwidth 0 -width 0 -padx 0
    pack [frame $path.inner -relief groove -borderwidth 0 -width 10 -padx 0] -expand yes -fill both
    pack [label $path.inner.lbl -text {} -borderwidth 0 -width 10 -padx 0]
    set path
}


proc doTRB {widget} { # Defenition doTRB function (what to do when we click on TRB widget)
    global text_trb
    global background
    global action
    global status
    if {$text_trb == "TRB off"} {
        set text_trb "TRB on"
        set background green
#        exec /usr/local/bin/egctl panda on left left left
    # using sed command to change the 1st line in file 'panda'
    exec sed -i 1s/off/on/1 panda

    } else {
        set text_trb "TRB off"
        set background red
#        exec /usr/local/bin/egctl panda off left left left
    # using sed command to change the 1st line in file 'panda'
    exec sed -i 1s/on/off/1 panda
    }
    # configure widget
    $widget configure -text $text_trb -background $background -activebackground $background 
}


proc doPadiwa {widget} { # Defenition doPadiwa function (what to do when we click on Padiwa widget)
    global text_padiwa
    global background
    global action
    global status
    if {$text_padiwa == "PADIWA off"} {
        set text_padiwa "PADIWA on"
        set background green
#        exec /usr/local/bin/egctl panda left on left left
    # using sed command to change the 2st line in file 'panda'
    exec sed -i 2s/off/on/1 panda

    } else {
        set text_padiwa "PADIWA off"
        set background red
#        exec /usr/local/bin/egctl panda left off left left
    # using sed command to change the 2st line in file 'panda'
    exec sed -i 2s/on/off/1 panda
    }
    # configure widget
    $widget configure -text $text_padiwa -background $background -activebackground $background
}


proc doFan {widget} { # Defenition doFan function (what to do when we click on Fan widget)
    global text_fan
    global background
    global action
    global status
    if {$text_fan == "Fan off"} {
        set text_fan "Fan on"
        set background green
#        exec /usr/local/bin/egctl panda left left on left
    # using sed command to change the 3st line in file 'panda'
    exec sed -i 3s/off/on/1 panda

    } else {
        set text_fan "Fan off"
        set background red
#        exec /usr/local/bin/egctl panda left left off left
    # using sed command to change the 3st line in file 'panda'
    exec sed -i 3s/on/off/1 panda
    }
    # configure widget
    $widget configure -text $text_fan -background $background -activebackground $background
}


proc doLeftWid {widget} { # Defenition doLeftWid function (what to do when we click on LeftWid widget)
    global text_leftwid
    global background
    global action
    global status
    if {$text_leftwid == "LeftWid off"} {
        set text_leftwid "LeftWid on"
        set background green
#        exec /usr/local/bin/egctl panda left left left on
    # using sed command to change the 4st line in file 'panda'
    exec sed -i 4s/off/on/1 panda

    } else {
        set text_leftwid "LeftWid off"
        set background red
#        exec /usr/local/bin/egctl panda left left left off
    # using sed command to change the 4st line in file 'panda'
    exec sed -i 4s/on/off/1 panda
    }
    # configure widget
    $widget configure -text $text_leftwid -background $background -activebackground $background
}


#set qqq "/usr/local/bin/egctl panda | awk 'FNR == 1 {print \$4}'"
#set qqq [exec /usr/local/bin/egctl panda]
#set status [exec /usr/local/bin/egctl panda | awk {FNR == 1 {print $4}}]

# Set value of variable 'status' from 'more panda | awk {FNR == 1 {print $1}}';
# awk {FNR == 1 {print $1} takes the 1st word in the 1st line
set status [exec more panda | awk {FNR == 1 {print $1}}]
# Print on the screen the value of 'status'
puts $status
# Create .b1 button
button .b1
if {$status == "on"} {
set text_trb "TRB on"
set background green
# configure .b1 button
.b1 configure -background $background -text $text_trb -activebackground $background -border 5 \
        -command "doTRB .b1" -width 15 -height 2
        } else {
set text_trb "TRB off"
set background red
# configure .b1 button
.b1 configure -background $background -text $text_trb -activebackground $background -border 5 \
        -command "doTRB .b1" -width 15 -height 2
        }
# Create .b2 button and set destroy command for this button; when this button is pressed, the value of 'done' gets 0
button .b2 -text "Quit" \
    -command "set done 0; destroy ."


# Set value of variable 'status' from 'more panda | awk {FNR == 2 {print $1}}';
# awk {FNR == 2 {print $1} takes the 1st word in the 2nd line
set status [exec more panda | awk {FNR == 2 {print $1}}]
# Print on the screen the value of 'status'
puts $status
# Create .b3 button
button .b3
if {$status == "on"} {
set text_padiwa "PADIWA on"
set background green
# configure .b3 button
.b3 configure -background $background -text $text_padiwa -activebackground $background -border 5 \
        -command "doPadiwa .b3" -width 15 -height 2
        } else {
set text_padiwa "PADIWA off"
set background red
# configure .b3 button
.b3 configure -background $background -text $text_padiwa -activebackground $background -border 5 \
        -command "doPadiwa .b3" -width 15 -height 2
        }



# Set value of variable 'status' from 'more panda | awk {FNR == 3 {print $1}}';
# awk {FNR == 3 {print $1} takes the 1st word in the 3rd line
set status [exec more panda | awk {FNR == 3 {print $1}}]
# Print on the screen the value of 'status'
puts $status
# Create .b4 button
button .b4
if {$status == "on"} {
set text_fan "Fan on"
set background green
# configure .b4 button
.b4 configure -background $background -text $text_fan -activebackground $background -border 5 \
        -command "doFan .b4" -width 15 -height 2
        } else {
set text_fan "Fan off"
set background red
# configure .b4 button
.b4 configure -background $background -text $text_fan -activebackground $background -border 5 \
        -command "doFan .b4" -width 15 -height 2
        }


# Set value of variable 'status' from 'more panda | awk {FNR == 4 {print $1}}';
# awk {FNR == 4 {print $1} takes the 1st word in the 4th line
set status [exec more panda | awk {FNR == 4 {print $1}}]
# Print on the screen the value of 'status'
puts $status
# Create .b5 button
button .b5
if {$status == "on"} {
set text_leftwid "LeftWid on"
set background green
# configure .b5 button
.b5 configure -background $background -text $text_leftwid -activebackground $background -border 5 \
        -command "doLeftWid .b5" -width 15 -height 2
        } else {
set text_leftwid "LeftWid off"
set background red
# configure .b5 button
.b5 configure -background $background -text $text_leftwid -activebackground $background -border 5 \
        -command "doLeftWid .b5" -width 15 -height 2
        }


# Put the widgets in the window in row order
grid .b1 -row 0 -column 0
grid [vseparator .s1] -row 0 -column 1
grid .b2 -row 0 -column 2
grid .b3 -row 1 -column 0
grid .b4 -row 2 -column 0
grid .b5 -row 3 -column 0


# Endless loop. Every second the file "panda" is read
# The values in this file are checked against those that are set on the widgets at the moment
# If these values differ, the widget changes the label and color
while {$done} {

    set status_trb [exec more panda | awk {FNR == 1 {print $1}}]
    if {($text_trb == "TRB off") && ($status_trb == "on")} {
set text_trb "TRB on"
set background green
.b1 configure -text $text_trb -background $background -activebackground $background
        }
    if {($text_trb == "TRB on") && ($status_trb == "off")} {
set text_trb "TRB off"
set background red
.b1 configure -text $text_trb -background $background -activebackground $background
        }


    set status_padiwa [exec more panda | awk {FNR == 2 {print $1}}]
    if {($text_padiwa == "PADIWA off") && ($status_padiwa == "on")} {
set text_padiwa "PADIWA on"
set background green
.b3 configure -text $text_padiwa -background $background -activebackground $background
        }
    if {($text_padiwa == "PADIWA on") && ($status_padiwa == "off")} {
set text_padiwa "PADIWA off"
set background red
.b3 configure -text $text_padiwa -background $background -activebackground $background
        }


    set status_fan [exec more panda | awk {FNR == 3 {print $1}}]
    if {($text_fan == "Fan off") && ($status_fan == "on")} {
set text_fan "Fan on"
set background green
.b4 configure -text $text_fan -background $background -activebackground $background
        }
    if {($text_fan == "Fan on") && ($status_fan == "off")} {
set text_fan "Fan off"
set background red
.b4 configure -text $text_fan -background $background -activebackground $background
        }


    set status_leftwid [exec more panda | awk {FNR == 4 {print $1}}]
    if { ($text_leftwid == "LeftWid off")  && ($status_leftwid == "on")} {
set text_leftwid "LeftWid on"
set background green
.b5 configure -text $text_leftwid -background $background -activebackground $background
        }
	    if { ($text_leftwid == "LeftWid on")  && ($status_leftwid == "off")}	 {
set text_leftwid "LeftWid off"
set background red
.b5 configure -text $text_leftwid -background $background -activebackground $background
        }

    after 1000 # Execute a command after 1000ms delay

    # Update display
    update
}
