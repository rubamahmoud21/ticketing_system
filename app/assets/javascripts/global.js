$(document).on('turbolinks:load', function() {
  $(".collpase").on("click", function(){
    $(this).find(".fa").toggleClass("fa-caret-down");
    $(this).find(".fa").toggleClass("fa-caret-right");
  
    if($(this).find(".fa").hasClass("fa-caret-down")){
      $(this).closest(".section").find(".content").slideDown(300);
    }else{
      $(this).closest(".section").find(".content").slideUp(300);
    }
  });

  $('.display-modal').on('shown.bs.modal', function() {
    $(".modal").modal('show');
  })

  $(".select2").select2({
    tags: true,
    width: '100%',
  });

  $(".project-page .selected-user").on("change", function(){
    if($(this).val()== null){
      $(".send-invitation-button").attr("disabled", true);
    }else{
      $(".send-invitation-button").attr("disabled", false);
    }
  });

});