$(function() {
  $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();

  $(".cloudinary-fileupload").bind("fileuploadprogress", function(e, data) {
    // TODO: fixme
    $(".progress_bar").css("width", Math.round((data.loaded * 100.0) / data.total) + "%");
  });
});
