<?php
// order_detail_modal.php
include_once '../../../Classes/Connect.php';

if (isset($_POST['order_id'])) {
    $order_id = intval($_POST['order_id']);
    
    // Create an instance of the Database class to connect to the database
    $database = new Database();
    $conn = $database->conn; // Use the connection property

    // Prepare SQL to get order details
    $query = "SELECT od.quantity, p.product_name, p.price 
              FROM order_details od 
              JOIN products p ON od.product_id = p.id 
              WHERE od.order_id = ?";
    
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $order_id);
    $stmt->execute();
    $result = $stmt->get_result();

    // Prepare the table HTML
    $output = '<table class="table">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>';
    
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $total_amount = $row['quantity'] * $row['price'];
            $output .= '<tr>
                            <td>' . htmlspecialchars($row['product_name']) . '</td>
                            <td>' . htmlspecialchars($row['quantity']) . '</td>
                            <td>₱' . number_format($total_amount, 2) . '</td>
                        </tr>';
        }
    } else {
        $output .= '<tr>
                        <td colspan="3">No products found for this order.</td>
                    </tr>';
    }
    
    $output .= '</tbody></table>';

    // Close the statement and connection
    $stmt->close();
    $conn->close(); // Closing the connection here
    
    // Return the generated HTML
    echo $output;
}
?>