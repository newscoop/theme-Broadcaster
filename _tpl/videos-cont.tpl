<div class="title">
  <h2>{{ #section# }} <span>{{ $gimme->section->name }}</span></h2>
</div>

{{ $listLength = 9 }}

{{ list_articles length=$listLength }}

  {{ if $gimme->current_list->at_beginning }}
    {{ if $gimme->current_list->index lte 2 }}
      <section class="grid-2">
    {{ else }}
      {{* $gimme->current_list->index->set_parameter($gimme->current_list->index(),$gimme->current_list->index - 1) *}}
      <section class="grid-3">
    {{ /if }}
  {{ /if }}
  {{ if $gimme->current_list->index lte 2 }}
      <article>
        {{ if $gimme->article->vimeo_shortcode|strip }}
          <iframe src="//player.vimeo.com/video/{{ $gimme->article->vimeo_shortcode|strip }}" width="420" height="315" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
        {{ else if $gimme->article->youtube_shortcode|strip }}
          <iframe src="//www.youtube.com/embed/{{ $gimme->article->youtube_shortcode|strip }}" width="420" height="315" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
        {{ /if }}
        <h3><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></h3>
        <p class="dat_aut"><span class="date">{{ $gimme->article->publish_date }}</span> /
          {{ list_article_authors }}
            {{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}by {{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }}
          {{ /list_article_authors }}
        </p>
        <p>{{ include file="_tpl/_edit-article.tpl" }}{{ $gimme->article->deck|truncate:360 }}</p>
      </article>
  {{ /if }}
  {{ if $gimme->current_list->index == 2 || ($gimme->current_list->at_end && $gimme->current_list->index lte 2) }}            
    </section><!-- / 2 article grid -->
  {{ /if }}
  {{ if $gimme->current_list->index == 3 }}
  <div class="title">
    <h2>{{ #moreVideos# }}</h2>
  </div>

  <section class="grid-3">
  {{ /if }}
  {{ if $gimme->current_list->index gte 3 }}
    {{ if $gimme->current_list->index == $listLength && $gimme->current_list->at_end }}
      {{* don't display the first page item that matches the length of the list *}}
    {{ else }}
    <article>
      {{ if $gimme->article->vimeo_shortcode|strip }}
        <iframe src="//player.vimeo.com/video/{{ $gimme->article->vimeo_shortcode|strip }}" width="290" height="210" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>
      {{ else if $gimme->article->youtube_shortcode|strip }}
        <iframe src="//www.youtube.com/embed/{{ $gimme->article->youtube_shortcode|strip }}" width="290" height="210" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>
      {{ /if }}
      <h4>{{ $gimme->article->name }}</h4>
      <p class="dat_aut"><span class="time">{{ $gimme->article->publish_date|camp_date_format:"%M %d, %Y" }} /  {{ #by# }} {{ list_article_authors }}{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }} ({{ $gimme->author->type|lower }}){{ if !$gimme->current_list->at_end }}, {{ /if }}{{ /list_article_authors }}</span></p>
      <p>{{ include file="_tpl/_edit-article.tpl" }}{{ $gimme->article->deck|truncate:170 }}</p>
    </article>
    {{ /if }}
{{ /if }}
{{ if $gimme->current_list->at_end && !($gimme->current_list->index == 2) }}
  </section><!-- / 3 articles grid -->  
{{ /if }}

{{ if $gimme->current_list->at_end }}
  {{ include file="_tpl/pagination.tpl" }}
{{ /if }}
{{ /list_articles }}
