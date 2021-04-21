import Rails from "@rails/ujs"
import 'bootstrap/dist/js/bootstrap'
import '../styles/application'

const images = require.context('../images', true)

Rails.start()

$(function()
  {$('#ask-button').click(function(){
     $('#ask-form').slideToggle(300);
     return false;
  });
});
