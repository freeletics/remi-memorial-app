$(function() {
  if ($.fn.cloudinary_fileupload !== undefined) {
    $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();

    $(".cloudinary-fileupload").bind("fileuploadprogress", function(e, data) {
      $(".progress_bar").css("width", Math.round((data.loaded * 100.0) / data.total) + "%");
    });
  }
});
