    <header id="main_header">
        {{* testing the rss link *}}
        {{*<p><a href="http://{{ $gimme->publication->site }}/en/static/rss/">RSS</a></p>*}}
        <div id="top" class="clearfix">

            <div id="pages_top" class="clearfix">
                <a href="#" class="cat-trigger">CONTACT</a>
                <ul class="show">
                  {{* Set local context *}}
                  {{ local }}
                  {{ unset_topic }}
                  {{* Set static issue *}}
                  {{ set_issue number="1" }}
                  {{* Set pages section *}}
                  {{ set_section number="5" }}
                  {{* List all pages that aren't charts, program grid, or the 'music' section placeholder *}}
                  {{ list_articles constraints="name not Charts number not 110 number not 111 number not 115 name not Sponsors" order="bynumber asc" }}
                  <li><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></li>
                  {{ /list_articles }}
                  {{ /local }}
                </ul>
            </div><!-- / pages_top -->

            <div class="top-menu">
              {{ local }}
              <ul>
                {{ dynamic }}
                {{ if $gimme->user->logged_in }}
                <li class="login"><a href="{{ $view->url(['controller' => 'dashboard', 'action' => 'index'], 'default') }}">{{ $gimme->user->first_name }} {{ $gimme->user->last_name }}</a>
                  <ul class="sub">
                    <li><a href="{{ $view->url(['controller' => 'auth', 'action' => 'logout'], 'default') }}?t={{ time() }}">{{ #logout# }}</a></li>
                  </ul>
                </li>
                {{ else }}
                  <li class="login"><a href="{{ $view->url(['controller' => 'auth', 'action' =>'index'], 'default') }}">{{ #login# }}</a></li>
                {{ /if }}
                {{ /dynamic }}                 
                <li class="social_links follow"><a href="#">{{ #followUs# }}</a>
                  <ul class="sub">
                    <li><a href="https://twitter.com/ScopeatRyerson" rel="external">{{ #followAtTwitter# }}</a></li>
                    <li><a href="https://www.facebook.com/ScopeatRyerson" rel="external">{{ #likeOnFacebook# }}</a></li>
                    <li><a href="http://{{ $gimme->publication->site }}/en/static/rss/">{{ #signupRSS# }}</a></li>
                  </ul>
                </li>
                <li class="share"><a href="#">{{ #shareThis# }}</a>
                  <ul class="sub">
                    {{ $whereami = $view->serverUrl($smarty.server.REQUEST_URI)|escape }}
                    <li><a href="http://twitter.com/share?url={{ $whereami }}&text={{ if $gimme->article->name }}{{ $gimme->article->name }}{{ else }}{{ $gimme->issue->name }}{{ /if }}&via=ScopeatRyerson">{{ #tweetOnTwitter# }}</a></li>
                    <li><a href="//www.facebook.com/sharer/sharer.php?u={{ $whereami }}">{{ #postToFacebook# }}</a></li>
                    <li><a href="https://plus.google.com/share?url={{ $whereami }}">{{ #shareGooglePlus# }}</a></li>
                  </ul>
                </li>
              </ul>
              {{ search_form template="search.tpl" html_code="class=\"search-box\"" button_html_code="class=\"button\"" }} 
              <a href="#" class="search-trigger"></a>
              <div class="hiden">
                 {{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"input search\"" }}
              {{ /search_form }}
              {{ /local }}
              </div>
          </div>
        </div><!-- / Top -->
        
        <div id="header" class="clearfix">
            <h1>
              <a href="/">Ryerson Radio</a>
            </h1>

<!--             <div class="radio_player">
              <h2>LISTEN <span>LIVE</span></h2>
              <img src="{{ url options='site' }}assets/img/player_buttons.png">
              <p>Current: Good Morning Canada</p>
            </div>
 -->
            <div id="headerLiveTrackHolder" class="radio_player">
              <h2>Offline</h2>
              <button id="playNow" aria-controls="audio" title="Begin audio streaming">Play Now</button>
              <p>Current:</p>
            </div>

            <p class="donate">
              {{ local }}
              {{ unset_topic }}
              {{ set_issue number=1 }}
              {{ set_section number=5 }}
              {{ list_articles length=1 constraints="name is Donate" }}
                <a href="{{ url options='article' }}">CLICK HERE TO <span>DONATE</span></a>
              {{ /list_articles }}
              {{ unset_section }}
              {{ unset_issue }}
              {{ /local }}
            </p>

        </div><!-- / Header -->
        
        <div id="nav-bar" class="clearfix">
          <a href="#" class="cat-trigger">Content</a>
          {{ local }}
          {{ set_issue number="10" }}
          {{ $count = 1 }}
          <ul class="show">
            <li><a href="/">Home</a></li>
            {{ list_sections constraints="number not 30 number not 40 number not 80 number not 90 number not 100" }}

            {{ if $count === 1 }}
            <li>
              <a href="#">Programs</a>
              <ul>
              {{ local }}
              {{ set_issue number="1" }}
              {{ list_articles constraints="number is 110"}}
                <li><a href="{{ url options='article' }}">{{* $gimme->article->number *}}{{ $gimme->article->name }}</a></li>
              {{ /list_articles }}
              {{ /local }}
              {{ list_sections constraints="number is 100" }}
                <li><a href="{{ url options='section' }}">{{* $gimme->section->number *}}Shows</a></li>
              {{ /list_sections }}
              {{* list_sections constraints="number is 80" }}
                <li><a href="{{ url options='section' }}">Podcasts</a></li>
              {{ /list_sections *}}
              </ul>
            </li>
            {{ /if }}
  
            {{ if $count === 3 }}
            <li>
              <a href="#">Music</a>
              <ul>
              {{ list_sections constraints="number greater 20 number smaller 40" }}
                <li><a href="{{ url options='section' }}">{{* $gimme->section->number *}}{{ $gimme->section->name }}</a></li>
              {{ /list_sections }}
              {{ list_sections constraints="number greater 30 number smaller 50" }}
                <li><a href="{{ url options='section' }}">{{* $gimme->section->number *}}{{ $gimme->section->name }}</a></li>
              {{ /list_sections }}
              {{ list_sections constraints="number greater 80 number smaller 100" }}
              <li><a href="{{ url options='section' }}">{{* $gimme->section->number *}}{{ $gimme->section->name }}</a></li>
              {{ /list_sections }}
              {{ local }}
              {{ set_issue number="1" }}
              {{ list_articles constraints="name is Charts" }}
                <li><a href="{{ url options='article' }}">{{* $gimme->article->number *}}{{ $gimme->article->name }}</a></li>
              {{ /list_articles }}
                {{*<li><a href="{{ $view->url(['controller' => 'user', 'action' => 'index'], 'default') }}" title="{{ #communityIndex# }}">{{ #artists# }}</a></li>*}}
              {{ /local }}
              </ul>
            </li>
            {{ /if }}
            <li><a href="{{ url options='section' }}">{{* $gimme->section->number *}}{{ $gimme->section->name }}</a></li>
            {{ $count = $count + 1 }}
          {{ /list_sections }}
          </ul>
          {{ /local }}
        </div><!-- / Nav Bar -->

    </header>