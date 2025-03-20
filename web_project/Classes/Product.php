<?php

require_once "Connect.php";

class Product extends Database {

    /**
     * Adds a new product to the database
     *
     * @param string $product_name The name of the product
     * @param float $price The price of the product
     * @param string $image The path to the image of the product
     * @param string $description A description of the product
     *
     * @throws Exception If there is an error in adding the product
     *
     * @return void
     */
    public function addProduct($product_name, $price, $image, $description, $quantity) {
        $sql = "INSERT INTO products (product_name, price, image, description, quantity) VALUES (?, ?, ?, ?, ?)";
        $stmt = $this->conn->prepare($sql);
        
        if (!$stmt) {
            die("Error in preparing statement: " . $this->conn->error);
        }
    
        $stmt->bind_param("sdssi", $product_name, $price, $image, $description, $quantity); // Now correctly expects 5 parameters
        
        if ($stmt->execute()) {
            header("location: ../Admin-WEB/product-list/");
            exit;
        } else {
            die("Error in Adding: " . $stmt->error);
        }
    }
    

    /**
     * Retrieves a specific product from the database
     *
     * @param int $product_id The id of the product to retrieve
     *
     * @throws Exception If there is an error in retrieving the product
     *
     * @return array The product details in an associative array
     */
    public function displaySpecificProduct($product_id) {
        $sql = "SELECT * FROM products WHERE id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param("i", $product_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result) {
            return $result->fetch_assoc();
        } else {
            die("Error in retrieving product: " . $stmt->error);
        }
    }   

    public function editProduct($product_id, $product_name, $price, $image, $description) {
        $sql = "UPDATE products SET product_name = ?, price = ?, image = ?, description = ? WHERE id = ?";
        $stmt = $this->conn->prepare($sql);
        
        // Corrected the type string to match the number of parameters
        $stmt->bind_param("sdssi", $product_name, $price, $image, $description, $product_id);
    
        if ($stmt->execute()) {
            header("location: ../Admin-WEB/product-list/");
            exit;
        } else {
            die("Error in editing product: " . $stmt->error);
        }
    }
    

    public function displayProducts() {
        $sql = "SELECT * FROM products";
        $result = $this->conn->query($sql);

        if ($result) {
            $items = [];
            while ($item = $result->fetch_assoc()) {
                $items[] = $item;
            }
            return $items;
        } else {
            die("Error in retrieving: " . $this->conn->error);
        }
    }
    public function deleteProduct($product_id) {
        // Delete related rows in order_details first
        $sql_order_details = "DELETE FROM order_details WHERE product_id = ?";
        $stmt_order_details = $this->conn->prepare($sql_order_details);
        $stmt_order_details->bind_param("i", $product_id);
    
        if ($stmt_order_details->execute()) {
            // Now delete the product from the products table
            $sql_product = "DELETE FROM products WHERE id = ?";
            $stmt_product = $this->conn->prepare($sql_product);
            $stmt_product->bind_param("i", $product_id);
    
            if ($stmt_product->execute()) {
                header("location: ../Admin-WEB/product-list/");
                exit;
            } else {
                die("Error in deleting product: " . $stmt_product->error);
            }
        } else {
            die("Error in deleting related order details: " . $stmt_order_details->error);
        }
    }
    

    public function getExistingImage($product_id) {
        $sql = "SELECT image FROM products WHERE id = '$product_id'";
        if ($result = $this->conn->query($sql)) {
            $row = $result->fetch_assoc();
            return $row['image']; // Return the image path
        } else {
            die("Error retrieving existing image: " . $this->conn->error);
        }
    }
    // In Product.php class

    public function updateProductQuantity($product_id, $new_quantity) {
        $sql = "UPDATE products SET quantity = ? WHERE id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->bind_param('ii', $new_quantity, $product_id);

        return $stmt->execute();
    }

}