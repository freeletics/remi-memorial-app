$(function() {
  var form = $('#message-form');
  var button = form.find('input[type=submit]');
  var input = $('input.cloudinary-fileupload[type=file]');

  // Setup file fields
  input.cloudinary_fileupload({
    maxFileSize: 1000 * 1000 * 10,          // 10MB
    loadImageMaxFileSize: 1000 * 1000 * 10, // 10MB
    acceptFileTypes: /(\.|\/)(jpe?g|png)$/i
  });

  input.on('fileuploadadd', function (event, data) {
    var file = data.files[0];

    $('#direct-upload').remove();
    event.target.insertAdjacentHTML(
      'beforebegin',
      '<div id="direct-upload" class="direct-upload direct-upload--pending">' +
        '<div id="direct-upload-progress" class="direct-upload__progress" style="width: 0%"></div>' +
        '<span class="direct-upload__filename">' + file.name + '</span>' +
      '</div>'
    );
  });

  input.on('fileuploadsubmit', function () {
    $('#direct-upload').removeClass('direct-upload--pending');
    button.prop('disabled', true);
  });

  input.on('cloudinaryprogressall', function (event, data) {
    var progress = Math.round((data.loaded * 100.0) / data.total) + '%';
    $('#direct-upload-progress').css('width', progress);
  });

  input.on('cloudinarydone', function (event) {
    $('#direct-upload').addClass('direct-upload--complete');
    button.prop('disabled', false);
  });
});
