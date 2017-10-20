﻿
###    .x####.   .####x.                .#####* ##               #######     ###  ########
###   '     '*###*'     '               ##.     ##..##* ##.  .## ##*  *##   ## ##   '##'
###                    .x##.  .##x.      *####. ###*'    *#.##*' ##...###   ##.##    ##
###    .xx. .xx.      '   '*##*'   '       ..## ##*##    *##*'   ######.   ##*#*##   ##
###   '    '    '                      .#####** ## '##. .#*'     ##   ## ¤ ##   ## ¤ ## ¤

############################################################################################################################################################################################





############################################################################################################################################################################################

function load-banner {
    # This function get the content from the banner.txt file inside the data folder and displays it with the correct colors etc.
    # It replaces each color tag with an new write-host fuction with special properties, and then revokes the whole command line as an cmdlet.
    $banner = Get-Content "data\banners.txt" | out-string;
    $banner = $banner.Replace("<>", "write-host '';");
    $banner = $banner.Replace("<..>", """; ");
    $banner = $banner.Replace("<.>", """ -nonewline; ");
    $banner = $banner.Replace("<white>", "write-host -f White """);
    $banner = $banner.Replace("<cyan>", "write-host -f Cyan """);
    $banner = $banner.Replace("<red>", "write-host -f Red """);
    $banner = $banner.Replace("<blue>", "write-host -f Blue """);
    $banner = $banner.Replace("<darkgray>", "write-host -f DarkGray """);
    Invoke-Expression $banner
}


function display-splash {
    Write-Host "    Welcome $env:UserName to SkyR.A.T!
    An Remote Administrator Tool built by YSCHGroup using the Windows PowerShell Framework.
    (Please note that we do not encurage you to do anyting illegal with this tool.)

    Type 'help' for more information...
    " -f Yellow;
}


function display-clients {
    # This function will listen for all clients requesting an connection to the server (us) and list every one of them in a neat list for the server to pick from.
    Write-Host "    ┎───╼━┥ " -f gray -NoNewline; Write-Host "Online Clients" -f green -NoNewline; Write-Host " ┝━╾───┒" -f gray;
    Write-Host "    ╵                            ╵" -f Gray;
    $clientPath = "C:\Users\$env:UserName\AppData\LocalLow\clients.txt"
    if (Test-Path $clientPath) {
        $clients = Get-Content "C:\Users\$env:UserName\AppData\LocalLow\clients.txt"
        foreach ($client in $clients) {
            Write-Host "    › Test Item"
        }
    }else {
        Write-Host "              No Clients" -f Red
    }

    Write-Host "    ╷                            ╷" -f Gray;
    Write-Host "    ┖──────╼━━━━━━━━━━━━━━╾──────┚" -f gray;
}




function skyrat-execute($cmd) {                         ###############################################  COMMANDS ###############################################
    if ($SkyRAT_input.ToLower() -eq "help") {                                        # Help
        Write-Host "
    Command                Description
    ¨¨¨¨¨¨¨                ¨¨¨¨¨¨¨¨¨¨¨
  ::Core Commands::
    help                   Help menu
    build                  Build a new client exe file              [Under Construction]
    clients                List all online clients              [Under Construction]
    connect                Connect to a client and start sending packages
    settings               Manage all settings              [Under Construction]
    shell                  Open a shell on the local computer
    version                Display the current version number              [Under Construction]
    cls                    Clear screen              [Under Construction]
    menu                   Display the menu again              [Under Construction]
    exit                   Exit out from SkyRAT              [Under Construction]

  ::Note Commands::
    notes                  Show all saved notes
    note add [string]      Add a new note to notes
    note remove [line]     Remove a note from notes
    note clear             Clear all notes

  ::Shell Commands::
    Skyrat              Return to the SkyRAT interface
    back                Return to the SkyRAT interface

  (If you see weird unicode characters above, change the console font to Consolas!)
"
    }elseif ($SkyRAT_input.ToLower() -eq "shell") {                                 # Shell
        skyrat-shell

    }elseif ($SkyRAT_input.ToLower() -eq "") {                                      # Build
        # Generate an executeable file





    }elseif ($SkyRAT_input.ToLower() -eq "clients") {                                      # clients
        display-clients

    }elseif ($SkyRAT_input.ToLower() -eq "") {                                      # New Command
        # Execute all code inside here

    }elseif ($SkyRAT_input.ToLower() -eq "") {                                      # New Command
        # Execute all code inside here

    }elseif ($SkyRAT_input.ToLower() -eq "") {                                      # New Command
        # Execute all code inside here

    }elseif ($SkyRAT_input.ToLower() -eq "") {                                      # New Command
        # Execute all code inside here

    }elseif ($SkyRAT_input.ToLower() -eq "") {                                      # New Command
        # Execute all code inside here

    }elseif ($SkyRAT_input.ToLower() -eq "") {                                      # New Command
        # Execute all code inside here

    }elseif ($SkyRAT_input.ToLower() -eq "notes") {                                 # notes
        if (Test-Path "C:\Users\$env:UserName\AppData\LocalLow\notes.txt") {
            $linenr = 1
            Write-Host "Notes
¨¨¨¨¨"
            foreach($line in Get-Content "C:\Users\$env:UserName\AppData\LocalLow\notes.txt") {
                if($line -match $regex){
                    Write-Host "$linenr. $line"
                    $linenr ++;
                }
            }
        }else {
            Write-Host "You have currently no notes saved..."
        }
    }elseif ($SkyRAT_input.ToLower().StartsWith("note ") -eq $true) {                # note
        $option = $SkyRAT_input.Split(" ")
        switch($option[1]) {
            "add" {
                $option[0]
                $option[1]
                $noteAdd = $option -join " "
                Add-Content -Value $noteAdd -Path "C:\Users\$env:UserName\AppData\LocalLow\notes.txt"
                break;
            }
            "remove" {
                noteREM($option[2]);
                break;
            }
            "rem" {
                noteREM($option[2]);
                break;
            }
            "clear" {
                Remove-Item "C:\Users\$env:UserName\AppData\LocalLow\notes.txt"
                break;
            }
        }
    }elseif ($SkyRAT_input.ToLower() -eq "exit") {                                      # exit
        exit;

    }elseif ($SkyRAT_input.ToLower() -eq "") {                                      # New Command
        # Execute all code inside here

    }else {                                                                         # error message
        Write-Host "[ERROR] That command does not exists! Use 'help' to show all commands..." -f Red;
    }
}
function noteREM($remLine) {
    $content = Get-Content "C:\Users\$env:UserName\AppData\LocalLow\notes.txt"
    $content | Foreach {$n=1}{if ($n++ -ne $remLine) {$_}} > "C:\Users\$env:UserName\AppData\LocalLow\notes.txt"
}
                                                           ##########################################################################################################




function skyrat-input {
    Write-Host "SkyRAT " -f Cyan -NoNewline;Write-Host "$PWD> " -NoNewline;
    $SkyRAT_input = Read-Host;
    if (-NOT($SkyRAT_input -eq "")) {
        skyrat-execute($SkyRAT_input)
    }
    skyrat-input
}

function skyrat-shell {
    Write-Host "SkyRAT:Shell " -f Cyan -NoNewline;Write-Host "$PWD> " -NoNewline;
    $SkyRAT_input = Read-Host;
    if (-NOT($SkyRAT_input -eq "")) {
        if ($SkyRAT_input.ToLower() -eq "back") {
            skyrat-input
        }elseif ($SkyRAT_input.ToLower() -eq "skyrat") {
            skyrat-input
        }else {
            Invoke-Expression $SkyRAT_input
        }
    }
    skyrat-shell
}


############################################################################################################################################################################################

############################################################################################################################################################################################

# Console settings
[Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'


# Main loop
function main {
    load-banner
    display-splash
    display-clients
    Write-Host; # Blank space
    skyrat-input
}


main;
Read-Host