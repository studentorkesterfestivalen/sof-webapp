// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .


// Dont scroll down when using going back to register-card
if (location.hash == '#register-card') {
    setTimeout(function() {
        window.scrollTo(0, 0);
    }, 1);
}

// Provide current translations from selected locale
window.t = function() {
    return window.I18n[$('#locale').val()];
};

function initializeSelect() {
    var $this = $(this);
    var parent = $this.parent();
    if (parent.hasClass('select-wrapper')) {
        var element = $this.detach();
        parent.parent().append(element);
        parent.remove();
    }

    $(this).material_select();
}

// Fix broken input-field animation and wave effect when using turbolinks
$(document).on('turbolinks:load', function () {
    Materialize.updateTextFields();
    Waves.displayEffect();

    $('select').each(function() {
        initializeSelect.bind(this)();
    });

    // Initialize modal trigger buttons
    $('.modal').modal();
});
