
function changestatus(id){
    
    const checkbox = $('#status_'+id);
    const isChecked = checkbox.is(":checked");
    const status = isChecked ? "active" : "inactive";
    console.log(status);

    $.ajax({
        url: '/myprojects/shopeazy/admin/products/fullProductsAction.cfm?getStatus=true',
        type: 'POST',
        data: {
            id:id ,
            status:status,
        },
        
        dataType: 'html',
        success: function(response) {
             const jsonMatch = response.match(/\|\|(.+?)\|\|/);

            if (jsonMatch && jsonMatch[1]) {

                try {
                    const response = JSON.parse(jsonMatch[1]);
                    if (response.STATUS === "success") {
                        if(status=="inactive")
                            $('#name_'+id).append("<span class='badge bg-warning'>inactive</span>");
                        else
                            $('#name_'+id).find("span").remove();
                    } else {
                        $('#errorMessage').text(response.message).show();
                    }
                } catch (e) {
                    $('#errorMessage').text('Invalid response format').show();
                }
            } else {
                $('#errorMessage').text('Unexpected server response').show();
            }
        },
        error: function(e) {
            $('#errorMessage').text('An error occurred. Please try again.').show();
        }
    });

}
