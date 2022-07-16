Param (
	[string]$PATH
)

$FILE=(Get-Item $PATH)
$FILE_SANITIZED="$(Split-Path -Path $PATH -Parent)\$($FILE.BaseName)"

g++ -Wall -D COOKIE_CHAN=1 -o "$FILE_SANITIZED.exe" ($FILE)

Invoke-Expression -C "$FILE_SANITIZED.exe"
