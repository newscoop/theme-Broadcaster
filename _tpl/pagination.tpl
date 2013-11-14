{{ if $gimme->current_list->count > $gimme->current_list->length }}

{{ $page=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
{{ $list_id=$gimme->current_list_id() }}

<div class="paging-holder">
 {{ unset_article }}

  <ul class="paging">
 {{ if $gimme->current_list->has_previous_elements }}

 <li><a href="{{ url options="previous_items" }}" class="prev" title=""><span>+</span> <span>{{ #previous# }}</span> {{ #page# }}</a></li>


 {{/if}}

 {{assign var="allPages" value=($gimme->current_list->count/$listLength)|ceil  }}
 {{assign var="currentPage" value=$page/$listLength}}

 {{assign var="firstToShow" value=$currentPage-2}}
 {{assign var="lastToShow" value=$currentPage+5}}

 {{if $firstToShow < 1 }}
 {{assign var="firstToShow" value=1}}
 {{assign var="lastToShow" value=$lastToShow+3}}
 {{/if}}

 {{if $lastToShow > $allPages }}
 {{assign var="lastToShow" value=$allPages+1}}
 {{/if}}

 {{if $lastToShow-$firstToShow>0}}

  {{ section name=foo start=$firstToShow loop=$lastToShow }}

    {{ if $smarty.section.foo.index-1==$currentPage }}
      <li class="active">{{ $smarty.section.foo.index }}</li>
    {{ else }}
      {{ if $gimme->section->number == 50 || $gimme->section->number == 60 }}
        <li><a href="{{ url options="section" }}?{{$list_id}}={{ ($smarty.section.foo.index-1)*($listLength) -1 }}{{if $gimme->topic->identifier}}&tpid={{$gimme->topic->identifier}}{{/if}}">{{ $smarty.section.foo.index }}</a></li>
      {{ else }}
        <li><a href="{{ url options="section" }}?{{$list_id}}={{ ($smarty.section.foo.index-1)*($listLength) }}{{if $gimme->topic->identifier}}&tpid={{$gimme->topic->identifier}}{{/if}}">{{ $smarty.section.foo.index }}</a></li>
      {{ /if }}
    {{ /if }}
  {{ /section }}

  {{/if}}

  {{ if $gimme->current_list->has_next_elements }}

    <li><a href="{{ url options="next_items" }}" class="next" title=""><span>{{ #next# }}</span> {{ #page# }} <span>+</span></a></li>

  {{ /if }}
    </ul>
  </div>

{{ /if }}
