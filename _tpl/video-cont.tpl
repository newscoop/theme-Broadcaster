<article>
  <small>
    <a href="{{ url options='section' }}">{{ $gimme->section->name }}</a>
      {{ list_article_topics }}
        {{ if $gimme->current_list->at_beginning }}<em>/ {{ /if }}
        <a href="{{ url options="template topic.tpl" }}">{{ $gimme->topic->name }}</a>
        {{ if $gimme->current_list->at_end }}</em>{{ else }}, {{ /if }}
      {{ /list_article_topics }}
  </small>
  <h2>{{ $gimme->article->name }}</h2>
  {{ if $gimme->article->vimeo_shortcode|strip }}
    <iframe src="//player.vimeo.com/video/{{ $gimme->article->vimeo_shortcode|strip }}" width="610" height="457" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
  {{ else if $gimme->article->youtube_shortcode|strip }}
    <iframe width="610" height="457" src="//www.youtube.com/embed/{{ $gimme->article->youtube_shortcode|strip }}" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
  {{ else }}
    <figure>{{ include file="_tpl/img/img_big.tpl" where=article }}</figure>
  {{ /if }}
  <span class="date">{{ $gimme->article->publish_date|camp_date_format:"%d %M %Y" }} / {{ #by# }} {{ list_article_authors }}{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }} ({{ $gimme->author->type|lower }}){{ if !$gimme->current_list->at_end }}, {{ /if }}{{ /list_article_authors }} {{ list_article_locations }}{{ if $gimme->current_list->at_beginning }}/ {{ /if }}{{ if $gimme->location->enabled }}{{ $gimme->location->name }}{{ if $gimme->current_list->at_end }}{{ else }}, {{ /if }}{{ /if }}{{ /list_article_locations }}</span>
  {{ if $gimme->article->content_accessible }}
    {{ include file="_tpl/_edit-article.tpl" }}{{ $gimme->article->full_text }}
  {{ else }}
    <p><em>{{ #thisArticleIsLocked# }}</em></p>
  {{ /if }}
</article>