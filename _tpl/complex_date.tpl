{{ $now = $smarty.now|date_format: "%s" }}
{{ $next_date = false }}

{{ foreach from=$gimme->article->dates item="date_cur" }}
  {{ if "show_times" eq $date_cur->field_name }}
    {{ $this_date = $date_cur->start_date|date_format: "%s" }}
    {{ if $date_cur->recurring }}
      <!-- this is a recurring date, we need to generate the next date based on the start date -->
      {{ if $date_cur->recurring eq "daily" }}
        <!-- while date < now; date = date + 1 day -->
        {{ $new_date = $date_cur->start_date|date_format: "%s" }}
        {{ while $new_date < $now }}
          {{ $new_date = $new_date + 86400 }}
        {{ /while }}
        {{ $date = $new_date|camp_date_format:"%A %M %e" }}
        {{ $start = $date_cur->start_time|camp_date_format:"%H:%i" }}
        {{ $end = $date_cur->end_time|camp_date_format:"%H:%i" }}
      {{ /if }}
      {{ if $date_cur->recurring eq "weekly" }}
        <!-- while date < now; date = date + 7 days -->
        {{ $new_date = $date_cur->start_date|date_format: "%s" }}
        {{ while $new_date < $now }}
          {{ $new_date = $new_date + 604800 }}
        {{ /while }}
        {{ $date = $new_date|camp_date_format:"%A %M %e" }}
        {{ $start = $date_cur->start_time|camp_date_format:"%H:%i" }}
        {{ $end = $date_cur->end_time|camp_date_format:"%H:%i" }}
      {{ /if }}
      {{ if $date_cur->recurring eq "monthly" }}
        <!-- while date < now; date = date + 1 month  (doesn't really work for months -->
        {{ $new_date = $date_cur->start_date|date_format: "%s" }}
        {{ $add_date = $date_cur->start_date }}
        {{ while $new_date < $now }}
          {{ $add_date = strtotime("+1 month",$add_date) }}
          {{ $new_date = $add_date|date_format: "%s" }}
        {{ /while }}
        {{ $date = $add_date|camp_date_format:"%A %M %e" }}
        {{ $start = $date_cur->start_time|camp_date_format:"%H:%i" }}
        {{ $end = $date_cur->end_time|camp_date_format:"%H:%i" }}
      {{ /if }}
    {{ else }}
      <!-- this is not a recurring date, we need to find the next date from a list of dates -->
      {{ if $this_date > $now }}
        {{ $date = $date_cur->start_date|camp_date_format:"%A %M %e" }}
        {{ $start = $date_cur->start_time|camp_date_format:"%H:%i" }}
        {{ $end = $date_cur->end_time|camp_date_format:"%H:%i" }}
        {{ $last_date = $date_cur->start_date|date_format: "%s" }}
        {{ $next_date = true }}
      {{ /if }}
      {{ if $next_date eq true }}
        {{ if $this_date < $last_date }}
          {{ $date = $date_cur->start_date|camp_date_format:"%A %M %e" }}
          {{ $start = $date_cur->start_time|camp_date_format:"%H:%i" }}
          {{ $end = $date_cur->end_time|camp_date_format:"%H:%i" }}
        {{ /if }}
      {{ /if }}
    {{ /if }}
  {{ /if }}
{{ /foreach }}
{{ if $gimme->template->name == "article.tpl" }}
  <h3>{{ $date }} {{ $start }} - {{ $end }}</h3>
{{ else }}
  <dl class="show_time">
    <dt>Date:</dt>
      <dd class="start_date">{{ $date }}</dd>
    <dt>Start time:</dt>
      <dd>{{ $start }}</dd>
    <dt>End time:</dt>
      <dd>{{ $end }}</dd>
  </dl>
{{ /if }}