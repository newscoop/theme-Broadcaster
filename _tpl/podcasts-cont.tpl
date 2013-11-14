<div class="title">
  <h2>Online Only <span>Podcasts</span></h2>
</div>

<section class="grid-3">
  {{ $start = "2013" }}
  {{ $now = $smarty.now|camp_date_format:"%Y" }}
  {{ while $now >= $start }}
  <article>
      <h3>{{ $now }}</h3>
      <ul>
      {{ list_articles order="byPublishDate asc" }}
        {{ if $gimme->article->publish_date|camp_date_format:'%Y' == $now }}
          <li><a href="{{ url options='article' }}">{{ $gimme->article->name }} - {{ $gimme->article->publish_date|camp_date_format:"%Y" }}</a></li>
        {{ /if }}
        {{ if $gimme->current_list->at_end }}
          {{ $now = $now - 1 }}
        {{ /if }}
      {{ /list_articles }}
      </ul>
  </article>
  {{ /while }}
</section>