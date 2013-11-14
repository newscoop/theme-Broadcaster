{{ image rendition="show" }}
  <img src="{{ $image->src }}" rel="resizable" alt="{{ $image->caption }} ({{ #photo# }}: {{ $image->photographer }})" />
{{ /image }}