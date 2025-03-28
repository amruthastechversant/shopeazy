// client side validation
$(document).ready(function() {

    $('#registrationForm').on('submit', function(e) {
        let isValid= true;
        var firstname = $('#firstname').val();
        var lastname = $('#lastname').val();
        var CompanyEmail = $('#CompanyEmail').val();
        var CompanyAddress = $('#CompanyAddress').val();
        var gstNo = $('#gstNo').val();
        var newSellerPassword = $('#newSellerPassword').val();
        var confirmpassword = $('#confirmpassword').val();
        $('.error-msg').text('');

        if(firstname==""){
            $('#firstnameError').text('First name is required');
            isValid=false;
            
        }

        if(lastname==""){
            $('#lastnameError').text('Last name is required');
            isValid=false;
        }
        if(CompanyEmail==""){
            $('#emailError').text(' CompanyEmail is required');
            isValid=false;
        }
        if(CompanyAddress==""){
            $('#addressError').text(' CompanyAddress is required');
            isValid=false;
        }
        if(gstNo==""){
            $('#phonenumberError').text('Phone number is required');
            isValid=false;

        }
        if(newPassword==""){
            $('#newPasswordError').text('Password is required');
            isValid=false;
        }
        if(confirmpassword==""){
            $('#confirmpasswordError').text('Confirm password is required');
            isValid=false;
        }
      
        if(newPassword != confirmpassword){
            $('#confirmpasswordError').text('passsword mismatches');
            isValid=false;
        }
        if(!isValid){
        e.preventDefault();
    }
    });

    $('#sellerRegistrationForm').on('submit', function(e) {
        let isValid="true";
        var companyName= $("#companyName").val();
        var CompanyEmail = $('#CompanyEmail').val();
        var CompanyAddress = $('#CompanyAddress').val();
        var Contactno = $('#Contactno').val();
        var gstNo = $('#gstNo').val();
        var lisenceNo = $('#lisenceNo').val();
        var newSellerPassword = $('#newSellerPassword').val();
        var sellerconfirmpassword = $('#sellerconfirmpassword').val();
        $('.error-msg').text('');
        if(companyName ==""){
            $("#companyNameError").text('Enter CompanyName');
            isValid=false;
        }
        if(CompanyEmail ==""){
            $("#emailError").text('Enter CompanyEmail');
            isValid=false;
        }
        if(CompanyAddress ==""){
            $("#CompanyAddressError").text('Enter CompanyAddress');
            isValid=false;
        }
        if(Contactno ==""){
            $("#ContactnoError").text('Enter Contactno');
            isValid=false;
        }
        if(gstNo ==""){
            $("#gstNoError").text('Enter gstNo');
            isValid=false;
        }
        if(lisenceNo ==""){
            $("#lisenceNoError").text('Enter lisenceNo');
            isValid=false;
        }
        if(newSellerPassword ==""){
            $("#sellerPasswordError").text('Enter newSellerPassword');
            isValid=false;

        }
        if(sellerconfirmpassword ==""){
            $("#sellerconfirmpasswordError").text('please confirm password ');
            isValid=false;
        }

        if (!isValid) {
                e.preventDefault();
        }
});
})