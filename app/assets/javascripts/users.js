$(document).ready(function(){

  $('#start-finish').on('click', function(){
    var self = $(this);
    var type, url;
    if (self.text() === 'Start Work') {
      type = 'post';
      url = '/work_sessions/';
    } else {
      type = 'patch';
      url = '/work_sessions/' + this.getAttribute('data-id');
    }
    var project_id = $('#project').val();
    var data = {
      'project_id' : project_id
    }
    $.ajax({
      type: type,
      url: url,
      dataType: 'json',
      data: { 'work_session' : data },
      beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      success: function (data, stat, xhr) {
        console.log(data);
        if (type === 'post') {
          self.text('Finish Work');
          self.attr('data-id', data.id);
        } else if (type === 'patch') {
          self.text('Start Work');
          self.removeAttr('data-id');
        }
      }
    });
  });

});
