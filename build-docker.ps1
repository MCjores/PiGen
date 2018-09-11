param(
    [string]$ContainerName='pigen-work',
    [switch]$Continue,
    [switch]$PreserveContainer)
$Docker = 'docker'

if (-Not (& $Docker ps)) {
    Throw 'Error connecting to docker'
}

$ContainerExists=(& $Docker ps -a --filter name=$ContainerName -q) -ne $null
$ContainerRunning=(& $Docker ps --filter name=$ContainerName -q) -ne $null
if($ContainerRunning) {
    Throw "The build is already running in container $ContainerName. Aborting."
}

if($ContainerExists -And -Not $Continue) {
    Throw "Container $ContainerName already exists and you did not specify Continue=1. Aborting.
    You can delete the existing container like this:
      $Docker rm -v $ContainerName"
}

& $Docker build -t pi-gen .
if($ContainerExists) {
    try {
        & $DOCKER run --rm --privileged `
		--volumes-from=$ContainerName --name ${ContainerName}_cont `
		pi-gen `
        bash -e -o pipefail -c "dpkg-reconfigure qemu-user-static && cd /pi-gen; ./build.sh; rsync -av work/*/build.log deploy/"
    }
    catch{
        Write-Host "echo 'got CTRL+C... please wait 5s"
        & $Docker stop -t 5 ${ContainerName}_cont
    }
}
else {
    try {
        & $Docker run --name $ContainerName --privileged `
        --env-file (Join-Path -Path (Get-Location) -ChildPath config) `
        pi-gen `
        bash -e -o pipefail -c "dpkg-reconfigure qemu-user-static && cd /pi-gen; ./build.sh && rsync -av work/*/build.log deploy/"
    }
    catch{
        Write-Host "echo 'got CTRL+C... please wait 5s"
    }
    finally {
        & $Docker stop -t 5 $ContainerName
    }
}
Write-Host "copying results from deploy/"
& $Docker cp ${ContainerName}:/pi-gen/deploy .
Get-ChildItem deploy

# cleanup
if(-not $PreserveContainer){
    & $Docker rm -v $ContainerName
}
 
Write-Host "Done! Your image(s) should be in deploy/"

Write-Host @"
Usage:
    build-docker.ps1 [options]
Optional environment arguments: ( =<default> )
    ContainerName=pigen_work  set a name for the build container
    Continue=$true            continue from a previously started container
    PreserveContainer=$true   keep build container even on successful build
"@

