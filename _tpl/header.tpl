<body dir="{{ if $gimme->issue->language->code == ar }}rtl{{ else }}ltr{{ /if }}">
    <header id="main_header">
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
                  {{ list_articles order="bynumber asc" }}
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
                    {{ local }}
                    {{ unset_language }}
                    {{ set_issue number = "1"}}
                    {{ set_section number = "10" }}
                    {{ list_articles constraints = "type is Site_Info" }}
                      {{ if $gimme->article->Twitter }}
                        <li>
                          <a href="https://twitter.com/{{ $gimme->article->Twitter }}" rel="external">{{ #followAtTwitter# }}</a>
                        </li>
                      {{ /if }}
                      {{ if $gimme->article->Facebook }}
                        <li>
                          <a href="https://www.facebook.com/{{ $gimme->article->Facebook }}" rel="external">{{ #likeOnFacebook# }}</a>
                        </li>
                      {{ /if }}
                    {{ /list_articles }}
                    {{ unset_section }}
                    {{ unset_issue }}
                    {{ set_default_language }}
                    {{ /local }}
                    <li><a href="http://{{ $gimme->publication->site }}/en/static/rss/">{{ #signupRSS# }}</a></li>
                  </ul>
                </li>
                <li class="share"><a href="#">{{ #shareThis# }}</a>
                  <ul class="sub">
                    {{ $whereami = $view->serverUrl($smarty.server.REQUEST_URI)|escape }}
                    {{ local }}
                    {{ set_issue number = "1"}}
                    {{ set_section number = "10" }}
                    {{ list_articles constraints = "type is Site_Info" }}
                      {{ if $gimme->article->Twitter }}
                      <li><a href="http://twitter.com/share?url={{ $whereami }}&text={{ if $gimme->article->name }}{{ $gimme->article->name }}{{ else }}{{ $gimme->issue->name }}{{ /if }}&via={{ $gimme->article->Twitter }}">{{ #tweetOnTwitter# }}</a></li>
                      {{ /if}}
                    {{ /list_articles }}
                    {{ unset_section }}
                    {{ unset_issue }}
                    {{ /local }}
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
            <a href="/">{{ $gimme->publication->name }}</a>
          </h1>

          {{ if $gimme->browser->ua_type == "mobile" }}
          <div id="headerLiveTrackHolder" class="radio_player mobile">
          {{ else }}
          <div id="headerLiveTrackHolder" class="radio_player desktop">
            {{ local }}
            {{ set_publication number = "2" }}
            {{ set_issue number = "1" }}
            {{ set_section number = "10" }}
            {{ list_articles length = "1" constraints = "type is Player" }}
            <script>
            var $url = '{{ $gimme->article->url }}';
            </script>
            {{ /list_articles }}
            {{ unset_section }}
            {{ set_default_issue }}
            {{ set_default_publication }}
            {{ /local }}
          {{ /if }}
            <h2>Offline</h2>
            <button id="playNow" aria-controls="audio" title="Begin audio streaming">Play Now</button>
            <p>Current:</p>
          </div>

          {{*
          <nav id="language_select">
            {{ local }}
            {{ unset_issue }}
            {{ unset_language }}
            <ul>
            {{ list_issues constraints = "number is 10" }}
            {{ $currLang = $gimme->language->name }}
            {{ set_language name="$currLang" }}
              <li {{ if $gimme->language->name == $gimme->default_language->name }}class="active"{{ /if }}><a href="{{ uri }}">{{ $gimme->language->name }}</a></li>
            {{ /list_issues }}
            </ul>
            {{ set_default_language }}
            {{ set_default_issue }}
            {{ /local }}
          </nav>
          *}}

        </div><!-- / Header -->
        
        <div id="nav-bar" class="clearfix">
          <a href="#" class="cat-trigger">Content</a>
          {{ local }}
          {{ set_issue number="10" }}
          <ul class="show">
            <li><a href="/">Home</a></li>
            {{ list_sections constraints="number not 30 number not 40 number not 80 number not 90 number not 100" }}

              {{ local }}
              {{ set_issue number="1" }}
              {{ list_articles constraints="type is Program_Grid"}}
                <li><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></li>
              {{ /list_articles }}
              {{ /local }}
              {{ list_sections constraints="number is 100" }}
                <li><a href="{{ url options='section' }}">Shows</a></li>
              {{ /list_sections }}
  
            </li>
            <li><a href="{{ url options='section' }}">{{ $gimme->section->name }}</a></li>
          {{ /list_sections }}
          </ul>
          {{ /local }}
        </div><!-- / Nav Bar -->

    </header>
