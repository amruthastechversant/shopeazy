
<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="layouts/header.cfm">
<body>
<!--- header div--->
   <cfinclude  template="layouts/navbar.cfm">
<!---category div --->
    <div class="category d-flex p-5 bd-highlight justify-content-center">
        <div class="dropdown category electronics">
             <div class=" dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                <img src="assets/img/electronics.jpg" alt="Tutorials" class="category-image enlarge-on-hover">
            </div>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                <li role="presentation"><a role="menuitem" href="">Laptop</a></li>
                <li role="presentation"><a role="menuitem" href="products/list.cfm">Mobile</a></li>
                <li role="presentation"><a role="menuitem" href="">smart wearables</a></li>
                <li role="presentation"><a role="menuitem" href="">Camera</a></li>
            </ul>
        </div>
        <div class="dropdown category appliances ms-5">
            <div class=" dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
              <img src="assets/img/appliances.jpg" class="category-image enlarge-on-hover">
            </div>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                <li role="presentation"><a role="menuitem" href="">Television</a></li>
                <li role="presentation"><a role="menuitem" href="">Refrigerator</a></li>
                <li role="presentation"><a role="menuitem" href="">Washing Machine</a></li>
                <li role="presentation"><a role="menuitem" href="">Ac</a></li>
            </ul>
        </div>
        <div class="dropdown category furniture ms-5">
            <div class=" dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
              <img src="assets/img/furniture.jpg" class=" category-image enlarge-on-hover">
            </div>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                <li role="presentation"><a role="menuitem" href="">Living Room</a></li>
                <li role="presentation"><a role="menuitem" href="">Kitchen & dining</a></li>
               
            </ul>
        </div>
        <div class="dropdown category decor ms-5">
            <div class=" dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
              <img src="assets/img/decor.jpg" class=" category-image enlarge-on-hover">
            </div>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                <li role="presentation"><a role="menuitem" href="">Storage & organization</a></li>
                <li role="presentation"><a role="menuitem" href="">Decorative Accessories</a></li>
                <li role="presentation"><a role="menuitem" href="">Wall Art</a></li>
                <li role="presentation"><a role="menuitem" href="">Lighting</a></li>
            </ul>
        </div>
        <div class="dropdown category books ms-5">
            <div class=" dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
              <img src="assets/img/books.jpg" class=" category-image enlarge-on-hover">
            </div>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                <li role="presentation"><a role="menuitem" href="">Novels</a></li>
                <li role="presentation"><a role="menuitem" href="">Notebooks</a></li>
                <li role="presentation"><a role="menuitem" href="">Spiritual Books</a></li>
                <li role="presentation"><a role="menuitem" href="">Dictionary</a></li>
                <li role="presentation"><a role="menuitem" href="">Travel Books</a></li>
            </ul>
        </div>
        <div class="dropdown category outfits ms-5">
            <div class=" dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
              <img src="assets/img/outfits.jpg" class=" category-image enlarge-on-hover">
            </div>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                <li role="presentation"><a role="menuitem" href="">Men's Wear</a></li>
                <li role="presentation"><a role="menuitem" href="">Ladies Wear</a></li>
                <li role="presentation"><a role="menuitem" href="">Sports Wear</a></li>
                <li role="presentation"><a role="menuitem" href="">Kid's Fashion</a></li>
            </ul>
        </div>
        <div class="dropdown category beauty product ms-5">
            <div class=" dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
              <img src="assets/img/beauty.jpg" class=" category-image enlarge-on-hover">
            </div>
            <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                <li role="presentation"><a role="menuitem" href="">SkinCare</a></li>
                <li role="presentation"><a role="menuitem" href="">bodyCare</a></li>
                <li role="presentation"><a role="menuitem" href="">vitamins&supplements</a></li>
            </ul>
        </div>
    </div>


    <div class="content">
        
    </div>

  <cfinclude  template="layouts/footer.cfm">  
</body>
</html>
</cfoutput>
