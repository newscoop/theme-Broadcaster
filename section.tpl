{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}

{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_tpl/header.tpl" }}

  <div id="wrapper">


{{ if $gimme->section->number == 30 }}
		<div id="content" class="album_section">
{{ else if $gimme->section->number == 50 }}
    <div id="content" class="video_section">
{{ else if $gimme->section->number == 80 || $gimme->section->number == 100 }}
    <div id="content" class="video_section podcast-show years_section">
{{ else if $gimme->section->number == 90 }}
    <div id="content" class="years_section category_charts">
{{ else }}
    <div id="content">
{{ /if }}

{{ if $gimme->section->number == 90 }}
  {{ include file="_tpl/charts-cont.tpl" }}
{{ else if $gimme->section->number == 50 }}
  {{ include file="_tpl/videos-cont.tpl" }}
{{ else if $gimme->section->number == 80 || $gimme->section->number == 100 }}
  {{ include file="_tpl/shows-cont.tpl" }}
{{ else }}
  {{ include file="_tpl/section-cont.tpl" }}
{{ /if }}

{{* if $gimme->section->number != 50 }}
  {{ include file="_tpl/section-two-blocks.tpl" }} 
{{ /if *}}

{{* include file="_tpl/all-sections.tpl" *}}

        </div><!-- / Content -->

{{ include file="_tpl/footer.tpl" }}

    </div><!-- / Wrapper -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>
