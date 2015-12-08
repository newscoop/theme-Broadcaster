{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}

{{ include file="_tpl/_html-head.tpl" }}

  {{ if $gimme->article->type_name == player || $gimme->article->type_name == Player }}

  {{ include file="_tpl/player_header.tpl" }}

  {{ else }}

  {{ include file="_tpl/header.tpl" }}

  <div id="wrapper">

      {{ if $gimme->article->type_name == Program_Grid }}
      <div id="content" class="program_grid">
        {{ include file="_tpl/program-grid-cont.tpl" }}
      </div>
      {{ else if $gimme->section->number == 100 }}
      <section>
        <div id="content">
        {{ include file="_tpl/podcast-cont.tpl" }}
        </div>
      </section>
      {{ else }}
      <section class="main entry">
        <div id="content" class="clearfix">
          {{ include file="_tpl/article-cont.tpl" }}
          {{ include file="_tpl/article-author.tpl" }}
          {{ include file="_tpl/article-comments.tpl" }}
        </div>
      </section><!-- / Entry -->
      {{ /if }}

      {{ if $gimme->article->type_name != Program_Grid && $gimme->section->number != 100 }}
      {{ include file="_tpl/article-aside.tpl" }}
      {{ /if }}

      {{ include file="_tpl/footer.tpl" }}

  </div><!-- / Wrapper -->

  {{ /if }}

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>
