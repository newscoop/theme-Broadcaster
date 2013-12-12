{{ image rendition="square large" }}
<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} ({{ #photo# }}: {{ $image->photographer }})" />
{{ /image }} 
