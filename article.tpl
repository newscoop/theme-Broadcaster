{{ config_load file="{{ $gimme->language->english_name }}.conf" }}

{{ include file="_tpl/_html-head.tpl" }}

  {{ include file="_tpl/header.tpl" }}

  <div id="wrapper">

      {{ if $gimme->section->number == 30 }}
      <section class="main entry">
        <div id="content" class="article_album clearfix">
        {{ include file="_tpl/review-cont.tpl" }}
        {{ include file="_tpl/article-author.tpl" }}
        {{ include file="_tpl/article-comments.tpl" }}
        </div>
      </section>
      {{ else if $gimme->section->number == 50 }}
      <section class="main entry">
        <div id="content">
        {{ include file="_tpl/video-cont.tpl" }}
        </div>
      </section>
      {{ else if $gimme->section->number == 80 || $gimme->section->number == 100 }}
      <section>
        <div id="content">
        {{ include file="_tpl/podcast-cont.tpl" }}
        </div>
      </section>
      {{ else if $gimme->section->number == 90 }}
      <div id="content" class="article_chart">
        {{ include file="_tpl/chart-cont.tpl" }}
      </div>
      {{ else if $gimme->article->number == 110 }}
      <div id="content" class="program_grid">
        {{ include file="_tpl/program-grid-cont.tpl" }}
      </div>
      {{ else }}
      <section class="main entry">
        <div id="content" class="clearfix">
          {{ include file="_tpl/article-cont.tpl" }}
          {{ include file="_tpl/article-author.tpl" }}
          {{ include file="_tpl/article-comments.tpl" }}
        </div>
      </section><!-- / Entry -->
      {{ /if }}


      {{ if $gimme->article->number != 127 && $gimme->article->number != 110 && $gimme->section->number != 90 && $gimme->section->number != 80 && $gimme->section->number != 100 }}
        {{ include file="_tpl/article-aside.tpl" }}
      {{ /if }}

      {{ if $gimme->article->number != 110 && $gimme->section->number != 80 && $gimme->section->number != 10 && $gimme->section->number != 100 }}
      <div class="divider"></div>
      {{ /if }}

      {{ include file="_tpl/footer.tpl" }}

  </div><!-- / Wrapper -->

{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>