<section class="grid-3">
    <article>
        <h2>ALBUM <span>REVIEW</span></h2>
        {{ set_section number="30" }}
        {{ list_articles length="1" order="bydate desc" }}
            <figure>
                <a href="{{ url option='article' }}">{{ include file="_tpl/img/img_onethird.tpl" }}</a>
            </figure>
            <h4><a href="{{ url options='article' }}">{{ $gimme->article->artist }}, <span>{{ $gimme->article->release }}</span></a></h4>
            <p><span class="time">{{ $gimme->article->publish_date }}</span> /
            <a class="comments_num" href="{{ url options='article' }}#comments">{{ $gimme->article->comment_count }} comment{{ if $gimme->article->comment_count != 1 }}s{{ /if }}</a></p>
        {{ /list_articles }}
        {{ unset_section }}
    </article>

    <article>
        <h2>LATEST <span>EVENT</span></h2>
        {{ set_section number="70" }}
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
</section>