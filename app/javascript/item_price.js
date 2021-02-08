window.addEventListener('input', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = inputValue * 0.1
    addTaxDom.innerHTML = Math.floor(tax);
    const salesProfit = document.getElementById("profit");
    const profit = inputValue - tax
    salesProfit.innerHTML = Math.floor(profit);
  });
});
