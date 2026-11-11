Add-Type -AssemblyName System.Drawing

$assetsDir = "C:\Users\pc\Downloads\flutter_proj\wildguard\assets\images"
$images = Get-ChildItem -Path $assetsDir -Filter "*.jpg"

function Resize-Jpeg {
    param(
        [string]$Path,
        [int]$MaxDimension = 680,
        [long]$Quality = 65
    )

    $bytes = [System.IO.File]::ReadAllBytes($Path)
    $ms = New-Object System.IO.MemoryStream($bytes, 0, $bytes.Length)
    $origImage = [System.Drawing.Image]::FromStream($ms)

    $origW = $origImage.Width
    $origH = $origImage.Height

    $scale = 1.0
    if ($origW -gt $MaxDimension -or $origH -gt $MaxDimension) {
        $scale = [Math]::Min($MaxDimension / $origW, $MaxDimension / $origH)
    }

    $newW = [int]($origW * $scale)
    $newH = [int]($origH * $scale)

    $bitmap = New-Object System.Drawing.Bitmap($newW, $newH)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality

    $graphics.DrawImage($origImage, 0, 0, $newW, $newH)

    $jpegEncoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.FormatID -eq [System.Drawing.Imaging.ImageFormat]::Jpeg.Guid }
    $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
    $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, $Quality)

    $outMs = New-Object System.IO.MemoryStream
    $bitmap.Save($outMs, $jpegEncoder, $encoderParams)
    $outBytes = $outMs.ToArray()

    $graphics.Dispose()
    $bitmap.Dispose()
    $origImage.Dispose()
    $ms.Dispose()
    $outMs.Dispose()

    [System.IO.File]::WriteAllBytes($Path, $outBytes)
}

foreach ($img in $images) {
    try {
        Resize-Jpeg -Path $img.FullName -MaxDimension 680 -Quality 65
    } catch {
        Write-Host "Error optimizing $($img.Name): $_"
    }
}

$newTotal = (Get-ChildItem -Path $assetsDir -Filter "*.jpg" | Measure-Object -Property Length -Sum).Sum / 1MB
Write-Host "New total image assets size: $([Math]::Round($newTotal, 2)) MB"
