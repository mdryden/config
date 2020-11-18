# Goes in C:\Users\<user>\Documents\WindowsPowerShell

Set-PSReadlineOption -BellStyle None

$env:PYTHONIOENCODING="utf-8"
iex "$(thefuck --alias)"
iex "$(thefuck --alias oops)"

function gcloud_prompt {
  $context = cat "$env:APPDATA\gcloud\active_config";

  return $context;
}

function firebase_prompt {
    $context = Get-Content "$env:HOMEPATH\.config\configstore\firebase-tools.json" | ConvertFrom-Json
    return $context.activeProjects.($(Get-Location).Path)
}

function git_prompt {
    $branch = (&git rev-parse --abbrev-ref HEAD) | Out-String
    #echo $branch
    return $branch
}

function prompt {

    Write-Host
        
    $gcp = gcloud_prompt
    Write-Host "gcp:$gcp " -NoNewLine -ForegroundColor Cyan

    $firebase = firebase_prompt
    Write-Host "fb:$firebase " -NoNewLine -ForegroundColor Yellow

    $git = git_prompt
    Write-Host "git:$git".Trim() -NoNewLine -ForegroundColor Magenta

    Write-Host

    Write-Host $(Get-Location) -NoNewLine

    return "> "

}
