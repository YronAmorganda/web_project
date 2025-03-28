document.addEventListener('DOMContentLoaded', function() {

    // Function to update the total order amount
    function updateTotalAmount() {
        let total = 0;
        let hasError = false; // To track if any quantity exceeds hidden quantity
    
        // Loop through all quantity inputs and calculate the total based on quantity and hidden price
        document.querySelectorAll('.qty-input').forEach(function(inputField) {
            let productId = inputField.getAttribute('data-product-id');
            let quantity = parseInt(inputField.value);
            let price = parseFloat(document.getElementById(`hidden_price_${productId}`).value);
            let hiddenQty = parseInt(document.getElementById(`hidden_qty_${productId}`).value);
            
            // Check if quantity exceeds hidden quantity
            if (quantity > hiddenQty) {
                hasError = true; // Set error flag
                inputField.value = hiddenQty; // Set quantity to maximum available
                quantity = hiddenQty; // Update quantity for calculation
            }
            
            total += quantity * price; // Add to total

            updateQuantity(productId, quantity);
        });
    
        // Display alert if any quantity is invalid
        if (hasError) {
            alert('Some quantities cannot exceed their available stock.');
        }
    
        // Update the total order amount display
        document.getElementById('total-order-amount').textContent = `Total Order Amount: ₱${total.toFixed(2)}`;
        document.getElementById('total-order-amount-modal').value = total.toFixed(2);
    }
    
    // Handle quantity increment
    document.querySelectorAll('.inc').forEach(function(incButton) {
        
        incButton.addEventListener('click', function() {
            console.log('trigger call here');
            let productId = this.getAttribute('data-product-id');
            let qtyInput = document.querySelector(`input[data-product-id="${productId}"]`);
            let currentQty = parseInt(qtyInput.value);
            let hiddenQty = parseInt(document.getElementById(`hidden_qty_${productId}`).value);
    
            // Check if the current quantity plus one exceeds the hidden quantity
            if (currentQty < hiddenQty) {
                qtyInput.value = currentQty + 1;
            
                updateQuantity(productId, qtyInput.value);
                updateTotalAmount();
            } else {
                alert(`Cannot increase quantity beyond available stock of ${hiddenQty}.`);
            }
        });
    });
    


    // Handle quantity decrement
    document.querySelectorAll('.dec').forEach(function(decButton) {
        decButton.addEventListener('click', function() {
            let productId = this.getAttribute('data-product-id');
            let qtyInput = document.querySelector(`input[data-product-id="${productId}"]`);
            let currentQty = parseInt(qtyInput.value);

            if (currentQty > 1) {
                qtyInput.value = currentQty - 1;
                updateQuantity(productId, qtyInput.value);
                updateTotalAmount();
            } 
        });
    });

    // Handle quantity input change (keyboard input)
    document.querySelectorAll('.qty-input').forEach(function(inputField) {
        let debounceTimer;
        inputField.addEventListener('input', function() {
            let productId = this.getAttribute('data-product-id');
            let quantity = parseInt(this.value);
          
            clearTimeout(debounceTimer); // Clear any previous debounce timers

            debounceTimer = setTimeout(() => {
                if (quantity >= 1) {
                    updateQuantity(productId, quantity);
                    updateTotalAmount();
                } else {
                    // Reset to 1 if invalid
                    this.value = 1;
                    updateQuantity(productId, 1);
                    updateTotalAmount();
                }
            }, 500); // Delay AJAX call to avoid multiple rapid calls
        });
    });



    function updateQuantity(productId, quantity) {

        console.log(`Updating quantity for product ${productId} to ${quantity}`); // Debugging

        fetch('../Actions/update-cart-quantity.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `product_id=${productId}&quantity=${quantity}`
        })
        .then(response => response.json())
        .then(data => {
            console.log('AJAX response:', data); // Log the response to inspect it
            if (data.success) {
                // Ensure new_total is a number
                const newTotal = Number(data.new_total);
                if (!isNaN(newTotal)) {
                    // Update total order amount
                    document.getElementById('total-order-amount').textContent = `Total Order Amount: ₱${newTotal.toFixed(2)}`;
                    console.log('Total order amount updated successfully.');
                } else {
                    console.error('new_total is not a valid number:', data.new_total);
                }
            } else {
                console.error('Error updating quantity:', data.message);
            }
        })
        .catch(error => console.error('AJAX error:', error));
    }


    // Function to remove product via AJAX
    function removeProduct(productId) {
        console.log(`Removing product ${productId}`); // Debugging

        fetch('../Actions/remove-cart-product.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `product_id=${productId}`
        })
        .then(response => response.json())
        .then(data => {
            console.log('AJAX response:', data); // Debugging the response
            if (data.success) {
                // Remove product from the DOM
                const productElement = document.getElementById(`product-${productId}`);
                if (productElement) {
                    productElement.remove();
                    console.log('Product removed successfully.');
                } else {
                    console.error(`Product element with ID "product-${productId}" not found.`);
                }
                // Update total order amount
                const totalOrderAmountElem = document.getElementById('total-order-amount');
                if (totalOrderAmountElem) {
                    totalOrderAmountElem.textContent = `Total Order Amount: ₱${data.new_total.toFixed(2)}`;
                    console.log('Total order amount updated successfully.');
                } else {
                    console.error('Element with ID "total-order-amount" not found.');
                }
            } else {
                console.error('Error removing product:', data.message);
            }
        })
        .catch(error => console.error('AJAX error:', error));
    }
    });
    document.addEventListener('DOMContentLoaded', function() {
        // Handle "Clear all" click
        document.querySelector('.text-danger').addEventListener('click', function() {
            if (confirm('Are you sure you want to clear all items?')) {
                clearAllOrderDetails();
            }
        });

        // Function to clear all items from the order via AJAX
        function clearAllOrderDetails() {
            fetch('../Actions/clear-order-details.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `order_id=${sessionStorage.getItem('order_id')}` // Pass the order_id stored in session
            })
            .then(response => response.json())
            .then(data => {
                console.log('AJAX response:', data); // Debugging the response
                if (data.success) {
                    // Clear all product elements from the DOM
                    document.querySelectorAll('.product-list').forEach(function(productElement) {
                        productElement.remove();
                    });
                    // Update total order amount to 0
                    document.getElementById('total-order-amount').textContent = `Total Order Amount: ₱0.00`;
                     updateProductCount(); 
                    console.log('All items cleared successfully.');
                } else {
                    console.error('Error clearing items:', data.message);
                }
            })
            .catch(error => console.error('Error:', error));
        }
         // Function to update the product count
        function updateProductCount() {
            fetch('../Actions/get-product-count.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: `order_id=${sessionStorage.getItem('order_id')}`
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Update the product count in the DOM
                    document.querySelector('.count').textContent = data.product_count;
                } else {
                    console.error('Error fetching product count:', data.message);
                }
            })
            .catch(error => console.error('Error fetching product count:', error));
        }

        // Initial product count load on page load
        updateProductCount();
});

