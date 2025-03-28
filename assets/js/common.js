


var modalElement = document.getElementById('userloginModal');
var adminmodalElement=document.getElementById('adminloginModal');
var sellermodalElement=document.getElementById('sellerloginModal');
// Get the user link and modal close button
var userloginBtn = document.getElementById("userloginBtn");
var adminloginBtn=document.getElementById('adminloginbtn');
var sellerloginBtn=document.getElementById('sellerloginbtn')
var userCloseBtn = document.getElementById('userCloseBtn');
var adminCloseBtn = document.getElementById('adminCloseBtn');

// Open modal when user clicks on the "User" link
userloginBtn.onclick = function() {
    modalElement.style.display = "block";
}
adminloginBtn.onclick=function(){
    adminmodalElement.style.display="block";
}

sellerloginBtn.onclick=function(){
    sellermodalElement.style.display="block";
}
// Close modal when user clicks the "x" button
userCloseBtn.onclick = function() {
    modalElement.style.display = "none";
}

adminCloseBtn.onclick = function() {
    adminmodalElement.style.display = "none";
}

sellerCloseBtn.onclick = function(){
    sellermodalElement.style.display = "none";
}

// Close modal if the user clicks outside the modal content
window.onclick = function(event) {
    if (event.target === modalElement) {
        modalElement.style.display = "none";
    }

    if(event.target === adminmodalElement){
        adminmodalElement.style.display="none";
    }
    if(event.target === adminmodalElement){
        sellermodalElement.style.display="none";
    }
}
