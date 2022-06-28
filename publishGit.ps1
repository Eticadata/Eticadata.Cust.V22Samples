$date = Get-Date -format "yyyyMMddHHmm"
$commitName = "Commit_$date"
$root = (Get-Item -Path "..\" -Verbose).FullName
$publishFolder = ".GitPublish"
$repoName = "Eticadata.Cust.V22Samples"
$sourcesFolder = (Get-Item -Path ".\" -Verbose).Name

Set-Location -Path "$root"
New-Item -ItemType Directory -Force -Path "$publishFolder"
Set-Location -Path "$publishFolder"
git clone https://Eticadata-Consulting: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@github.com/Eticadata/$repoName.git
git config --global user.name "Eticadata-Consulting"
git config --global user.email "consultores@eticadata.pt"

Set-Location -Path "$repoName\"
git rm -r * -f -q

Set-Location -Path "$root\$sourcesFolder"
xcopy "$root\$sourcesFolder" "$root\$publishFolder\$repoName\" /E /Y /EXCLUDE:exclusionList.txt


Set-Location -Path "$root\$publishFolder\$repoName\"
git add .
git commit -a -m $commitName
git push -f origin master

Set-Location -Path "$root"
Remove-Item "$publishFolder\*" -recurse -Force
Set-Location -Path "$root\$sourcesFolder"