<?php
require_once '../Classes/Order.php';
require_once '../Classes/Product.php';
require_once '../Classes/Connect.php';  // Ensure the database connection is included
session_start();

header('Content-Type: application/json');  // Ensure the response is JSON

try {
    // Create an instance of the Database class
    $db = new Database();
    $conn = $db->conn;  // Now $conn is available to use

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if (isset($_SESSION['order_id']) && isset($_POST['total']) && isset($_POST['payment'])) {
            $order_id = $_SESSION['order_id'];
            $total = floatval($_POST['total']);
            $payment = floatval($_POST['payment']);

            if ($payment < $total) {
                throw new Exception("Payment amount is less than the total order amount.");
            }

            // Calculate the change
            $change = $payment - $total;

            // Create instances of Order and Product classes
            $order = new Order();
            $product = new Product();

            // Loop through each product in the order and deduct its quantity from the form data
            if (isset($_POST['qty']) && is_array($_POST['qty'])) {
                foreach ($_POST['qty'] as $product_id => $new_quantity) {
                    // Make sure the quantity is an integer and valid
                    $new_quantity = intval($new_quantity);
                    if ($new_quantity < 1) {
                        throw new Exception("Invalid quantity for product ID $product_id.");
                    }

                    // Get current product details from the database
                    $product_details = $product->displaySpecificProduct($product_id);
                    if (!$product_details) {
                        throw new Exception("Product with ID $product_id not found.");
                    }

                    $current_stock = $product_details['quantity'];
                    $new_stock = $current_stock - $new_quantity;

                    if ($new_stock < 0) {
                        throw new Exception("Insufficient stock for product ID $product_id.");
                    }

                    // Update the product stock in the database
                    if (!$product->updateProductQuantity($product_id, $new_stock)) {
                        throw new Exception("Failed to update product stock for product ID $product_id.");
                    }
                }
            } else {
                throw new Exception("No product quantities were submitted.");
            }

            // Update the order with the payment and change values
            $sql = "UPDATE orders SET payment = ?, `change` = ? WHERE id = ?";
            $stmt = $conn->prepare($sql);
            if ($stmt === false) {
                throw new Exception("Failed to prepare the SQL statement: " . $conn->error);
            }

            // Bind parameters to the prepared statement
            $stmt->bind_param('ddi', $payment, $change, $order_id);

            // Execute the statement
            if ($stmt->execute()) {
                // If all updates are successful, update the order status
                if ($order->updateOrderStatus($order_id, 'completed')) {
                    // Clear the session order_id after success
                    unset($_SESSION['order_id']);

                    // Redirect to success page
                    header("location: ../pos/receipt/?order_id=$order_id&success=1");
                    exit;
                } else {
                    throw new Exception("Failed to update order status.");
                }
            } else {
                throw new Exception("Failed to execute statement: " . $stmt->error);
            }
        } else {
            throw new Exception("Invalid request. Missing order or payment data.");
        }
    } else {
        throw new Exception("Invalid request method.");
    }
} catch (Exception $e) {
    // Redirect to error page with the error message
    header("location: ../pos/?error=" . urlencode($e->getMessage()));
    exit();
}