<div class="title">
  <h2>{{ #section# }} <span>{{ $gimme->section->name }}</span></h2>
</div>

{{* is the section news? *}}
{{ if $gimme->section->name == News }}

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
        <a href="{{ url option='article' }}">{{ include file="_tpl/img/img_onehalf.tpl" }}</a>
        <small><a href="{{ url options='section' }}">{{ $gimme->section->name }}</a></small>
        <h3><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></h3>
        <p><span class="time">{{ $gimme->article->publish_date }}</span> /
          {{ list_article_authors }}
            {{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}by {{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }}
          {{ /list_article_authors }}
        </p>
        <p>{{ include file="_tpl/_edit-article.tpl" }}{{ $gimme->article->deck|truncate:360 }}</p>
        <span class="more"><a href="{{ url options='article' }}">+  {{ #readMore# }}</a> or <a href="{{ url options='article' }}#comments">{{ #addComment# }} ({{ $gimme->article->comment_count }})</a></span>
      </article>
  {{ /if }}
  {{ if $gimme->current_list->index == 2 || ($gimme->current_list->at_end && $gimme->current_list->index lte 2) }}            
    </section><!-- / 2 article grid -->
  {{ /if }}
  {{ if $gimme->current_list->index == 3 }}
  <div class="title">
    <h2>MORE <span>STORIES</span></h2>
  </div>

  <section class="grid-3">
  {{ /if }}
  {{ if $gimme->current_list->index gte 3 }}
    {{ if $gimme->current_list->index == $listLength && $gimme->current_list->at_end }}
      {{* don't display the first page item that matches the length of the list *}}
    {{ else }}
    <article>
      <a href="{{ url option='article' }}">{{ include file="_tpl/img/img_onethird.tpl" }}</a>
      <small><a href="{{ url options='section' }}">{{ $gimme->section->name }}</a> {{ list_article_topics }}{{ if $gimme->current_list->at_beginning }}<em>/ {{ /if }}<a href="{{ url options='template topic.tpl' }}">{{ $gimme->topic->name }}</a>{{ if $gimme->current_list->at_end }}</em>{{ else }}, {{ /if }}{{ /list_article_topics }}</small>
      <h4><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></h4>
      <span class="date">{{ $gimme->article->publish_date|camp_date_format:"%M %d, %Y" }} /  {{ #by# }} {{ list_article_authors }}{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }} ({{ $gimme->author->type|lower }}){{ if !$gimme->current_list->at_end }}, {{ /if }}{{ /list_article_authors }}</span>
      <p>{{ include file="_tpl/_edit-article.tpl" }}{{ $gimme->article->deck|truncate:170 }}</p>
      <span class="more"><a href="{{ url options='article' }}">+  {{ #readMore# }}</a> or <a href="{{ url options='article' }}#comments">{{ #addComment# }} ({{ $gimme->article->comment_count }})</a></span>
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
{{ else }}
{{* section is not news, do something else with the content *}}

<section class="grid-3">
    {{ list_articles length="12" }}
    <article>
      {{ if $gimme->section->number == 30 }}
        <a href="{{ url option='article' }}">{{ include file="_tpl/img/img_square_lrg.tpl" }}</a>
      {{ else }}
        <a href="{{ url option='article' }}">{{ include file="_tpl/img/img_onethird.tpl" }}</a>
      {{ /if }}
      <small><a href="{{ url options='section' }}">{{ $gimme->section->name }}</a> {{ list_article_topics }}{{ if $gimme->current_list->at_beginning }}<em>/ {{ /if }}<a href="{{ url options='template topic.tpl' }}">{{ $gimme->topic->name }}</a>{{ if $gimme->current_list->at_end }}</em>{{ else }}, {{ /if }}{{ /list_article_topics }}</small>
      <h4><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></h4>
      <span class="date">{{ $gimme->article->publish_date|camp_date_format:"%M %d, %Y" }} /  {{ #by# }} {{ list_article_authors }}{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }} ({{ $gimme->author->type|lower }}){{ if !$gimme->current_list->at_end }}, {{ /if }}{{ /list_article_authors }}</span>
      <p>{{ include file="_tpl/_edit-article.tpl" }}{{ $gimme->article->deck|truncate:170 }}</p>
      <span class="more"><a href="{{ url options='article' }}">+  {{ #readMore# }}</a> or <a href="{{ url options='article' }}#comments">{{ #addComment# }} ({{ $gimme->article->comment_count }})</a></span>
    </article>
    {{ /list_articles }}
</section>

{{ /if }}

{{ if $gimme->current_list->at_end }}
 </section>
{{ /if }}
