$list = @()

curl "https://www.python.org/ftp/python/" | Select-String -Pattern '.*href="3\.(10|11|12)\.(\S+)/".*' | ForEach-Object {
    $found = $_ -match '.*href="(\S+)/".*'
    $version = $matches[1]
    $list += [AsdfVersion]::new($this, $version)
}

return $list