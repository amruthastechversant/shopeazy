   // Wait 5 seconds, then hide the alert
    document.addEventListener("DOMContentLoaded", function() {
            setTimeout(function() {
                var alertBoxes = document.getElementsByClassName('success-alert');
                for (var i = 0; i < alertBoxes.length; i++) {
                    alertBoxes[i].style.display = 'none';
                    alertBoxes.style.transition = "opacity 1s ease-out";
                    alertBoxes.style.opacity = 0;
                }
            }, 3000);
        });

$(document).ready(function () {    
    updateButtons();
    star = $('.star');
    output = $('#output');

    const existingRating = parseInt($("#rating").val());//parseint convert to integer 
    if (existingRating > 0 && existingRating <= 5) {
        rev(existingRating);
    }
 });

function getContainer(type) {
    let containerId='';
    containerId = type + 'Container';
    return containerId;
}

function toggleOptions(btn, type) {
    // const container = type === 'color' ? document.getElementById('colorContainer') : document.getElementById('sizeContainer');
    let containerId= getContainer(type)

    const container=document.getElementById(containerId);
    const parentDiv = btn.parentElement;
    const newDiv = parentDiv.cloneNode(true);

    // Clear the input in the new div
    newDiv.querySelector('input').value = '';

    
    // Change the old button to a "-" remove button
    btn.innerText = '-';
    btn.onclick = function () {
        parentDiv.remove();
    };

    // Update new "+" button
    const newBtn = newDiv.querySelector('button');
    newBtn.innerText = '+';
    newBtn.onclick = function () {
        toggleOptions(this, type);
    };

    container.appendChild(newDiv);
}

function updateButtons(){
    if (typeof productProperties === 'object' && productProperties !== null && Array.isArray(productProperties.DATA)) {
    const prevProps=productProperties.DATA;
    prevProps.forEach((prop)=>{
        let containerId=getContainer(prop[1]);
        const container=document.getElementById(containerId);
        if(container){
        const inputWrappers=container.querySelectorAll('.input-wrapper');
            inputWrappers.forEach((wrapper,index) => {
            const button = wrapper.querySelector('button');
                if(index < inputWrappers.length - 1){
                button.innerText='-';
                button.onclick = function (){
                    if(inputWrappers.length  > 1){
                    wrapper.remove();
                    }
                };
                }
            });
        }
    });
}
}

let selectedRating=0;
let star, output;
    function rev(n){
        selectedRating=n;
        remove();
        let cls = "";
        if(n === 1)
            cls = "one";
        else if(n === 2)
            cls = "two";
        else if(n === 3)
            cls = "three";
        else if(n === 4)
            cls = "four";
        else if(n === 5)
            cls = "five";

        star.each(function(index) {
            if (index < n) {
                $(this).attr("class", "star " + cls);
            }
        });

        output.text("rating is: " + n + "/5");
        $("#rating").val(n);
    }

    function remove(){
        star.attr("class", "star");
    }

