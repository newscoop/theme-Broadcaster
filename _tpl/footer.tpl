  <div id="footer">
      
    {{* include file="_tpl/sponsors-tweet.tpl" *}}
    
    <div id="bottom">
    
      <ul class="clearfix">
        <li>
          <ul>
            {{ $count = 1 }}
            {{ local }}
            {{ set_issue number="10" }}
            {{ list_sections }}
              {{ if $count == 1 }}
                {{ local }}
                {{ set_issue number = "1" }}
                {{ list_articles constraints = "number is 110" }}
                  <li><a href="{{ url options="article" }}" title="{{ $gimme->article->name }}">{{ $gimme->article->name }}</a></li>
                {{ /list_articles }}
                {{ /local }}
                {{ $count = $count + 1 }}
              {{ /if }}
              <li><a href="{{ url options="section" }}" title="{{ $gimme->section->name }}">{{ $gimme->section->name }}</a></li>
              {{ $count = $count + 1 }}
            {{ /list_sections }}
            {{ /local }}
          </ul>
        </li>
        <li>
          <ul>
            {{ local }}
            {{ set_issue number="1" }}
            {{ set_section number="5" }}
            {{ list_articles }}
            <li><a href="{{ url options="article" }}" title="{{ $gimme->article->name }}">{{ $gimme->article->name }}</a></li>
            {{ /list_articles }}
            {{ /local }}
          </ul>
        </li>
        <li>
          <ul class='social_links'>
            {{ local }}
            {{ set_issue number = "1"}}
            {{ set_section number = "10" }}
            {{ list_articles constraints = "number is 205" }}
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
            {{ /local }}
            <li><a href="http://{{ $gimme->publication->site }}/{{ $gimme->language->code }}/static/rss">{{ #signupRSS# }}</a></li>
          </ul>
        </li>
        <li>
        {{ local }}
        {{ set_issue number = "1"}}
        {{ set_section number = "10" }}
        {{ list_articles constraints = "number is 205" }}
        {{ if $gimme->article->Address }}
         {{ $gimme->article->Address }}
        {{ else }}
        <p><b>Sourcefabric GmbH</b><br />
        Prinzessinnenstr. 20, Aufgang A<br />
        10969 Berlin<br />
        +49 (0) 30 616 29 281</p>
        {{ /if }}
        {{ /list_articles }}
        {{ unset_section }}
        {{ unset_issue }}
        {{ /local }}
        </li>
        <li>
          <p>
            <a href="mailto:admin@thescopeatryerson.ca">admin@thescopeatryerson.ca</a><br />
            &copy; Powered by <a href="http://www.sourcefabric.org/en/newscoop/" target="_blank">Newscoop</a> and <a href="http://www.sourcefabric.org/en/airtime/" target="_blank">Airtime</a>
          </p>
        </li>
      </ul>
    
    </div>

  </div>
</body>