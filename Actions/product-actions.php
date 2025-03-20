<?php

include_once "../Classes/Product.php"; 

$product = new Product();
$log_file = '../logs/error_log.txt';
print_r($_REQUEST);

function handleProductRequest($action, $product, $log_file) {
    try {
        if (empty($_POST['product_name']) || empty($_POST['price']) || empty($_POST['description'])) {
            throw new Exception("All fields are required.");
        }

        $product_name = $_POST['product_name'];
        $price = $_POST['price'];
        $description = $_POST['description'];
        $quantity = isset($_POST['quantity']) ? $_POST['quantity'] : 0; // Default to 0 if not provided

        if (!is_numeric($price) || $price < 0) {
            throw new Exception("Invalid price. It must be a positive number.");
        }

        if ($action == 'add_product') {
            if (isset($_FILES['image']) && $_FILES['image']['error'] == UPLOAD_ERR_OK) {
                $image = $_FILES['image'];

                $allowed_extensions = ['jpg', 'jpeg', 'png', 'gif'];
                $file_extension = strtolower(pathinfo($image['name'], PATHINFO_EXTENSION));
                if (!in_array($file_extension, $allowed_extensions)) {
                    throw new Exception("Invalid image format. Allowed formats: jpg, jpeg, png, gif.");
                }

                $target_dir = "../Image/";
                $target_file = $target_dir . basename($image["name"]);

                if (move_uploaded_file($image["tmp_name"], $target_file)) {
                    $product->addProduct($product_name, $price, $target_file, $description, $quantity);
                    header("Location: success.php?message=Product added successfully");
                    exit();
                } else {
                    throw new Exception("Error uploading the image.");
                }
            } else {
                throw new Exception("No image uploaded or an error occurred during upload.");
            }
        } elseif ($action == 'edit_product') {
            if (empty($_POST['product_id'])) {
                throw new Exception("Product ID is required.");
            }
            $product_id = $_POST['product_id'];
            $existing_image = $product->getExistingImage($product_id);

            if (isset($_FILES['image']) && $_FILES['image']['error'] == UPLOAD_ERR_OK) {
                $image = $_FILES['image'];
                $target_dir = "../Image/";
                $target_file = $target_dir . basename($image["name"]);

                if (move_uploaded_file($image["tmp_name"], $target_file)) {
                    $product->editProduct($product_id, $product_name, $price, $target_file, $description, $quantity);
                } else {
                    throw new Exception("Error uploading the image.");
                }
            } else {
                $product->editProduct($product_id, $product_name, $price, $existing_image, $description, $quantity);
            }

            header("Location: success.php?message=Product updated successfully");
            exit();
        }
    } catch (Exception $e) {
        error_log($e->getMessage() . "\n", 3, $log_file);
        header("Location: error.php?message=" . urlencode($e->getMessage()));
        exit();
    }
}

if (isset($_POST['action'])) {
    $action = $_POST['action'];
    handleProductRequest($action, $product, $log_file);
}

?>
