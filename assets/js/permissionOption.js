$(document).ready(function () {
    const $chBoxes = $('.dropdown-menu input[type="checkbox"]');
   
    // const $dpBtn = $('#multiSelectDropdown');
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

        // $dpBtn.text(mySelectedListItems.length > 0 
        //     ? mySelectedListItemsText.slice(0, -2) 
        //     : 'Select');
    }

    $chBoxes.on('change', handleCheckbox);
});
