
<cfif structKeyExists(URL, "showLogin") AND URL.showLogin EQ "1">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("userloginModal").style.display = "block";
        });
    </script>
</cfif>
<cfinclude  template="indexAction.cfm">
<!DOCTYPE html>
<html lang="en">
<cfoutput>
<cfinclude  template="layouts/header.cfm">
<body>
   <cfinclude  template="layouts/navbar.cfm">
<div class="main-content position-relative" style="z-index: 1;">

    <!---<div id="backgroundCarousel" class="carousel slide carousel-fade position-fixed w-100 " data-ride="carousel" style="z-index: -1; top: 0; left: 0;">
      <div class="carousel-inner h-100">
        <div class="carousel-item active h-100">
          <img src="#application.appBasePath#assets/img/carousel.jpg" class="d-block w-100  object-fit-content" alt="Slide 1">
        </div>
        <div class="carousel-item h-100">
          <img src="#application.appBasePath#assets/img/carousel2_.jpg" class="d-block w-100  object-fit-content" alt="Slide 2">
        </div>
      </div>
    </div>--->
<div id="carouselExampleControls" class="carousel slide carousel-fade w-100" data-bs-ride="carousel" >
    <div class="carousel-inner ">
      <div class="carousel-item active">
        <img src="#application.appBasePath#assets/img/carousel.jpg" class="d-block w-100 h-100 object-fit-content" alt="...">
      </div>
      <div class="carousel-item">
        <img src="#application.appBasePath#assets/img/carousel2_.jpg" class="d-block w-100 h-100 object-fit-content" alt="...">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="##carouselExampleControls" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="##carouselExampleControls" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
    


  <!-- Your existing content here -->

  <div class="sub-content">
    <cfif structKeyExists(session, "email") and session.email NEQ "">
        <p>welcome #session.email#</p>
    </cfif>
      <div class="category d-flex p-5 bd-highlight justify-content-center">
        <cfloop query= "variables.getParentCategories">
            <cfset hasSubCategories=false>
            <cfloop query="variables.getSubCategories">
                  <cfif variables.getSubCategories.int_parent_category_id EQ variables.getParentCategories.int_category_id>
                  <cfset hasSubCategories=true>
                  </cfif>
            </cfloop>
            <cfif hasSubCategories>
          <li class="dropdown category list-unstyled #variables.getParentCategories.str_category_name# ">
              <cfif variables.getParentCategories.str_category_image NEQ "">
              <div class=" dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
                  <img src=#application.appBasePath##variables.getParentCategories.str_category_image# alt="Tutorials" class="category-image enlarge-on-hover">
              </div>
              <h6>#variables.getParentCategories.str_category_name#</h6>
              </cfif>
              <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                  <cfloop query="variables.getSubCategories">
                      <cfif variables.getSubCategories.int_parent_category_id EQ variables.getParentCategories.int_category_id>
                          <li role="presentation"><a role="menuitem" href="products/list.cfm?category_id=#variables.getSubCategories.int_category_id#">#variables.getSubCategories.str_category_name#</a></li>
                      </cfif>
                  </cfloop>
              </ul>
          </li>
          </cfif>
          </cfloop>
      </div>
  </div>
</div>
  <cfinclude  template="layouts/footer.cfm">  
</body>
</html>
</cfoutput>



