<div class="author-info">
  {{ list_article_authors }}
    {{ if $gimme->author->defined }}
      <img src="{{ $gimme->author->picture->imageurl }}" align="left" width="66px" />
      {{ if $gimme->author->user->defined }}
        <span class="more"><a href="{{ $view->url(['username' => $gimme->author->user->uname], 'user') }}">+  VIEW PROFILE</a></span>
      {{ /if }}
      <p><em>The author</em></p>
      <h3>
        {{ $gimme->author->name }}
      </h3>
      <p>{{ $gimme->author->biography->text|truncate:200 }}</p>
    {{ /if }}
  {{ /list_article_authors }}
</div>