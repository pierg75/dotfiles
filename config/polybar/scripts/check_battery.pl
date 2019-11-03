#!/usr/bin/env perl


use strict;
use warnings;
use diagnostics;
use Term::ANSIColor;

use feature 'say';
use feature 'unicode_strings';


my $bat = "BAT0";
my $battery_path = "/sys/class/power_supply";
my $battery_icon = "\N{U+1F50B}";
my $cable_plugin = "\N{U+1F50C}";


my $bat_ret = "";
my $bat_per = "";
my $icon = "";


if (! -e "${battery_path}/${bat}") {
    print("No battery avail\n");
}

# First check if the battery is in the slot
if ( -e "${battery_path}/${bat}/present" ) {
    open(my $bat_fh, "<", "${battery_path}/${bat}/present");
    if (! <$bat_fh>) {
        print("Battery ${bat} not inserted\n");
        exit(0);
    }
    close $bat_fh;
}
# Get the battery status
my $bat_status = "";
if ( -e "${battery_path}/${bat}/status" ) {
    open(my $bat_fh, "<", "${battery_path}/${bat}/status");
    $bat_status = <$bat_fh>;
    chomp($bat_status);
    close $bat_fh;
}


# We have few ways to get the %
# 1) Get it from /sys/class/power_supply/BAT0/capacity (it's an already calculated value)
# 2) Get the full power from /sys/class/power_supply/BAT0/energy_full
#    Get the current power from /sys/class/power_supply/BAT0/energy_now
#    Calculate the % manually
if ( -e "${battery_path}/${bat}/energy_full" && -e "${battery_path}/${bat}/energy_now") {
    open(my $bat_fh, "<", "${battery_path}/${bat}/energy_full");
    my $bat_energy_full = <$bat_fh>;
    close $bat_fh;
    open(my $bat_fh2, "<", "${battery_path}/${bat}/energy_now");
    my $bat_energy_now = <$bat_fh2>;
    close $bat_fh2;
    $bat_per = ($bat_energy_now*100)/$bat_energy_full;
}

# Set the right icon
binmode(STDOUT, ":utf8");
if ($bat_status =~ /^discharging/i) {
    $icon = $battery_icon;
    if ($bat_per >= 80 && $bat_per <= 100) {
        my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
        print "%{T2}", colored(['bright_white on_black'], ${icon}, " ",  $output_string), "%", "\n";
        print color('reset');
    } elsif ($bat_per >= 50 && $bat_per <= 79) {
        my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
        print "%{T2}", colored(['bright_green on_black'], ${icon}, " ",  $output_string), "%", "\n";
        print color('reset');
    } elsif ($bat_per >= 20 && $bat_per <= 49) {
        my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
        print "%{T2}", colored(['bright_yellow on_black'], ${icon}, " ",  $output_string), "%", "\n";
        print color('reset');
    } elsif ($bat_per >= 5 && $bat_per <= 19) {
        my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
        print "%{T2}", colored(['bright_red on_black'], ${icon}, " ",  $output_string), "%", "\n";
        print color('reset');
    }

} elsif ($bat_status =~ /^charging/i) {
    $icon = $cable_plugin;
    my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
    print "%{T2} ", colored(['bright_white on_black'], ${icon}, " ",  $output_string), "%", "\n";
    print color('reset');
}
