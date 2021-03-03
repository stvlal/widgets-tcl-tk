#!/bin/sh
#The next line executes wish - wherever it is \
exec wish "$0" "$@"

package require Tk

set text Hello
set done 1

proc hseparator path {
    frame $path -relief flat -borderwidth 3 -height 0 -pady 0
    pack [frame $path.inner -relief groove -borderwidth 2 -height 2 -width 5 -pady 0] -expand yes -fill x
    set path
}

proc vseparator {path} {
    frame $path -relief flat -borderwidth 0 -width 0 -padx 0
    pack [frame $path.inner -relief groove -borderwidth 0 -width 10 -padx 0] -expand yes -fill both
    pack [label $path.inner.lbl -text {} -borderwidth 0 -width 10 -padx 0]
    set path
}


proc doTRB {widget} {
    global text_trb
    global background_trb
    global action
    global status
    if {$text_trb == "TRB off"} {
        set text_trb "TRB on"
        set background_trb green
        exec /usr/local/bin/egctl panda on left left left
#    exec sed -i 1s/off/on/1 panda

    } else {
        set text_trb "TRB off"
        set background_trb red
        exec /usr/local/bin/egctl panda off left left left
#    exec sed -i 1s/on/off/1 panda
    }
    $widget configure -text $text_trb -background $background_trb -activebackground $background_trb
}


proc doPadiwa {widget} {
    global text_padiwa
    global background_padiwa
    global action
    global status
    if {$text_padiwa == "PADIWA off"} {
        set text_padiwa "PADIWA on"
        set background_padiwa green
        exec /usr/local/bin/egctl panda left on left left
#    exec sed -i 2s/off/on/1 panda

    } else {
        set text_padiwa "PADIWA off"
        set background_padiwa red
        exec /usr/local/bin/egctl panda left off left left
#    exec sed -i 2s/on/off/1 panda
    }
    $widget configure -text $text_padiwa -background $background_padiwa -activebackground $background_padiwa
}


proc doFan {widget} {
    global text_fan
    global background_fan
    global action
    global status
    if {$text_fan == "Fan off"} {
        set text_fan "Fan on"
        set background_fan green
        exec /usr/local/bin/egctl panda left left on left
#    exec sed -i 3s/off/on/1 panda

    } else {
        set text_fan "Fan off"
        set background_fan red
        exec /usr/local/bin/egctl panda left left off left
#    exec sed -i 3s/on/off/1 panda
    }
    $widget configure -text $text_fan -background $background_fan -activebackground $background_fan
}


proc doLeftWid {widget} {
    global text_leftwid
    global background_lw
    global action
    global status
    if {$text_leftwid == "LeftWid off"} {
        set text_leftwid "LeftWid on"
        set background_lw green
        exec /usr/local/bin/egctl panda left left left on
#    exec sed -i 4s/off/on/1 panda

    } else {
        set text_leftwid "LeftWid off"
        set background_lw red
        exec /usr/local/bin/egctl panda left left left off
#    exec sed -i 4s/on/off/1 panda
    }
    $widget configure -text $text_leftwid -background $background_lw -activebackground $background_lw
}


#set qqq "/usr/local/bin/egctl panda | awk 'FNR == 1 {print \$4}'"
#set qqq [exec /usr/local/bin/egctl panda]
set status [exec /usr/local/bin/egctl panda | awk {FNR == 1 {print $4}}]
#set status [exec more panda | awk {FNR == 1 {print $1}}]
puts $status
button .b1
if {$status == "on"} {
set text_trb "TRB on"
set background_trb green
.b1 configure -background $background_trb -text $text_trb -activebackground $background_trb -border 5 \
        -command "doTRB .b1" -width 15 -height 2
        } else {
set text_trb "TRB off"
set background_trb red
.b1 configure -background $background_trb -text $text_trb -activebackground $background_trb -border 5 \
        -command "doTRB .b1" -width 15 -height 2
        }
button .b2 -text "Quit" \
    -command "set done 0; destroy ."


set status [exec /usr/local/bin/egctl panda | awk {FNR == 2 {print $4}}]
#set status [exec more panda | awk {FNR == 2 {print $1}}]
puts $status
button .b3
if {$status == "on"} {
set text_padiwa "PADIWA on"
set background_padiwa green
.b3 configure -background $background_padiwa -text $text_padiwa -activebackground $background_padiwa -border 5 \
        -command "doPadiwa .b3" -width 15 -height 2
        } else {
set text_padiwa "PADIWA off"
set background_padiwa red
.b3 configure -background $background_padiwa -text $text_padiwa -activebackground $background_padiwa -border 5 \
        -command "doPadiwa .b3" -width 15 -height 2
        }



set status [exec /usr/local/bin/egctl panda | awk {FNR == 3 {print $4}}]
#set status [exec more panda | awk {FNR == 3 {print $1}}]
puts $status
button .b4
if {$status == "on"} {
set text_fan "Fan on"
set background_fan green
.b4 configure -background $background_fan -text $text_fan -activebackground $background_fan -border 5 \
        -command "doFan .b4" -width 15 -height 2
        } else {
set text_fan "Fan off"
set background_fan red
.b4 configure -background $background_fan -text $text_fan -activebackground $background_fan -border 5 \
        -command "doFan .b4" -width 15 -height 2
        }


