<div class="title">
  <h2>{{ #section# }} <span>{{ $gimme->section->name }}</span></h2>
</div>

{{ $listLength = 9 }}

{{ list_articles length=$listLength }}

  {{* $gimme->current_list->index->set_parameter($gimme->current_list->index(),$gimme->current_list->index - 1) *}}
{{ if $gimme->current_list->at_beginning }}
  <section class="grid-3">
{{ /if }}
    <article>
      <figure>
        <a href="{{ url options='article' }}">{{ include file="_tpl/img/img_onethird.tpl" where="article" }}</a>
      </figure>
      <h4><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></h4>
      {{* include file="_tpl/complex_date.tpl" *}}
      {{*
      <p class="dat_aut"><span class="time">{{ $gimme->article->publish_date|camp_date_format:"%M %d, %Y" }} /  {{ #by# }} {{ list_article_authors }}{{ if $gimme->author->user->defined }}<a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }} ({{ $gimme->author->type|lower }}){{ if !$gimme->current_list->at_end }}, {{ /if }}{{ /list_article_authors }}</span></p>
      *}}
      <p>{{ include file="_tpl/_edit-article.tpl" }}{{ $gimme->article->deck|truncate:170 }}</p>
    </article>
{{ if $gimme->current_list->at_end }}
  </section><!-- / 3 articles grid -->  
{{ /if }}

{{ if $gimme->current_list->at_end }}
  {{ include file="_tpl/pagination.tpl" }}
{{ /if }}
{{ /list_articles }}