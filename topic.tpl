{{ config_load file="strings-{{ $gimme->language->code }}.tpl" }}

{{ include file="_tpl/_html-head.tpl" }}

{{ include file="_tpl/header.tpl" }}

  <div id="wrapper">

    <div id="content">
        
{{ include file="_tpl/topic-cont.tpl" }} 
            
{{* include file="_tpl/all-sections.tpl" *}} 
        
    </div><!-- / Content -->
        
{{ include file="_tpl/footer.tpl" }}
    
  </div><!-- / Wrapper -->
  
{{ include file="_tpl/_html-foot.tpl" }}

</body>
</html>
