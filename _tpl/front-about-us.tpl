{{ list_articles length="1" ignore_issue="true" ignore_section="true" constraints="issue is 1 section is 5 type is page" }}             
	<p>{{ $gimme->article->full_text|strip_tags:false|truncate:250 }} </p>
{{ /list_articles }}