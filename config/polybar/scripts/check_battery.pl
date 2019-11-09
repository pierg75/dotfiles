#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use feature 'say';
use feature 'unicode_strings';


die("You need to pass the battery to monitor") if (scalar(@ARGV) == 0);
my $bat = $ARGV[0];
my $battery_path = "/sys/class/power_supply";
my $battery_icon = "\N{U+1F50B}";
my $cable_plugin = "\N{U+1F50C}";


my $bat_ret = "";
my $bat_per = "";
my $icon = "";

my $F_red_on_black = "%{F#f00}%{B#1a1c1d}";
my $F_white_on_black = "%{F#fff}%{B#1a1c1d}";
my $F_green_on_black = "%{F#fff}%{B#1a1c1d}";
my $F_yellow_on_black = "%{F#ff0}%{B#1a1c1d}";
my $F_black_on_red = "%{B#f00}%{F#000}";

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
    if ($bat_per >= 80 && $bat_per <= 100) {
        my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
        print $F_green_on_black, " ",  $output_string, "\n";
    } elsif ($bat_per >= 50 && $bat_per <= 79) {
        my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
        print $F_yellow_on_black, " ",  $output_string, "\n";
    } elsif ($bat_per >= 20 && $bat_per <= 49) {
        my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
        print $F_red_on_black, " ",  $output_string, "\n";
    } elsif ($bat_per >= 5 && $bat_per <= 19) {
        my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
        print $F_black_on_red, " ",  $output_string, "\n";
        # Start sending messages every 30s  
        # notify-send -a batt -u critical send
        system("notify-send", "-u", "critical", "LOW battery!" );
        system("notify-send", "-u", "critical", "Connect charger" );
    }

} elsif ($bat_status =~ /^charging/i) {
    my $output_string = sprintf("%s %.f", ${bat_status}, ${bat_per});
    print $F_white_on_black, " ",  $output_string, "%", "\n";
} elsif ($bat_status =~ /^Unknown/i) {
    my $output_string = sprintf("%s %.f", "Unknown", ${bat_per});
    print $F_white_on_black, " ",  $output_string, "%", "\n";
} elsif ($bat_status =~ /^Full/i) {
    my $output_string = sprintf("%s %.f", $bat_status, ${bat_per});
    print $F_white_on_black, " ",  $output_string, "%", "\n";
}
