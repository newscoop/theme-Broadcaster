      <div id="footer">
            
            {{ include file="_tpl/sponsors-tweet.tpl" }}
            
            <div id="bottom">
            
              <ul class="clearfix">
                  <li>
                      <ul>
                        {{ $count = 1 }}
                        {{ local }}
                        {{ set_issue number="10" }}
                        {{ list_sections constraints="number not 80" }}
                          {{ if $count == 1 }}
                            {{ local }}
                            {{ set_issue number="1" }}
                            {{ list_articles constraints="number is 110" }}
                              <li>{{* $count *}}<a href="{{ url options="article" }}" title="{{ $gimme->article->name }}">{{ $gimme->article->name }}</a></li>
                            {{ /list_articles }}
                            {{ /local }}
                            {{ $count = $count + 1 }}
                          {{ /if }}
                          <li>{{* $count *}}<a href="{{ url options="section" }}" title="{{ $gimme->section->name }}">{{ $gimme->section->name }}</a></li>
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
                        {{ list_articles constraints="number not 111 number not 105 number not 110 name not Sponsors" }}
                        <li><a href="{{ url options="article" }}" title="{{ $gimme->article->name }}">{{ $gimme->article->name }}</a></li>
                        {{ /list_articles }}
                        {{ /local }}
                      </ul>
                    </li>
                    <li>
                      <ul class='social_links'>
                        <li><a href="https://twitter.com/ScopeatRyerson" rel="external">{{ #followAtTwitter# }}</a></li>
                        <li><a href="https://www.facebook.com/ScopeatRyerson" rel="external">{{ #likeOnFacebook# }}</a></li>
                        <li><a href="http://{{ $gimme->publication->site }}/{{ $gimme->language->code }}/static/rss">{{ #signupRSS# }}</a></li>
                      </ul>
                    </li>
                    <li>
                      <p>The Scope at Ryerson<br />
                      55 Gould Street - Rm 201<br />
                      Toronto, ON M5B 1E9<br />
                      416.904.6889<p>
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