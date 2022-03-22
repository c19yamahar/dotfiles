##### Command list like UNIX #####

#touch
function touch {
    New-Item -type file $args[0]
}

#curl
function curl{
    curl.exe $args[0] -O $env:USERPROFILE\main\Downloads\$args[0]
}

#grep
function grep{
    Select-String -Pattern $args[0]
}

#### change char code ####
chcp 65001;

#### theme ####
Import-Module posh-git

#### message ####
Show-Calendar
Write-Output "Hello,$($env:USERNAME)!!"

#### Autosuggestion ####
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{ InlinePrediction = 'DarkGray' }

function prompt () {
   $(Write-Host -NoNewline "`r`n" -ForegroundColor White) `
      + $(Write-Host -NoNewline "[" -ForegroundColor Gray) `
      + $(Write-Host -NoNewline $($env:USERNAME) -ForegroundColor Cyan) `
      + $(Write-Host -NoNewline "@" -ForegroundColor Gray) `
      + $(Write-Host -NoNewline $(hostname) -ForegroundColor Gray)`
      + $(Write-Host -NoNewline ":" -ForegroundColor Gray)`
      + $(Write-Host -NoNewline $(get-location) -ForegroundColor DarkYellow) `
      + $(Write-Host -NoNewline "] " -ForegroundColor Gray) `
      + $(Write-Host -NoNewline "[" -ForegroundColor Green) `
      + $(Write-Host -NoNewline $(Get-Date -Format "HH:mm:ss") -ForegroundColor green) `
      + $(Write-Host -NoNewline "]" -ForegroundColor Green) `
      + $(Write-VcsStatus) `
      + "`r`n$ "
}


#### tex setting ####
function texcomp(){
	ptex2pdf $args[0] -l
}

#### AtCoder setting ####

function Ac-Start(){
    if(!(Test-Path "$HOME\main\program\AtCoder")){
        mkdir "$HOME\main\program\AtCoder"
    }
    Start-Process "https://atcoder.jp/contests/$args/tasks/"
    acc new "$HOME\main\program\AtCoder\$args[0]"
    if($?){
        Clear-Host
        echo "Create Success!"
        code "$HOME\main\program\AtCoder\$args[0]" -a
    }
    else{
        echo "error"
    }
}

function Ac-Test(){
    g++ $args[0]\main.cpp
    if ($?) {
        echo "compile success"
        oj t
        if($?){
            Clear-Host
            echo "test success!!"`+"Start submitting..."
            acc s
            if($?){
                Clear-Host
                echo "submit success!!"
            }
            else{
                echo "submit error"
            }
        }
        else{
            echo "Caught wrong answer"
        }
    }
    else{
        echo "compile error"
    }
}