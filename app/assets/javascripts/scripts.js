document.addEventListener("DOMContentLoaded", function () {
    const paymentButton = document.getElementById("payment-button");

    if (paymentButton) {
        paymentButton.addEventListener("click", function (e) {
            const confirmed = confirm("Are you sure you want to process this payment?");
            if (!confirmed) {
                e.preventDefault();
            }
        });
    }
});
