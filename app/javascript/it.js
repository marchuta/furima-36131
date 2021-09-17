function test (){
  
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   console.log(inputValue);
   const addTaxDom = document.getElementById("add-tax-price");
   const margin = document.getElementById("profit");
   addTaxDom.innerHTML = Math.floor(inputValue* 0.1);
   margin.innerHTML = Math.floor(inputValue* 0.9);

})
 };
 
 window.addEventListener('load', test);