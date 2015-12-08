<div id="content" class="article_show">

{{ include file="_tpl/img/img_show.tpl" where="article" }}

<article>
  <div>
    <h2>{{ $gimme->article->name }}</h2>

      {{* include file="_tpl/complex_date.tpl" *}}

    {{ if $gimme->article->host }}
    <span>{{ #hostedBy# }} {{ $gimme->article->host }}</span>
    {{ /if }}
  </div>

  {{ $gimme->article->full_text }}

</article>

{{ if $gimme->article->shows }}
<div class="title page-title">
  <h2>{{ if $gimme->section->number == 80 }}{{ #podcast# }}{{ else }}{{ #show# }}{{ /if }}{{ #archive# }}</h2>
</div>

<section>
  {{ $gimme->article->shows }}
</section>
{{ /if }}

</div>
