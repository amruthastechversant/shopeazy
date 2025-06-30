$(document).ready(function () {
    setTimeout(function () {
        $('.text-success').fadeOut(1000);
    }, 3000);
    const $chBoxes = $('.dropdown-menu input[type="checkbox"]');
    let mySelectedListItems = [];
    function handleCheckbox() {
        mySelectedListItems = [];

        let mySelectedListItemsText = '';

        $chBoxes.each(function () {
            if ($(this).is(':checked')) {
                mySelectedListItems.push($(this).val());
                mySelectedListItemsText += $(this).val() + ', ';
            }
        });
    }

    $chBoxes.on('change', handleCheckbox);
});

function approveStatus(id){
    var selleridvalue = $('#seller_' +id).val();
    var button = $('#toggle_' +id);
    var isApproved = button.hasClass("btn-success");
    var action = isApproved ? 'approve': 'deactivate';
    var url = '/myprojects/shopeazy/admin/seller/approveSeller.cfm?'+action+ "=true";
    $.ajax({
        url:url,
        type:'POST',
        data:{
            id:selleridvalue
        },
        success:function(response){
            var jsonResponse = JSON.parse(response)
            if((jsonResponse.STATUS===true)){
                if(action === 'approve'){
                    button.removeClass("btn-success").addClass('btn-danger').html('deactivate');
                }
                else{
                    button.removeClass('btn-danger').addClass("btn-success").html('approve');
                }
                $('#successMessage').text(jsonResponse.MESSAGE).show();
            }
            console.log("seller approved",jsonResponse)
        },
        error:function(error){
            console.log("error approving seller",error)
        }
    });
}

function rejectStatus(id){
    var selleridvalue=$("#seller_" +id).val();
    var url='/myprojects/shopeazy/admin/seller/approveSeller.cfm?reject=true'
    $.ajax({
        url:url,
        type:'POST',
        data:{
            id:selleridvalue
        },
        success:function(response){
            var jsonResponse = JSON.parse(response)
            if((jsonResponse.STATUS===true)){
                $('#successMessage').text(jsonResponse.MESSAGE).show();
                $("#toggle_" +id).prop('disabled',true);
                $("#reject_" +id).prop('disabled',true)
            }
            console.log("seller rejected",jsonResponse)
        },
        error:function(error){
            console.log("error approving seller",error)
        }
    });
}
