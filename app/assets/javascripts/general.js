document.addEventListener("turbolinks:load", function() {
    setTimeout(function(){
        $('.alert').remove();
    }, 5000);
});