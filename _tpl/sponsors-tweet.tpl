<div class="bottom_box">
  <div class="sponsors">
    <h2>Our sponsors<span> and friends</span></h2>
    {{ local }}
    {{ set_issue number='1' }}
    {{ set_article name="Sponsors" }}
    {{ $gimme->article->full_text }}
    {{ unset_article }}
    {{ /local }}
  </div>
  <div class="tweet_wrap">
    <h2><span>TWEET</span></h2>
    {{* twitter_plugin_block }}{{ /twitter_plugin_block *}}
  </div>
</div>