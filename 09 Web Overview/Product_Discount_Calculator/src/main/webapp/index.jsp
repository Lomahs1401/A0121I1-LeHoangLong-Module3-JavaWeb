<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <link rel="stylesheet" type="text/css" href="bootstrap-4.6.0-dist/css/bootstrap-grid.min.css"/>
</head>
<body>
    <div class="container">
        <h1>Welcome to Product Discount Calculator</h1>
        <form action="${pageContext.request.contextPath}/display-discount" method="post">
            <div class="form-group">
                <label for="description" style="min-width: 100px">Product Description:</label>
                <input type="text" class="form-control" name="description" id="description" placeholder="Description"/>
            </div>
            <div class="form-group">
                <label for="price" style="min-width: 100px">List Price:</label>
                <input type="text" class="form-control" name="price" id="price" placeholder="Price"/>
            </div>
            <div class="form-group">
                <label for="discount" style="min-width: 100px">Discount Percent:</label>
                <input type="text" class="form-control" name="discount" id="discount" placeholder="Discount"/>
            </div>
            <input type="submit" class="btn btn-primary" value="Calculate Discount">
        </form>
    </div>
</body>
</html>