// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular
//= require angular-ui-router
//= require angular-rails-templates
//= require bootstrap
//= require_tree .
//= require_tree ../templates

$('body').addClass('sticky');
  			}
	  	} else {
		  	$('body').removeClass('sticky');
		  	$('.site-nav').removeAttr('style');
	  	}
    });
  
  $('.site-nav a').click(function(e){
    if(!$(this).hasClass('search-trigger'))
    {
      $('.site-nav a.active').removeClass('active');
      $(this).addClass('active');
    }
    $(this).blur()
    e.preventDefault();
  });
});