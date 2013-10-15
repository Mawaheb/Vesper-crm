$(document).ready(function (){
  // Caching the Variables .
  var loading         = $('#loading_container');
  var checkboxes      = $('#checkboxes');
  var add_btn         = $('#addContact'); 
  var contacts_fields = $('#fields');
  var submit          = $('#submit');
  var num             = $('.followup').length ;
  var select_client   = $('#meeting_client_id');
  var followup_fieldset= $('.followup');
  var checked_chkbox  = checkboxes.children('input:checked').map(function(){ return this.value; });
  

  $('.alert').hide();
      
  // followup_fieldset.children().on("change", function(){
  //   $(this).parent().find("input[id$='_destroy']").val("false");
  // });

  contacts_fields.hide();
  //add_btn.hide();
  //select_client.trigger('change');

  // This was added to capture the Enter key press on the add contact field, and triger the submit button,
  // without it, the meeting form is submited instead.  
  $('#last_name').keypress(function(e){
    if (e.which == 13 ){
      e.preventDefault();
      submit.click();        
    };
  });

  // This button will Show the new Contact fields.
  add_btn.click(function() {        
    contacts_fields.slideDown();        
  });

  // This button will hide the new Contact fileds (cancel).
  $('#cancel').click(function() {
    contacts_fields.slideUp();
  });

  $('#addFollowup').click(function(){        
    var cloned = $('fieldset:first').clone(true);
    //cloned.find("input[id$='_destroy']").val("false");

    cloned.find('input,select,textarea').each(function() {
      //var num = $('.followup').length;
      var i = $(this).attr("id").replace(/\d+/, num);
      var n = $(this).attr("name").replace(/\d+/, num);
      $(this).val(""); // to clean the cloned fields, Needed only for Edit view, should get fixed.

      $(this).attr({
        name: n,
        id: i
      });
     if ($(this).is('input'))
      { 
        $(this).removeClass('hasDatepicker');
        $(this).val("");
        $(this).datepicker({ dateFormat: 'dd-mm-yy' });
      }
    })
    num++ ;    
    cloned.find('.rmvFields').removeClass('hidden');
    cloned.appendTo('.followups_div').hide();
    cloned.slideDown();
  });

  // This button removes the followup fields.
  $('.rmvFields').on("click",function() {
    if(confirm("Are you sure you want to delete this followup?"))
    {
      var fieldset = $(this).closest('fieldset'); 
      fieldset.slideUp("normal",function(){
        fieldset.find("input[id$='_destroy']").val("true"); // the hidden _destroy field. 
      
        var followup = fieldset.next().val();
        var jsonObject = { followup_id:  followup  }
        $.ajax({
          type: "POST",
          url: '/meetings/delete_followup/' ,
          data: jsonObject,
          dataType: 'script'
        });
      });
    }
  });

  // This button will handle adding new contact submesion.
  submit.click(function() {
    var client_id    = $('#meeting_client_id').val();
    var first_name  = $('#first_name').val();
    var last_name   = $('#last_name').val();
    var dataString  =   client_id + first_name + " " + last_name  
    var jsonObject = { contact: { fn: first_name , ln: last_name }, c_id: client_id }

    $.ajax({
      type: "PUT",
      url: '/clients/add_contacts/' + client_id ,
      data:   jsonObject  ,
      dataType: 'script' ,
     })
        //.done(function( msg ){
        //  alert( "Data Saved: " + msg.client );
          // contacts_fields.slideUp();
        // });
  });

  select_client.on("change",function(){
    loading.removeClass("hide"); // The Ajax loader gif .
    add_btn.hide();              // The add contacts button.   
    checkboxes.empty();          // The div that contains the contacts.
    contacts_fields.hide();      // The div for adding new cotacts.         
    var id = this.value;      // The currently selected Client ID .
    if(id != "") 
      {  

        $.getJSON('/clients/client_contacts/' + id, function(data){              
          if( data["contacts"].length == [] ) 
          {  
            loading.addClass("hide");            
            checkboxes.text("No Any contacts for the selected client");
            add_btn.show();                
          }
          else
          {
            loading.addClass("hide");
            add_btn.show();
            $.each(data.contacts, function () {
              var name = this.nf + " " + this.nl ;
              //if this.Id in prev_selected then this.checked = true ; 
              var chk_box = $('<input name="contact_ids[]" type="checkbox" value="'+this._id+'" >'+name+'</option><br />');

              if ($.inArray(chk_box.val() , checked_chkbox) != -1)
              {
                chk_box.attr('checked', 'checked');                           
              }
              chk_box.appendTo(checkboxes); 
            })
          }          
        })
      }
    else {
      loading.addClass("hide"); 
      checkboxes.text("Please select a client");
      add_btn.hide();
    }
    return false;
  })
      
});