  <script src="{{ uri static_file="assets/js/libs/jquery.jcarousel.min.js" }}"></script>

  <!--[if (gte IE 6)&(lte IE 8)]>
    <script type="text/javascript" src="{{ uri static_file="assets/js/libs/selectivizr-min.js" }}"></script>
  <![endif]-->

  {{ if $gimme->article->defined }}
  <script src="{{ url static_file='assets/js/article-rating.js' }}"></script>
  {{ /if }}

  <script src="{{ url static_file='assets/js/libs/jquery.showinfo.js' }}"></script>
  <script src="{{ uri static_file='assets/js/init.js' }}"></script>
  <script src="{{ url static_file='assets/js/libs/jquery.bxslider.min.js' }}"></script>
  <script src="{{ url static_file='assets/js/plugins.js' }}"></script>
  <script src="{{ url static_file='assets/js/script.js' }}"></script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'xx-xxxxxxxx-x', 'yourAppnameHere');
  ga('send', 'pageview');
</script>