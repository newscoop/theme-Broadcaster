<div id="content" class="article_show">

{{ include file="_tpl/img/img_show.tpl" where="article" }}

<article>
  <div>
    <h2>{{ $gimme->article->name }}</h2>

      {{* include file="_tpl/complex_date.tpl" *}}

    {{ if $gimme->article->host }}
    <span>hosted by: {{ $gimme->article->host }}</span>
    {{ /if }}
  </div>

  {{ $gimme->article->full_text }}

</article>

{{ if $gimme->article->shows }}
<div class="title page-title">
  <h2>{{ if $gimme->section->number == 80 }}PODCAST{{ else }}SHOW{{ /if }} <span>ARCHIVE</span></h2>
</div>
{{ /if }}
<!--
<ul class="show_years">
  <li class="active"><a href="#">2013</a></li>
  <li><a href="#">2012</a></li>
  <li><a href="#">2011</a></li>
  <li><a href="#">2010</a></li>
</ul>
-->

{{ if $gimme->article->shows }}
<section>
  {{ $gimme->article->shows }}
</section>
{{ /if }}


</div>