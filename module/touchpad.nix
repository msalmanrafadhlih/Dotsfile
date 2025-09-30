{ config, pkgs, lib, ... }:

{
	libinput = {
	    enable = true;
	    touchpad = {
	        tapping = true;
	        naturalScrolling = true;
	        disableWhileTyping = true;
	        sendEventsMode = "disabled-on-external-mouse";
	    };
	};

    udev = {
        enable = true;
        extraRules = ''
            ACTION=="add", SUBSYSTEM=="input", ATTRS{name}=="2.4G Mouse", \
            ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/tquilla/.Xauthority", \
            RUN+="${pkgs.xorg.xinput}/bin/xinput --disable 'SYNA3602:00 0911:5288 Touchpad'"

            ACTION=="remove", SUBSYSTEM=="input", ATTRS{name}=="2.4G Mouse", \
            ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/tquilla/.Xauthority", \
            RUN+="${pkgs.xorg.xinput}/bin/xinput --enable 'SYNA3602:00 0911:5288 Touchpad'"
            ## 'SYNA3602:00 0911:5288 Touchpad' & "2.4G Mouse" is my touchpad and mouse name, check xinput list' in terminal!
        '';
    };
}

