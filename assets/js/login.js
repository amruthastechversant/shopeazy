// client side validation
$(document).ready(function() {

    $('#registrationForm').on('submit', function(e) {
        let isValid= true;
        var firstname = $('#firstname').val();
        var lastname = $('#lastname').val();
        var email = $('#email').val();
        var address = $('#address').val();
        var phonenumber = $('#phonenumber').val();
        var newPassword = $('#newPassword').val();
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
        if(email==""){
            $('#emailError').text(' Email is required');
            isValid=false;
        }
        if(address==""){
            $('#addressError').text(' Address is required');
            isValid=false;
        }
        if(phonenumber==""){
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
});