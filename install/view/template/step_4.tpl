<?php echo $header; ?>
<div class="container">
  <header>
      <div class="row">
        <div class="col-sm-6">
          <h1 class="pull-left">4<small>/4</small></h1>
          <h3><?php echo $heading_step_4; ?><br><small><?php echo $heading_step_4_small; ?></small></h3>
        </div>
        <div class="col-sm-6">
          <div id="logo" class="pull-right hidden-xs">
            <img src="view/image/logo-sample.png" alt="Sample" title="Sample" />
          </div>
        </div>
      </div>
  </header>
  <?php if ($success) { ?>
    <div class="alert alert-success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="alert alert-danger"><?php echo $text_forget; ?></div>
  <div class="visit">
    <div class="row">
      <div class="col-sm-5 col-sm-offset-1 text-center">
        <img src="view/image/icon-store.png">
        <a class="btn btn-secondary" href="../"><?php echo $text_shop; ?></a>
      </div>
      <div class="col-sm-5 text-center">
        <img src="view/image/icon-admin.png">
        <a class="btn btn-secondary" href="../admin/"><?php echo $text_login; ?></a>
      </div>
    </div>
  </div>
</div>
<!--<?php echo $footer; ?>-->
<script type="text/javascript">
function searchExtensions() {
  var html = '';

  $.ajax({
    url: 'index.php?route=step_4/extensions',
    type: 'post',
    dataType: 'json',
    beforeSend: function() {
      $('#modules-loading').show();
      $('#modules').empty().hide();
    },
    success: function(json) {
      $.each (json.extensions, function(key, val) {
        html = '<div class="col-sm-6 module">';
          html += '<a class="thumbnail pull-left" href="'+val.href+'"><img src="'+val.image+'" alt="'+val.name+'"></a>';
          html += '<h5>'+val.name+'</h5>';
          html += '<p>'+val.price+' <a target="_BLANK" href="'+val.href+'"><?php echo $text_view; ?></a></p>';
          html += '<div class="clearfix"></div>';
        html += '</div>';

        $('#modules').append(html);
      });

      $('#modules').fadeIn();
      $('#modules-loading').hide();
    },
    failure: function() {
      $('#modules-loading').hide();
    },
    error: function() {
      $('#modules-loading').hide();
    }
  });
}
function searchLanguages() {
  var html = '';

  $.ajax({
    url: 'index.php?route=step_4/language',
    type: 'post',
    data: {'language' : '<?php echo $language; ?>' },
    dataType: 'json',
    beforeSend: function() {
      $('#module-language').empty().hide();
    },
    success: function(json) {
      if (json.extension != '') {
        html = '<div class="row">';
          html += '<div class="col-sm-12">';
            html += '<img class="img-rounded" src="'+json.extension.image+'">';
            html += '<h3>'+json.extension.name+'<br><small><?php echo $text_downloads; ?>: '+json.extension.downloaded+', <?php echo $text_price; ?>: '+json.extension.price+'</small></h3>';
            html += '<a class="btn btn-primary" href="'+json.extension.href+'" target="_BLANK"><?php echo $text_download; ?></a>';
          html += '</div>';
        html += '</div>';

        $('#module-language').html(html).fadeIn();
      }
    },
    failure: function() { },
    error: function() { }
  });
}
$( document ).ready(function() {
  searchExtensions();
  searchLanguages();
});
//--></script>