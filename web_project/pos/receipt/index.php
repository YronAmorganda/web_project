<?php
// Include necessary files
include_once '../../Classes/Connect.php';
include_once '../../Classes/receipt-detail.php';

// Initialize the database connection
$database = new Database();
$conn = $database->conn;

// Get the order ID from the URL, defaulting to 1 if not set
$orderID = isset($_GET['order_id']) ? (int)$_GET['order_id'] : 1;

// Fetch order details
$order = getOrderDetails($conn, $orderID);

if ($order === null) {
    die("Order not found.");
}

// Fetch the order items
$itemsResult = getOrderItems($conn, $orderID);

// Initialize subtotal
$subtotal = 0;

// Loop through the order items and calculate subtotal
while ($item = $itemsResult->fetch_assoc()) {
    $itemTotal = $item['price'] * $item['quantity'];
    $subtotal += $itemTotal;
}

// Get payment and calculate change
$payment = isset($order['payment']) ? (float)$order['payment'] : 0;
$change = $payment - $subtotal;

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receipt</title>
    <!-- Bootstrap 5.1.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/receipt.css" rel="stylesheet">

    <style>
        /* Additional styles can go here */
    </style>
</head>
<body>

<div class="main pt-5 mb-5">
    <div class="container align-items-center justify-content-center d-flex"> 
        <div class="row">
            <div class="col border border-dark">
                <!-- Logo -->
                <div class="text-center mb-3">
                    <img src="../../image/LOGO.PNG" alt="Logo" class="img-fluid" style="max-height: 80px;">
                </div>

                <!-- Bill details -->
                <table class="table table-borderless table-sm">
                    <tbody>
                        <tr>
                            <td>Cashier: <span><?php echo htmlspecialchars($order['first_name']); ?></span></td>
                            <td class="text-end">Order #: <span><?php echo htmlspecialchars($order['order_id']); ?></span></td>
                        </tr>
                        <tr>
                            <td>Date: <span><?php echo date("Y-m-d", strtotime($order['date'])); ?></span></td>
                            <td class="text-end">Time: <span><?php echo date("H:i:s", strtotime($order['date'])); ?></span></td>
                        </tr>
                    </tbody>
                </table>

                <!-- Items list -->
                <table class="table table-borderless table-sm items">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th class="text-center">Qty</th>
                            <th class="text-end">Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        // Reset itemsResult for re-use
                        $itemsResult->data_seek(0); // Reset the pointer to the beginning
                        while ($item = $itemsResult->fetch_assoc()) { 
                            $itemTotal = $item['price'] * $item['quantity'];
                        ?>
                        <tr>
                            <td><?php echo htmlspecialchars($item['product_name']); ?></td>
                            <td class="text-center"><?php echo (int)$item['quantity']; ?></td>
                            <td class="text-end"><?php echo number_format($itemTotal, 2); ?></td>
                        </tr>
                        <?php } ?>
                        <tr class="total-row">
                            <td colspan="2" class="text-end">Subtotal</td>
                            <td class="text-end"><?php echo number_format($subtotal, 2); ?></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-end">Paid</td>
                            <td class="text-end"><?php echo number_format($payment, 2); ?></td>
                        </tr>
                        <tr class="total-row">
                            <td colspan="2" class="text-end">Change</td>
                            <td class="text-end"><?php echo number_format($change, 2); ?></td>
                        </tr>
                    </tbody>
                </table>

                <!-- Payment method and thank you note -->
                <div class="text-center mt-4">
                    <p>Thank you for your visit!</p>
                </div>

                <!-- Footer -->
                <div class="text-center footer-text">
                    <p>Div Bakeshop</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="clearfix"></div>
<div class="container align-items-center justify-content-center d-flex">
    <div class="row">
        <div class="col-6">
            <button class="btn btn-primary" onclick="window.print()">Print</button>
        </div> 
        <div class="col-6">
            <a href="../index.php" class="btn btn-secondary">Back to Menu</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
