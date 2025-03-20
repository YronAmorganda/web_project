document.addEventListener('DOMContentLoaded', function() {
    const totalOrderAmountModal = document.getElementById('total-order-amount-modal');
    const paymentAmountInput = document.getElementById('payment-amount');
    const changeAmountInput = document.getElementById('change-amount');
    const proceedPaymentBtn = document.getElementById('proceed-payment-btn');
    const spinner = document.getElementById('payment-loading-spinner');

    // Log and check what the initial totalOrderAmountModal value is
    console.log('Total order amount modal value before parsing:', totalOrderAmountModal.value);
    let totalOrderAmount = parseFloat(totalOrderAmountModal.value.replace(/[^\d.-]/g, '')) || 0; // Default to 0 if NaN
    console.log('Parsed totalOrderAmount:', totalOrderAmount);
    
    // Handle payment amount input change
    paymentAmountInput.addEventListener('input', function() {
        let paymentAmount = parseFloat(paymentAmountInput.value.replace(/[^\d.-]/g, '')) || 0; // Default to 0 if NaN
        console.log('Current payment amount:', paymentAmount);

        if (paymentAmount >= totalOrderAmount) {
            const change = paymentAmount - totalOrderAmount;
            changeAmountInput.value = `₱${change.toFixed(2)}`;
        } else {
            changeAmountInput.value = '₱0.00';
        }
    });

    // Handle Proceed Payment button click
    proceedPaymentBtn.addEventListener('click', function() {
        const paymentAmount = parseFloat(paymentAmountInput.value.replace(/[^\d.-]/g, '')) || 0; // Default to 0 if NaN
        
        console.log('Proceed Payment button clicked. Current payment amount:', paymentAmount);
        console.log('Total order amount for validation:', totalOrderAmount);

        if (paymentAmount >= totalOrderAmount) {
            spinner.classList.remove('d-none'); // Show spinner
            document.getElementById('payment-form').submit(); // Submit the form to process payment
        } else {
            alert('Payment amount is less than the total amount.');
        }
    });
});