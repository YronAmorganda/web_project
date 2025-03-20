<?php
include_once '../../../Classes/Connect.php';
include_once '../../../Actions/daily_sale_per_cashier.php';
include "../includes/header.php"; 

// Fetch cashier name and selected date
// Assuming $cashier_name and $selected_date are defined elsewhere in your code
?>

<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center">
            <h2>Sales Record Of: <?php echo htmlspecialchars($cashier_name); ?></h2>
            <a href="../Total_cashier/" style="margin-left: 2px; text-decoration: none; color: black; background-color: red; padding: 0px 10px; font-size: 1.5em; font-weight: bold; border-radius: 5px; display: inline-block; cursor: pointer;">&times;</a>
        </div>
        
        <!-- Buttons for different date ranges -->
        <form method="POST" action="">
            <input type="date" name="selected_date" value="<?php echo htmlspecialchars($selected_date); ?>" required onchange="this.form.submit();">
            <button name="range" value="last_day" class="btn btn-success">Last Day Record</button>
            <button name="range" value="this_week" class="btn btn-success">This Week Record</button>
            <button name="range" value="last_week" class="btn btn-success">Last Week Record</button>
            <button name="range" value="this_month" class="btn btn-success">This Month Record</button>
            <button name="range" value="last_month" class="btn btn-success">Last Month Record</button>
        </form>

        <!-- Displaying total sales -->
        <?php
        $total_sales = 0; // Initialize total sales
        if ($result->num_rows > 0) {
            // Calculate total sales
            while ($row = $result->fetch_assoc()) {
                $total_sales += $row['total']; // Sum up the total amounts
            }
        }
        ?>

        <h3 class="mt-3">Total Earned: ₱<?php echo number_format($total_sales, 2); ?></h3>

        <!-- Displaying orders -->
        <table class="table mt-3">
            <thead>
                <tr>
                    <th>Order #</th>
                    <th>Total</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Reset result pointer to fetch rows again for displaying
                $result->data_seek(0); // Move pointer back to the beginning of the result set

                // Check if there are records
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . htmlspecialchars($row['id']) . "</td>";
                        echo "<td>₱" . htmlspecialchars($row['total']) . "</td>";
                        echo "<td>" . htmlspecialchars($row['date']) . "</td>"; // Ensure this is the correct date column
                        echo "<td>" . htmlspecialchars($row['status'] === 'completed' ? 'Paid' : $row['status']) . "</td>";
                        echo "<td>";
                        if ($row['status'] === 'completed') {
                            echo '<button class="btn btn-info" data-toggle="modal" data-target="#orderDetailModal" data-id="' . htmlspecialchars($row['id']) . '">Detail</button>';
                        }
                        echo "</td>";
                        echo "</tr>";
                    }
                } else {
                    // Always show a message row to maintain structure
                    echo "<tr>";
                    echo "<td colspan='5'>No completed cashiered found for this date</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
    </div>

    <!-- Order Detail Modal -->
    <div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderDetailModalLabel">Order Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="orderDetailContent"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script>
    $(document).ready(function() {
        $('#orderDetailModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var orderId = button.data('id'); // Extract info from data-* attributes

            // Send AJAX request to fetch order details
            $.ajax({
                type: "POST",
                url: "order_detail_modal.php", // The PHP file that handles the request
                data: { order_id: orderId },
                success: function(response) {
                    // Load the response into the modal body
                    $('#orderDetailContent').html(response);
                }
            });
        });
    });
    </script>

<?php
// Close the connection
$conn->close();
?>