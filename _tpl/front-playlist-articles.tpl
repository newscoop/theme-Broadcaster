<section class="home_top">

    <section class="bxslider">
    {{ list_playlist_articles name="Carousel" length="4" }}

        <article>
            <a href="{{ url options='article' }}">{{ include file="_tpl/img/img_front.tpl" where="topfront" }}</a>
            <h2><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h2>
        </article>

    {{ /list_playlist_articles }}
    </section>

    <div class="chart_home">
      <h2>Current <span>Charts</span></h2>
      {{*<h2>CHART <span>{{ $smarty.now|camp_date_format:"%M" }}</span></h2>*}}
      {{ local }}
      {{ set_section number="90" }}
      {{ list_articles length="1" order="byPublishDate desc" }}
        <ol>
          <li><span>{{ $gimme->article->one_artist }} - {{ $gimme->article->one_album }}</span></li>
          <li><span>{{ $gimme->article->two_artist }} - {{ $gimme->article->two_album }}</span></li>
          <li><span>{{ $gimme->article->three_artist }} - {{ $gimme->article->three_album }}</span></li>
        </ol>
        <p><a href="{{ url options='article' }}">Full chart</a></p>
      {{ /list_articles }}
      {{ unset_section }}
      {{ /local }}
    </div>
    <div class="current_widget" id="headerLiveHolder">
      <h2>Offline</h2>
    </div>

</section>