set status [exec /usr/local/bin/egctl panda | awk {FNR == 4 {print $4}}]
#set status [exec more panda | awk {FNR == 4 {print $1}}]
puts $status
button .b5
if {$status == "on"} {
set text_leftwid "LeftWid on"
set background_lw green
.b5 configure -background $background_lw -text $text_leftwid -activebackground $background_lw -border 5 \
        -command "doLeftWid .b5" -width 15 -height 2
        } else {
set text_leftwid "LeftWid off"
set background_lw red
.b5 configure -background $background_lw -text $text_leftwid -activebackground $background_lw -border 5 \
        -command "doLeftWid .b5" -width 15 -height 2
        }


# Put them in the window in row order
#ttk::separator .s1 -orient vertical
grid .b1 -row 0 -column 0
grid [vseparator .s1] -row 0 -column 1
grid .b2 -row 0 -column 2
grid .b3 -row 1 -column 0
grid .b4 -row 2 -column 0
grid .b5 -row 3 -column 0
#grid configure .s1 -rowspan 50


set flag_conn_trb "found"
set flag_conn_padiwa "found"
set flag_conn_fan "found"
set flag_conn_lw "found"

while {$done} {

    set connection [exec ./tr.sh]
    #puts $connection

  if {$connection} {
    set status_trb [exec /usr/local/bin/egctl panda | awk {FNR == 1 {print $4}}]
    if {$flag_conn_trb == "lost"} {
    set flag_conn_trb "found"
    .b1 configure -text $text_trb -background $background_trb -activebackground $background_trb -state normal
    }
  } else {
     set flag_conn_trb "lost"
     set text_trb_lost "Сonnection lost"
     set background_lost_trb gray
     .b1 configure -text $text_trb_lost -background $background_lost_trb -activebackground $background_lost_trb -state disabled
   }
    if {($text_trb == "TRB off") && ($status_trb == "on")} {
set text_trb "TRB on"
set background_trb green
.b1 configure -text $text_trb -background $background_trb -activebackground $background_trb
        }
    if {($text_trb == "TRB on") && ($status_trb == "off")} {
set text_trb "TRB off"
set background_trb red
.b1 configure -text $text_trb -background $background_trb -activebackground $background_trb
        }

  if {$connection} {
    set status_padiwa [exec /usr/local/bin/egctl panda | awk {FNR == 2 {print $4}}]
    if {$flag_conn_padiwa == "lost"} {
    set flag_conn_padiwa "found"
    .b3 configure -text $text_padiwa -background $background_padiwa -activebackground $background_padiwa -state normal
    }
  } else {
     set flag_conn_padiwa "lost"
    set text_padiwa_lost "Сonnection lost"
    set background_lost_padiwa gray
    .b3 configure -text $text_padiwa_lost -background $background_lost_padiwa -activebackground $background_lost_padiwa -state disabled
  }
    if {($text_padiwa == "PADIWA off") && ($status_padiwa == "on")} {
set text_padiwa "PADIWA on"
set background_padiwa green
.b3 configure -text $text_padiwa -background $background_padiwa -activebackground $background_padiwa
        }
    if {($text_padiwa == "PADIWA on") && ($status_padiwa == "off")} {
set text_padiwa "PADIWA off"
set background_padiwa red
.b3 configure -text $text_padiwa -background $background_padiwa -activebackground $background_padiwa
        }

  if {$connection} {
    set status_fan [exec /usr/local/bin/egctl panda | awk {FNR == 3 {print $4}}]
    if {$flag_conn_fan == "lost"} {
    set flag_conn_fan "found"
    .b4 configure -text $text_fan -background $background_fan -activebackground $background_fan -state normal
    }
  } else {
    set flag_conn_fan "lost"
    set text_fan_lost "Сonnection lost"
    set background_lost_fan gray
    .b4 configure -text $text_fan_lost -background $background_lost_fan -activebackground $background_lost_fan -state disabled
  }
    if {($text_fan == "Fan off") && ($status_fan == "on")} {
set text_fan "Fan on"
set background_fan green
.b4 configure -text $text_fan -background $background_fan -activebackground $background_fan
        }
    if {($text_fan == "Fan on") && ($status_fan == "off")} {
set text_fan "Fan off"
set background_fan red
.b4 configure -text $text_fan -background $background_fan -activebackground $background_fan
        }

  if {$connection} {
    set status_leftwid [exec /usr/local/bin/egctl panda | awk {FNR == 4 {print $4}}]
    set status_fan [exec /usr/local/bin/egctl panda | awk {FNR == 3 {print $4}}]
    if {$flag_conn_lw == "lost"} {
    set flag_conn_lw "found"
    .b5 configure -text $text_leftwid -background $background_lw -activebackground $background_lw -state normal
    }
  } else {
    set flag_conn_lw "lost"
    set text_leftwid_lost "Сonnection lost"
    set background_lost_lw gray
    .b5 configure -text $text_leftwid_lost -background $background_lost_lw -activebackground $background_lost_lw -state disabled
  }
    if { ($text_leftwid == "LeftWid off")  && ($status_leftwid == "on")} {
set text_leftwid "LeftWid on"
set background_lw green
.b5 configure -text $text_leftwid -background $background_lw -activebackground $background_lw
        }
	    if { ($text_leftwid == "LeftWid on")  && ($status_leftwid == "off")}	 {
set text_leftwid "LeftWid off"
set background_lw red
.b5 configure -text $text_leftwid -background $background_lw -activebackground $background_lw
        }

    after 1000
    update

}
