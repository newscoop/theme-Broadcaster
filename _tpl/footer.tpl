{{ config_load file="settings.tpl" section="Site" }}
{{ config_load file="{{ $gimme->language->english_name }}.tpl" }}

  <div id="footer">
      
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
                {{ list_articles constraints = "type is Program_Grid" }}
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
              {{ if #TwitterName# !=null }}
                <li>
                  <a href="https://twitter.com/{{ #TwitterName# }}" rel="external">{{ #followAtTwitter# }}</a>
                </li>
              {{ /if }}
              {{ if #FacebookName# !=null }}
                <li>
                  <a href="https://www.facebook.com/{{ #FacebookName# }}" rel="external">{{ #likeOnFacebook# }}</a>
                </li>
              {{ /if }}
            <li><a href="http://{{ $gimme->publication->site }}/{{ $gimme->language->code }}/static/rss">{{ #signupRSS# }}</a></li>
          </ul>
        </li>
        <li>
        {{ if #StreetAddress# !=null }}
          {{ #StreetAddress# }}
        {{ /if }}
        </li>
        <li>
        {{ if #poweredBy# !=null }}
          <p>{{ #poweredBy# }}</p>
        {{ /if }}
        </li>
      </ul>
    
    </div>

  </div>
</body>
