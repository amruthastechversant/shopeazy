<cfinclude  template="listAction.cfm">
<!DOCTYPE html>
<html lang="en">
<cfinclude  template="#application.appBasePath#layouts/header.cfm">
<body>
   <cfinclude  template="#application.appBasePath#layouts/navbar.cfm">
    <div class="container text-center mt-5 mb-5">
      <div class="row">
        <cfoutput query="variables.qryProducts">
        <div class="card mx-2" style="width: 18rem; cursor:pointer;">
          <img src="#application.appBasePath##variables.qryProducts.image_path# " class="card-img-top" alt="..." style="height:150px" onclick="window.location.href='#application.appBasePath#products/detail.cfm?id=#variables.qryProducts.int_product_id#'">
            <div class="card-body">
              <h5 class="card-title">#variables.qryProducts.str_name#</h5>
              <span aria-hidden="true">
                <span class="a-price-symbol">&##8377</span>
                <span class="a-price-whole">#NumberFormat(variables.qryProducts.int_price, "999,999")#</span>
              </span>
              <form action="listAction.cfm" method="POST">
                 <input type="hidden" name="product_id" value="#variables.qryProducts.int_product_id#">
                 <button type="submit" class="btn btn-primary" name="addToCart">Add to cart</button>
              </form>
               <button class="btn btn-primary w-100" onclick="getTotalPrice()">Buy Now</a>
            </div>
        </div>
        </cfoutput>
      </div>
    </div>

    <cfoutput>
    <div class="m-5">
      <nav aria-label="page-navigation">
        <ul class="pagination justify-content-end">
          <cfif url.page GT 1>
            <li class="page-item">
              <a class="page-link" href="list.cfm?#url.page-1#" aria-label="previous">previous</a>
            </li>
          </cfif>

          <cfloop index="i" from="1" to="#totalPages#">
            <li class="page-item <cfif i EQ url.page>active</cfif>">
              <a class="page-link" href="?page=#i#">#i#</a>
            </li>
          </cfloop>

          <cfif url.page LT totalPages>
            <li class="page-item">
              <a class="page-link" href="list.cfm?#url.page +1#" aria-label="Next">Next</a>
            </li>
          </cfif>
        </ul>
      </nav>
    </div>
    </cfoutput>
<cfinclude  template="#application.appBasePath#layouts/footer.cfm">
</body>
</html>