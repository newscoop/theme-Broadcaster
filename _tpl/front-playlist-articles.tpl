<section class="home_top">

    {{ $currlang = $gimme->language->code }}
    {{ $currplaylist = "Carousel-" }}
    {{ $currplaylist = $currplaylist|cat:$currlang }}

    <section class="bxslider">
    {{ list_playlist_articles name="$currplaylist" length="4" }}

        <article>
            <a href="{{ url options='article' }}">{{ include file="_tpl/img/img_front.tpl" where="topfront" }}</a>
            <h2><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h2>
        </article>

    {{ /list_playlist_articles }}
    </section>

    <article>
        <h2>LATEST <span>NEWS</span></h2>
        {{ set_section number="60" }}
        {{ list_articles length="1" order="bydate desc" }}
            <figure>
                <a href="{{ url option='article' }}">{{ include file="_tpl/img/img_onethird.tpl" }}</a>
            </figure>
            <h4><a href="{{ url options='article' }}">{{ $gimme->article->name }}</a></h4>
            <p><span class="time">{{ $gimme->article->publish_date }}</span> /
            <a class="comments_num" href="{{ url options='article' }}#comments">{{ $gimme->article->comment_count }} comment{{ if $gimme->article->comment_count != 1 }}s{{ /if }}</a></p>
        {{ /list_articles }}
        {{ unset_section }}
    </article>

    <div class="current_widget" id="headerLiveHolder">
      <h2>Offline</h2>
    </div>

</section>