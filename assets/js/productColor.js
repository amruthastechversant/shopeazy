function toggleOptions(btn, type) {
    // const container = type === 'color' ? document.getElementById('colorContainer') : document.getElementById('sizeContainer');
    let containerId='';
    if(type==='color') {
        containerId='colorContainer';
    }else if(type==='size') {
        containerId='sizeContainer';
    }else if(type==='materials') {
        containerId='materialsContainer';
    }
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
