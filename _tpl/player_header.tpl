<body dir="{{ if $gimme->issue->language->code == ar }}rtl{{ else }}ltr{{ /if }}">
    <header id="main_header">
        
        <div id="header" class="clearfix">

          <div id="headerLiveTrackHolder" class="radio_player player">
            <h2>{{ #listenLive# }}</h2>
            <button id="playNow" aria-controls="audio" title="Begin audio streaming">{{ #playNow# }}</button>
            <p>{{ #current# }}</p>
          </div>

        </div><!-- / Header -->

    </header>
