{{ list_articles length="1" ignore_issue="true" ignore_section="true" constraints="issue is 1 section is 5 type is page onfrontpage is on" }}             
	<p>{{ $gimme->article->full_text|strip_tags:false|truncate:180 }} </p>
	<a class="front_read_more" href="{{ url options="article" }}">read more...</a>
{{ /list_articles }}