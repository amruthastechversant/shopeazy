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
    $.ajax({
        url:'/myprojects/shopeazy/admin/seller/approveSeller.cfm?approve=true',
        type:'POST',
        data:{
            id:selleridvalue
        },
        success:function(response){
            var jsonResponse = JSON.parse(response)
            if((jsonResponse.STATUS===true)){
                $("#approve_" +id).removeClass("btn-success");
                $("#approve_"+id).addClass("btn-danger");
                $("#approve_" +id).html('Deactivate');
                $('#successMessage').text(jsonResponse.MESSAGE).show();
                
            }
            console.log("seller approved",jsonResponse)
        },
        error:function(error){
            console.log("error approving seller",error)
        }
    });
}
